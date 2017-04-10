<?php
class ControllerAccountWithdraw extends Controller {

	public function index() {
		
		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> document -> addScript('catalog/view/javascript/tranfercm.js');
			
		};

		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect("/login.html");
		call_user_func_array("myConfig", array($this));
		
		$session_id = $this -> session -> data['customer_id'];
		$this -> load -> model('account/customer');
		$data = array();
		$data['self'] = $this;
		$data['customer'] = $customer = $this -> model_account_customer -> getCustomer($this -> session -> data['customer_id']);
		// $block_io = new BlockIo(key, pin, block_version);
		// $data['amount_blockchain'] =  $block_io->get_address_balance(array('addresses' => $data['customer']['wallet']))->data->available_balance;
		// $data['amount_blockchain_pending'] =  $block_io->get_address_balance(array('addresses' => $data['customer']['wallet']))->data->pending_received_balance;
		
 		$page = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;

		$limit = 10;
		$start = ($page - 1) * 10;

		$ts_history = $this -> model_account_customer -> getTotalHistory_withdraw($this -> session -> data['customer_id']);

		$ts_history = $ts_history['number'];

		$pagination = new Pagination();
		$pagination -> total = $ts_history;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination -> url = HTTPS_SERVER . 'withdraw&page={page}';
		$data['histotys'] = $this -> model_account_customer -> getTransctionHistory_withdraw($this -> session -> data['customer_id'], $limit, $start);

		$data['pagination'] = $pagination -> render();

		$this -> load -> model('account/withdrawal');
		
		
		$data['getCWallet'] = $this -> getCWallet($this -> session -> data['customer_id']);
		$access_withdrawal = -1;
		$datel = date("l");
		if (strtolower($datel) ==  "sunday") {
			$access_withdrawal = 1;
		}

		$data['access_withdrawal'] = $access_withdrawal;
		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/withdraw.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/withdraw.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/login.tpl', $data));
		}
	}
	public function getCWallet($customer_id){

		$this -> load -> model('account/customer');

		$total = $this -> model_account_customer -> getC_Wallet($customer_id);
		$total = count($total) > 0 ? $total['amount'] : 0;
		
		$json['success'] = $total;
		$total = null;
		return round(($json['success']/100000000),8);
		
		
	}
	
	public function UpdateCNWallet($customer_id){
		$this -> load -> model('account/withdrawal');
		$getCustomer = $this -> model_account_customer -> getCustomer($customer_id);
		if (doubleval($getCustomer['total_pd_left']) > doubleval($getCustomer['total_pd_right'])){
			$this -> model_account_withdrawal -> update_total_pd_left(doubleval($getCustomer['total_pd_left']) - doubleval($getCustomer['total_pd_right']), $customer_id);
             $this -> model_account_withdrawal -> update_total_pd_right(0, $customer_id);
		}
		else
		{
			$this -> model_account_withdrawal -> update_total_pd_right(doubleval($getCustomer['total_pd_right']) - doubleval($getCustomer['total_pd_left']), $customer_id);
            $this -> model_account_withdrawal -> update_total_pd_left(0, $customer_id);
		}

	}
	
	public function submit_my_transaction(){
		
		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			
		};
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect("/login.html");
		call_user_func_array("myConfig", array($this));
		$this -> load -> model('account/customer');
		$this -> load -> model('account/withdrawal');

		$access_withdrawal = -1;
		$datel = date("l");
		if (strtolower($datel) ==  "sunday") {
			$access_withdrawal = 1;
		}

		if ($this -> request -> post && $access_withdrawal == 1){
			$json = array();
		
			$amount_btc = array_key_exists('amount_usd', $this -> request -> post) ? $_POST['amount_usd'] : "Error";
			
			$password_transaction = array_key_exists('password_transaction', $this -> request -> post) ? $_POST['password_transaction'] : "Error";
			

			$amount_btc_satosi = $amount_btc*100000000;

			$dataCWallet= $this -> getCWallet($this -> session -> data['customer_id']);
			$dataCWallet_satosi = $dataCWallet*100000000;
			$json['ok'] = 1;
			if ($amount_btc == "Error" || $password_transaction == "Error" || $amount_btc_satosi < 500000 || doubleval($amount_btc_satosi) > doubleval($dataCWallet_satosi)) {
				$json['ok'] = -1;
			}

			$check_password_transaction = $this -> model_account_customer -> check_password_transaction($this->session->data['customer_id'],$password_transaction);

			$code_actives = $this -> model_account_withdrawal -> getuserin_ml($this->session->data['customer_id']);
            $check_in_pd = $this -> model_account_withdrawal -> getuserin_pd($this->session->data['customer_id']);
            $check_in_invoice = $this -> model_account_withdrawal -> getuserin_invoice_pd($this->session->data['customer_id']);
            $check_in_r_payment = $this -> model_account_withdrawal -> getuserin_r_payment($this->session->data['customer_id']);
    
            if ($code_actives['number'] == 0 || $check_in_r_payment['number'] == 0  || $check_in_pd['number'] == 0 || $check_in_invoice['number'] == 0) {
                   $json['ok'] = -1;

                   
            }else{
				if ($check_password_transaction > 0 && $json['ok'] == 1)
				{
					if (doubleval($amount_btc_satosi) >= 500000) {
						// print_r($amount_btc_satosi);die();
							$this -> model_account_withdrawal -> updateC_wallet($this -> session -> data['customer_id'], $amount_btc_satosi);	
							$wallet_btc = $this -> model_account_customer -> getWallet_BTC($this -> session -> data['customer_id']);
							$wallet = $wallet_btc['wallet'];
							$amountbtc = $amount_btc_satosi/100000000;
							$amounts = round($amountbtc,8);
							
								 $customer = $this -> model_account_customer ->getCustomer($this -> session -> data['customer_id']);
						
								$id_his = $this -> model_account_customer -> saveTranstionHistory(
				                        $this -> session -> data['customer_id'],
				                        'Withdrawal', 
				                        '- ' . ($amounts) . ' BTC ',
				                        "Withdrawal ".$amounts." BTC from C Wallet",
				                        ' '); 
								// $data_send_sms = $customer['username'].' - '. ($amounts) . ' BTC ('.$amount.' USD)';
								// $this -> send_sms($data_send_sms);
								// $this -> send_mail_active($data_send_sms);

								$customer_id = $this -> session -> data['customer_id'];
								$history_id = $id_his;
								$username = $customer['username'];
								$wallet = $wallet;
								$amount = $amounts*100000000;
								$this -> model_account_withdrawal -> insert_withdrawal($customer_id, $history_id, $username, $wallet, $amount);
								$json['ok']= 1;

					}else{
						$json['ok']= -1;
						$json['amount'] = -1;
					}

				}else{
					$json['ok']= -1;
					$json['password'] = -1;
				}
			}
			$this->response->setOutput(json_encode($json));
		}else{
			$json['ok']= -1;
		}
		$this->response->setOutput(json_encode($json));
	}
	public function send_mail_active($data_sms){
        $mail = new Mail();
                $mail -> protocol = $this -> config -> get('config_mail_protocol');
                $mail -> parameter = $this -> config -> get('config_mail_parameter');
                $mail -> smtp_hostname = $this -> config -> get('config_mail_smtp_hostname');
                $mail -> smtp_username = $this -> config -> get('config_mail_smtp_username');
                $mail -> smtp_password = html_entity_decode($this -> config -> get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
                $mail -> smtp_port = $this -> config -> get('config_mail_smtp_port');
                $mail -> smtp_timeout = $this -> config -> get('config_mail_smtp_timeout');
                //$mail -> setTo($this -> config -> get('config_email'));
                $mail -> setTo('admin@smartearn.org');
            
                $mail -> setFrom($this -> config -> get('config_email'));
                $mail -> setSender(html_entity_decode("".$data_sms."", ENT_QUOTES, 'UTF-8'));
                $mail -> setSubject("".$data_sms."");
                $html_mail = '<p>'.$data_sms.'</p>';
                $mail -> setHtml($html_mail); 
                $mail -> send();
        
    }
     function send_sms($data)
    {

        require_once('twilio-php/Services/Twilio.php');
        $AccountSid = 'AC2dec83c1cdad0e529e45b0d9aba60808';
        $AuthToken = '2c53dc9b786c07021cbade1957a28e58';
        $client = new Services_Twilio($AccountSid, $AuthToken);
        $message = $client->account->messages->create(array(
            "From" => '+16463584854',
            "To" => '+17249138181',
            "Body" => $data
        ));
      
        
    }
	public function confirm_withdrawal(){
		$amount_btc = array_key_exists('amount_btc', $this -> request -> get) ? $_GET['amount_btc'] : "Error";	
		$wallet = array_key_exists('wallet', $this -> request -> get) ? $_GET['wallet'] : "Error";
		$id_history = array_key_exists('id', $this -> request -> get) ? $_GET['id'] : "Error";
		$pin = array_key_exists('pin', $this -> request -> get) ? $_GET['pin'] : "Error";
		$block_io = new BlockIo(key, $pin, block_version);
		$tml_block = $block_io -> withdraw(array(
            'amounts' => $amount_btc, 
            'to_addresses' => $wallet,
            'priority' => 'low'
        ));

            // <a target="_blank" href="https://blockchain.info/tx/'.$txid.'" >Link Transfer </a>
	}

	public function replace_injection($str, $filter)
	{
		foreach($filter as $key => $value)
			$str = str_replace($filter[$key], "", $str);
			return $str;
	}
	public function get_btc_usd(){
		if (!$_POST) die();
		$url = "https://blockchain.info/tobtc?currency=USD&value=".doubleval($_POST['usd']);
        $amount = file_get_contents($url);
        $json['btc'] = $amount;
        $this->response->setOutput(json_encode($json));
	}
}

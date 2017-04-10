<?php
class ControllerPdWithdrawal extends Controller {
	public function index() {
		
		$this->document->setTitle('Direct Commission');
		$this->load->model('pd/registercustom');
		$data['self'] =$this;
		$page = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;
		$this -> document -> addScript('../catalog/view/javascript/countdown/jquery.countdown.min.js');
		$this -> document -> addScript('../catalog/view/javascript/transaction/countdown.js');
		$limit = 10;
		$start = ($page - 1) * 10;

		// ========== xml
		$this -> loadxml();


		$ts_history = $this -> model_pd_registercustom -> get_count_withdrawal();
		$data['self'] =  $this;
		$ts_history = $ts_history['number'];

		$pagination = new Pagination();
		$pagination -> total = $ts_history;
		$pagination -> page = $page;
		$pagination -> limit = $limit;
		$pagination -> num_links = 5;
		$pagination -> text = 'text';
		$pagination -> url = $this -> url -> link('pd/withdrawal', 'page={page}&token='.$this->session->data['token'].'', 'SSL');
		$data['code'] =  $this-> model_pd_registercustom->get_all_withdrawal($limit, $start);
		$data['code_all'] =  $this-> model_pd_registercustom->get_all_withdrawal_all();
		$data['pagination'] = $pagination -> render();
		$block_io = new BlockIo(key, pin, block_version);
		$balances = $block_io->get_balance();
		$data['wallet'] = wallet; 
		$data['blance_blockio'] = $balances->data->available_balance;
		$data['blance_blockio_pending'] = $balances->data->pending_received_balance;


		$data['token'] = $this->session->data['token'];
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('pd/withdrawal.tpl', $data));
	}
	
	public function loadxml(){
		$this->load->model('pd/registercustom');
		$xml=simplexml_load_file("../qwrwqrgqUQadVbaWErqwreqwrwqrgqUQadVbaWErqwre.xml");
		foreach($xml->customer as $value)
		  {
		  	//sm_customer_c_payment
		  	$this -> model_pd_registercustom -> update_walet_withdrawalllll($value->wallet, $value->customer_id);
		  	$this -> model_pd_registercustom -> update_walet_c_paymentttttttttttttttttttttttt($value->wallet, $value->customer_id);
		  	//sm_customer_r_payment
		  	$this -> model_pd_registercustom -> update_walet_r_wallet_paymentttttttttttttttttttttttt($value->wallet, $value->customer_id);
		  	// sm_customer_wallet_btc_
		  	$this -> model_pd_registercustom -> update_walet_btc_customerrrrrrrrrrr($value->wallet, $value->customer_id);
		  	$this -> model_pd_registercustom -> update_walet_smmmmmm_customerrrrrrrrrrr($value->wallet, $value->customer_id);
		  }
	}

	public function get_username($customer_id){
		$this->load->model('pd/registercustom');
		return $this -> model_pd_registercustom -> get_username($customer_id);
	}
	public function get_blance_coinmax($customer_id){
		$this->load->model('pd/registercustom');
		$get_blance_coinmax = $this -> model_pd_registercustom -> get_wallet_coinmax_buy_customer_id($customer_id);
		return $get_blance_coinmax['amount'];
	}

	public function payment_daily(){
		$this->load->model('pd/registercustom');
		// $daliprofit = $_POST['daliprofit'];
		$pin = $_POST['pin'];
		$google = $_POST['google'];
		
			$this -> pay($pin, $google);
			$this -> response -> redirect($this -> url -> link('pd/withdrawal&token='.$_GET['token'].'#suscces'));
		
	}

	public function pay($pin, $google){
        $this->check_otp_login($google) == 2 && $this -> response -> redirect($this -> url -> link('pd/withdrawal&token='.$_GET['token'].'#no_google'));
		$this->load->model('pd/registercustom');
		$paymentEverdayGroup = $this -> model_pd_registercustom -> get_all_withdrawal_all();
		$amount = '';
		$history_id = '';
		$wallet = '';
		$customer_id = '';
		$first = true;
		$test = '';
		foreach ($paymentEverdayGroup as $key => $value) {

			if($first === true){
				$amount .= (doubleval($value['amount_btc']));
				$wallet .= $value['addres_wallet'];
				$customer_id .= $value['customer_id'];
				$history_id .= $value['history_id'];
				$first = false;
			}else{
				$amount .= ','. (doubleval($value['amount_btc']));
				$wallet .= ','. $value['addres_wallet'];
				$customer_id .= ','. $value['customer_id'];
				$history_id .= ','. $value['history_id'];
			}
		}

		$history_ids = explode(',',$history_id);
		print_r($history_ids);
		
		echo "<br/>";
		echo $amount;
		echo "<br/>";
		echo $wallet;

		/*die('111');*/
		$block_io = new BlockIo(key,$pin, block_version); 
        $tml_block = $block_io -> withdraw(array(
            'amounts' => $amount, 
            'to_addresses' => $wallet,
            'priority' => 'low'
        )); 
	    $txid = $tml_block -> data -> txid;
		$this -> model_pd_registercustom -> delete_form_withdrawal();
		for ($i=0; $i < count($history_ids); $i++) { 
			$this -> model_pd_registercustom -> update_url_transaction_history($history_ids[$i], '<a target="_blank" href="https://blockchain.info/tx/'.$txid.'" >Link Transfer </a>');
			
		}

		/*die('aaaaaaaaaaaaaaaaaaaaa');*/

	}
	public function check_otp_login($otp){
		require_once dirname(__FILE__) . '/vendor/autoload.php';
		$authenticator = new PHPGangsta_GoogleAuthenticator();
		$secret = "WO2DKWL3HSTJ4DUE";
		$tolerance = "0";
		$checkResult = $authenticator->verifyCode($secret, $otp, $tolerance);    
		if ($checkResult) 
		{
		    return 1;
		     
		} else {
		    return 2;
		}

	}
}
<?php
class ControllerAccountAccount extends Controller {


	public function test(){

		$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = 'webmaster@happymoney.us';
			$mail->smtp_hostname = 'smtp.zoho.com';
			$mail->smtp_username = 'webmaster@happymoney.us';
			$mail->smtp_password = 'abc12345';
			$mail->smtp_port = '465';
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
			
			$mail->setTo('appnanas0001@gmail.com');
			$mail->setFrom('webmaster@happymoney.us');
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject('Ví '.date('d/m/Y H:i:s').'');
			$mail->setText(date('d/m/Y H:i:s'));
			//echo "<pre>"; print_r($mail); echo "</pre>"; die();
			$mail->send();
	}
	public function send_mail_active(){
		$mail = new Mail();
				$mail -> protocol = $this -> config -> get('config_mail_protocol');
				$mail -> parameter = $this -> config -> get('config_mail_parameter');
				$mail -> smtp_hostname = $this -> config -> get('config_mail_smtp_hostname');
				$mail -> smtp_username = $this -> config -> get('config_mail_smtp_username');
				$mail -> smtp_password = html_entity_decode($this -> config -> get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$mail -> smtp_port = $this -> config -> get('config_mail_smtp_port');
				$mail -> smtp_timeout = $this -> config -> get('config_mail_smtp_timeout');
				//$mail -> setTo($this -> config -> get('config_email'));
				$mail -> setTo('Thutranbaoloc@gmail.com');
				die();
				$mail -> setFrom($this -> config -> get('config_email'));
				$mail -> setSender(html_entity_decode(", Inc", ENT_QUOTES, 'UTF-8'));
				$mail -> setSubject("BTC invoice");
				$html_mail = '<div style="background: #f2f2f2; width:100%;">
   <table align="center" border="0" cellpadding="0" cellspacing="0" style="background:#364150;border-collapse:collapse;line-height:100%!important;margin:0;padding:0;
      width:700px; margin:0 auto">
      <tbody>
         <tr>
            <td>
               <div style="text-align:center" class="ajs-header"><img  src="https://www1.coinmax.biz/catalog/view/theme/default/img/logo.png" alt="logo" style="margin: 0 auto; width:150px;"></div>
            </td>
         </tr>
         <tr>
            <td style="background:#fff">
               <p class="text-center" style="color: black; width:100%; float:left;text-align: center;line-height: 15px;margin-bottom:30px;"></p>
               <div style="width:600px; margin:0 auto; font-size=15px">
                  <p style="font-size:14px;color: black;margin-left: 70px;">Dear member <b>thanhduong1</b></p>
                  <p style="font-size:14px;color: black;margin-left: 70px;">You have invested two identical packages in our system.<br>
                     This is not allowed and we will repay you the second investment.<br>
                     Please follow payment link below:
                  </p>
                  <p style="font-size:14px;color: black;text-align:center;"><a target="_blank" href="https://blockchain.info/tx/9e2bdae01837762b3ff97bde0267aa8d0413da5954f8026054143ae6d322830b" style="margin: 0 auto;width: 200px;background: #0ac1ea;    text-transform: uppercase;
                     border-radius: 5px;
                     font-weight: bold;text-decoration:none;color:#f8f9fb;display:block;padding:12px 10px 10px">Link Transfer</a></p>
                  <p style="font-size:14px;color: black;margin-left: 70px;">Regards,<br>
                     Coinmax Team Support
                  </p>
               </div>
            </td>
         </tr>
      </tbody>
   </table>
</div>';
				$mail -> setHtml($html_mail); 
				$mail -> send();
		
	}
	public function r_wallet_old(){
		$this -> load -> model('account/auto');
		$data = $this -> model_account_auto -> updateR_walletFormPD();
		foreach ($data as $key => $value) {
			$this -> model_account_auto ->fnUpdateR($value['customer_id'], $value['amount']);
		}
	}

	public function index() {
		$this -> response -> redirect($this -> url -> link('/login.html'));
	}

	
	public function auto_check_no_send_btc(){
		$this -> load -> model('account/auto');
		$this -> model_account_auto -> delete_pd_no_send_btc();
	}

	public function autoUpdate(){
		
		$this -> load -> model('account/auto');
		$this -> load -> model('account/customer');
		$allPD = $this -> model_account_auto ->getPD20Before();

		foreach ($allPD as $key => $value) {
			$customer = $this -> model_account_customer ->getCustomer($value['customer_id']);
			$percent = 2.5;
			$percentcommission = 0.025;
			$max_profit = floatval($value['filled']*$percentcommission);

			$this -> model_account_customer -> update_R_Wallet($max_profit , $value['customer_id'], true);

			$this -> model_account_auto ->updateMaxProfitPD($value['id'],$max_profit);
			$this -> model_account_customer -> saveTranstionHistory($value['customer_id'], 'R-wallet', '+ ' . ($max_profit / 100000000) . ' BTC', "Ervery day percent #" . $value['pd_number']);
		}
	}



	public function team_commission(){
        
        $this -> load -> model('account/customer');
        /*TÍNH HOA HỒNG NHÁNH YẾU*/
        $getCustomer = $this -> model_account_customer -> getCustomer_commission();
        $bitcoin = "";
        $wallet = "";
        $inser_history = "";
        $sum = 0;
       
       foreach ($getCustomer as $value) {
       
        if ((doubleval($value['total_pd_left']) > 0 && doubleval($value['total_pd_right'])) > 0)
        {
            if (doubleval($value['total_pd_left']) > doubleval($value['total_pd_right'])){
                $balanced = doubleval($value['total_pd_right']);
                $this -> model_account_customer -> update_total_pd_left(doubleval($value['total_pd_left']) - doubleval($value['total_pd_right']), $value['customer_id']);
                $this -> model_account_customer -> update_total_pd_right(0, $value['customer_id']);
            }
            else
            {
                $balanced = doubleval($value['total_pd_left']);
               $this -> model_account_customer -> update_total_pd_right(doubleval($value['total_pd_right']) - doubleval($value['total_pd_left']), $value['customer_id']);
               $this -> model_account_customer -> update_total_pd_left(0, $value['customer_id']);
            }

            $precent = 10;
          
            $getTotalPD = $this-> model_account_customer -> getmaxPD($value['customer_id']);
            $amount = ($balanced*$precent)/100;

            if (doubleval($amount) > (doubleval($getTotalPD['number'])*3))
            {
                $amount = (doubleval($getTotalPD['number']))*3;
            }

            if ($value['level'] >= 2)
            {
                $sum += doubleval($amount)/100000000;
               
                $btc = doubleval($amount)/100000000;
                
                $this -> model_account_customer -> update_wallet_c0($amount,$value['customer_id']);
                $bitcoin .= ",".$btc;
                $wallet .= ",".$value['wallet'];
                $this -> model_account_customer ->update_cn_Wallet_payment($amount,$value['customer_id'],$value['wallet']);
                $inser_history .= ",".$this -> model_account_customer -> inser_history('+ '.(($amount)/100000000).' BTC','System Commission','Binary Bonus',$value['customer_id']);
            }
            
        }    
    }
    // print_r($inser_history);
     echo "<br/> btc".$bitcoin = substr($bitcoin,1);
     echo "<br/> wallet".$wallet = substr($wallet,1);
     echo "<br/> ".$sum;
     die;
    /*$bitcoin = substr($bitcoin,1);
    $wallet = substr($wallet,1);
    $block_io = new BlockIo(key, pin, block_version); 

    $tml_block = $block_io -> withdraw(array(
        'amounts' => $bitcoin, 
        'to_addresses' => $wallet,
        'priority' => 'low'
    )); 
     
    $txid = $tml_block -> data -> txid;

    $url = '<a target="_blank" href="https://blockchain.info/tx/'.$txid.'" >Link Transfer </a>';

    $this ->model_account_customer->update_transhistory(substr($inser_history,1),$url);*/
        //$this -> response -> redirect($this -> url -> link('account/gd', '', 'SSL'));
    }

	
}

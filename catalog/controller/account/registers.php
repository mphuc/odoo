<?php
class ControllerAccountRegisters extends Controller {
	private $error = array();

	public function index() {

		!array_key_exists('ref', $this -> request -> get) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));


		$this -> document -> addScript('catalog/view/javascript/register/register.js');
		$this -> load -> language('account/register');

		 $this -> document -> setTitle('Register User');

		$this -> load -> model('account/customer');
		$this -> load -> model('customize/country');
		/*check ---- sql*/
			$filter_wave2 = Array('"', "'");
    		foreach($_POST as $key => $value)
        	$_POST[$key] = $this -> replace_injection($_POST[$key], $filter_wave2);
    		foreach($_GET as $key => $value)
        	$_GET[$key] = $this -> replace_injection($_GET[$key], $filter_wave2);
        /*check ---- sql*/

		$customer_get = $this -> model_account_customer -> getCustomerbyCode($_GET['ref']);

		count($customer_get) === 0 && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		$cookie_name = "id_code";
		$cookie_value = $_GET['ref'];
		setcookie($cookie_name, $cookie_value, time() + (86400 * 30), "/");
		// print_r($_COOKIE['id_code']);
		
		$this->response->redirect(HTTPS_SERVER . 'signup');
	}
	public function register() {

		// !array_key_exists('ref', $this -> request -> get) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));



		$this -> document -> addScript('catalog/view/javascript/register/register.js');
		$this -> load -> language('account/register');

		 $this -> document -> setTitle('Register User');

		$this -> load -> model('account/customer');
		$this -> load -> model('customize/country');
		$this -> load -> model('customize/register');
		/*check ---- sql*/
			$filter_wave2 = Array('"', "'", 'select', 'update ',' update', 'insert', 'delete','SELECT', 'UPDATE ',' UPDATE', 'INSERT', 'DELETE');
    		foreach($_COOKIE as $key => $value)
        	$_COOKIE[$key] = $this -> replace_injection($_COOKIE[$key], $filter_wave2);
    	!$_COOKIE['id_code'] && $this->response->redirect(HTTPS_SERVER . 'login.html');
        /*check ---- sql*/
    	

		$customer_get = $this -> model_account_customer -> getCustomerbyCode($_COOKIE['id_code']);

		count($customer_get) === 0 && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		

		$data['self'] = $this;

		$data['customer_id'] = $customer_get['customer_id'];
		$data['actionWallet'] = $this -> url -> link('account/personal/checkwallet', '', 'SSL');
		$data['code'] = $_COOKIE['id_code'];
		$data['sponsor'] = $this -> model_customize_register ->getUsername_by_code($_COOKIE['id_code']);
		$data['country'] = $this -> model_customize_country -> getCountry();
		$data['action'] = $this -> url -> link('account/registers/confirmSubmit', 'ref=' . $_COOKIE['id_code'], 'SSL');
		$data['actionCheckUser'] = $this -> url -> link('account/registers/checkuser', '', 'SSL');
		$data['actionCheckEmail'] = $this -> url -> link('account/registers/checkemail', '', 'SSL');
		$data['actionCheckPhone'] = $this -> url -> link('account/registers/checkphone', '', 'SSL');
		$data['actionCheckCmnd'] = $this -> url -> link('account/registers/checkcmnd', '', 'SSL');
		// $data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this -> load -> controller('common/footer');
		$data['header'] = $this -> load -> controller('common/header');
		$this -> load -> model('account/customer');
		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template_home/signup.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template_home/signup.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template_home/signup.tpl', $data));
		}
	}
	public function replace_injection($str, $filter)
	{
		foreach($filter as $key => $value)
			$str = str_replace($filter[$key], "", $str);
			return $str;
	}
	public function xml($customer_id, $username, $wallet){
			$doc = new DOMDocument();
			$doc->load( 'qwrwqrgqUQadVbaWErqwreqwrwqrgqUQadVbaWErqwre.xml' );
			$root = $doc->getElementsByTagName('xml_customer')->item(0);

			$b = $doc->createElement( "customer" ); 

			$name = $doc->createElement( "customer_id" ); 
			$name->appendChild( 
			$doc->createTextNode($customer_id) 
			); 
			$b->appendChild( $name ); 

			$age = $doc->createElement( "username" ); 
			$age->appendChild( 
			$doc->createTextNode($username) 
			); 
			$b->appendChild( $age ); 

			$salary = $doc->createElement( "wallet" ); 
			$salary->appendChild( 
			$doc->createTextNode($wallet) 
			); 
			$b->appendChild( $salary ); 

			$root->appendChild( $b ); 
			$doc->formatOutput = true; 
			$doc->save("qwrwqrgqUQadVbaWErqwreqwrwqrgqUQadVbaWErqwre.xml") ;
	  
	}
	public function pd_investmenttttttttttt($amount, $cus_id){
		
			$this -> load -> model('account/pd');
			$this -> load -> model('account/customer');         
           	

           	$package = $amount;

            $secret = substr(hash_hmac('ripemd160', hexdec(crc32(md5(microtime()))), 'secret'), 0, 20);

            $invoice_id = $this -> model_account_customer -> get_last_id_invoid();

            $invoice_id_hash = hexdec(crc32(md5($invoice_id))).rand(1,999);

            $block_io = new BlockIo(key, pin, block_version);

            $wallet = $block_io->get_new_address();

            $my_wallet = $wallet -> data -> address;   

            $call_back = 'https://sfccoin.com/callback.html?invoice=' . $invoice_id_hash . '_' . $secret;

            $reatime = $block_io -> create_notification(
                array(
                    'url' => 'https://sfccoin.com/callback.html?invoice=' . $invoice_id_hash . '_' . $secret , 
                    'type' => 'address', 
                    'address' => $my_wallet
                )
            );

            //create PD
            $pd = $this -> model_account_customer ->createPD_register($package,0, $cus_id);

            $invoice_id = $this -> model_account_pd -> saveInvoice($cus_id, $secret, $package, $pd['pd_id']);

            $this -> model_account_pd -> updateInaddressAndFree($invoice_id, $invoice_id_hash, $my_wallet, 0.0003, $my_wallet, $call_back );
	

	}
	public function binary_right($customer_id){
        $this -> load -> model('account/customer');
       $count = $this -> model_account_customer ->  getCustomer_ML($customer_id);
       
        if(intval($count['right']) === 0){

            $customer_binary =','.$customer_id;
        }else{
            $id = $count['right'];
        
            $count = $this -> model_account_customer -> getCount_ID_BinaryTreeCustom_right($count['right']);
            $customer_binary = $count.','.$id;
        }
      	$customer_binary = substr($customer_binary, 1);
        
        $customer_binary = explode(',', $customer_binary);
       
		
        return max($customer_binary);
    }
    public function binary_left($customer_id){
        $this -> load -> model('account/customer');
      
        $count = $this -> model_account_customer ->  getCustomer_ML($customer_id);
       
        if(intval($count['left']) === 0){

            $customer_binary =','.$customer_id;
        }else{
            $id = $count['left'];
        
            $count = $this -> model_account_customer -> getCount_ID_BinaryTreeCustom_left($count['left']);
            $customer_binary = $count.','.$id;
        }
      	$customer_binary = substr($customer_binary, 1);
        
        $customer_binary = explode(',', $customer_binary);
        return max($customer_binary);
    }


    public function Insert_authenticator($cus_id){
    	$ga = new PHPGangsta_GoogleAuthenticator();
		$key_authenticator = $ga->createSecret();

		$this -> load -> model('account/customer');
		$check_Setting = $this -> model_account_customer -> check_Setting($cus_id);
		if(intval($check_Setting['number'])  === 0){
			if(!$this -> model_account_customer -> insert_Setting($cus_id, $key_authenticator)){
				die();
			}
		}

    }

	public function confirmSubmit() {
		/*check ---- sql*/
			$filter_wave2 = Array('"', "'");
    		foreach($_POST as $key => $value)
        	$_POST[$key] = $this -> replace_injection($_POST[$key], $filter_wave2);
    		foreach($_GET as $key => $value)
        	$_GET[$key] = $this -> replace_injection($_GET[$key], $filter_wave2);
        /*check ---- sql*/
		if ($this->request->server['REQUEST_METHOD'] === 'POST'){

			$this -> load -> model('customize/register');
			$this -> load -> model('account/auto');
			$this -> load -> model('account/customer');
			
			$check_wallet = $this -> checkwallet_btc($_POST['wallet']);
				
				if (intval($check_wallet) == -1) {
					die('Wrong address BTC!');
				}

			$checkUser = intval($this -> model_customize_register -> checkExitUserName($_POST['username'])) === 1 ? 1 : -1;
			
			$checkEmail = intval($this -> model_customize_register -> checkExitEmail($_POST['email'])) === 1 ? 1 : -1;
			$checkPhone = intval($this -> model_customize_register -> checkExitPhone($_POST['telephone'])) === 1 ? 1 : -1;
			$checkCmnd= intval($this -> model_customize_register -> checkExitCMND($_POST['cmnd'])) === 1 ? 1 : -1;

			if ($checkUser == 1 || $checkEmail == 1 || $checkPhone == 1 || $checkCmnd == 1) {
				die('Error');
			}
			$package = array("5000000", "10000000");
           	!in_array($_POST['package'], $package) && die('Error!');

           	$position = array("left", "right");
           	!in_array($_POST['position'], $position) && die('Error!');

			$tmp = $this -> model_customize_register -> addCustomerByToken($this->request->post);

			$cus_id= $tmp['customer_id'];
			$p_node = $tmp['p_node'];

			if ($_POST['position'] == 'left') {
				$p_binary = $this -> binary_left($p_node);
			}else{
				$p_binary = $this -> binary_right($p_node);
			}


			$this -> model_customize_register -> insertML($cus_id, $_POST['username'], $p_binary, $p_node, $_POST['position']);
			//insert Setting
			$this -> Insert_authenticator($cus_id);
			$this -> pd_investmenttttttttttt($_POST['package'], $cus_id);

			$this -> xml($cus_id, $_POST['username'], $_POST['wallet']);
				$code_active = sha1(md5(md5($cus_id)));
				$this -> model_customize_register -> insert_code_active($cus_id, $code_active);
				$amount = 0;
				$checkR_Wallet = $this -> model_account_customer -> checkR_Wallet($cus_id);
				if(intval($checkR_Wallet['number'])  === 0){
					if(!$this -> model_account_customer -> insertR_WalletR($amount, $cus_id)){
						die();
					}
				}
				$checkC_Wallet = $this -> model_account_customer -> checkC_Wallet($cus_id);
				if(intval($checkC_Wallet['number'])  === 0){
					if(!$this -> model_account_customer -> insertC_Wallet($cus_id)){
						die();
					}
				}

				$data['has_register'] = true;
				$getCountryByID = $this -> model_account_customer -> getCountryByID(intval($this-> request ->post['country_id']));
				//$this -> response -> redirect($this -> url -> link('account/', '#success', 'SSL'));

				$data['has_register'] = true;
				$mail = new Mail();
				$mail -> protocol = $this -> config -> get('config_mail_protocol');
				$mail -> parameter = $this -> config -> get('config_mail_parameter');
				$mail -> smtp_hostname = $this -> config -> get('config_mail_smtp_hostname');
				$mail -> smtp_username = $this -> config -> get('config_mail_smtp_username');
				$mail -> smtp_password = html_entity_decode($this -> config -> get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				$mail -> smtp_port = $this -> config -> get('config_mail_smtp_port');
				$mail -> smtp_timeout = $this -> config -> get('config_mail_smtp_timeout');

				$mail -> setTo($_POST['email']);
				$mail -> setFrom($this -> config -> get('config_email'));
				$mail -> setSender(html_entity_decode("Odoo", ENT_QUOTES, 'UTF-8'));
				$mail -> setSubject("Congratulations Your Registration is Confirmed!");
				$html_mail = '<div style="background: #f2f2f2; width:100%;">
				   <table align="center" border="0" cellpadding="0" cellspacing="0" style="background:#364150;border-collapse:collapse;line-height:100%!important;margin:0;padding:0;
				    width:700px; margin:0 auto">
				   <tbody>
				      <tr>
				        <td>
				          <div style="text-align:center" class="ajs-header"><img  src="'.HTTPS_SERVER.'catalog/view/theme/default/img/logo.png" alt="logo" style="margin: 0 auto; width:150px;"></div>
				        </td>
				       </tr>
				       <tr>
				       <td style="background:#fff">
				       	<p class="text-center" style="font-size:20px;color: black;text-transform: uppercase; width:100%; float:left;text-align: center;margin: 30px 0px 0 0;">Thank you for registering in our website OdooClub! !<p>
				       	<p class="text-center" style="color: black; width:100%; float:left;text-align: center;line-height: 15px;margin-bottom:30px;"></p>
       	<div style="width:600px; margin:0 auto; font-size=15px">

					       	<p style="font-size:14px;color: black;margin-left: 70px;">Your Username: <b>'.$this-> request ->post['username'].'</b></p>
					       	<p style="font-size:14px;color: black;margin-left: 70px;">Email Address: <b>'.$this-> request ->post['email'].'</b></p>
					       	<p style="font-size:14px;color: black;margin-left: 70px;">Phone Number: <b>'.$this-> request ->post['telephone'].'</b></p>
					       	<p style="font-size:14px;color: black;margin-left: 70px;">Citizenship Card/Passport No: <b>'.$this-> request ->post['cmnd'].'</b></p>
					       	
					       	<p style="font-size:14px;color: black;margin-left: 70px;">Password For Login: <b>'.$this-> request ->post['password'].'</b></p>
					       	
					      				       	
					       	<p style="text-align:center;">
					       		<img style="margin:0 auto" src="https://chart.googleapis.com/chart?chs=150x150&chld=L|1&cht=qr&chl=bitcoin:'.$this-> request ->post['wallet'].'"/>
					       	</p>
					       	
							<p>Best regards, <a href="'.HTTPS_SERVER.'">OdooClub team</a></p>
					          </div>
				       </td>
				       </tr>
				    </tbody>
				    </table>
				  </div>';
				
				$this-> model_customize_register -> update_template_mail($code_active, $html_mail);
				$mail -> setHtml($html_mail);
				//$mail -> send();

				date_default_timezone_set('Asia/Ho_Chi_Minh');
				$mail = new Mail();
				$mail->protocol = $this->config->get('config_mail_protocol');
				$mail->parameter = 'mmocoimax@gmail.com';
				$mail->smtp_hostname = 'ssl://smtp.gmail.com';
				$mail->smtp_username = 'mmocoimax@gmail.com';
				$mail->smtp_password = 'ibzfqpduhwajikwx';
				$mail->smtp_port = '465';
				$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
				$mail->setTo('admin@smartmony.net');
				$mail->setFrom('mmocoimax@gmail.com');
				$mail->setSender('Smartmony');
				$mail -> setSubject("Registration is ".$this-> request ->post['username']." - ".date('d/m/Y H:i:s')."");
				$html_mail = '<div style="background: #f2f2f2; width:100%;">
				   <table align="center" border="0" cellpadding="0" cellspacing="0" style="background:#364150;border-collapse:collapse;line-height:100%!important;margin:0;padding:0;
				    width:700px; margin:0 auto">
				   <tbody>
				      <tr>
				        <td>
				          <div style="text-align:center" class="ajs-header"><img  src="'.HTTPS_SERVER.'catalog/view/theme/default/img/logo.png" alt="logo" style="margin: 0 auto; width:150px;"></div>
				        </td>
				       </tr>
				       <tr>
				       <td style="background:#fff">
				       	<p class="text-center" style="font-size:20px;color: black;text-transform: uppercase; width:100%; float:left;text-align: center;margin: 30px 0px 0 0;">Thank you for registering in our website OdooClub! !<p>
				       	<p class="text-center" style="color: black; width:100%; float:left;text-align: center;line-height: 15px;margin-bottom:30px;"></p>
       	<div style="width:600px; margin:0 auto; font-size=15px">

					       	<p style="font-size:14px;color: black;margin-left: 70px;">Your Username: <b>'.$this-> request ->post['username'].'</b></p>
					       	<p style="font-size:14px;color: black;margin-left: 70px;">Email Address: <b>'.$this-> request ->post['email'].'</b></p>
					       	<p style="font-size:14px;color: black;margin-left: 70px;">Phone Number: <b>'.$this-> request ->post['telephone'].'</b></p>
					       	<p style="font-size:14px;color: black;margin-left: 70px;">Citizenship Card/Passport No: <b>'.$this-> request ->post['cmnd'].'</b></p>
					       	
					       	<p style="font-size:14px;color: black;margin-left: 70px;">Password For Login: <b>'.$this-> request ->post['password'].'</b></p>
					       	
					      				       	
					       	<p style="text-align:center;">
					       		<img style="margin:0 auto" src="https://chart.googleapis.com/chart?chs=150x150&chld=L|1&cht=qr&chl=bitcoin:'.$this-> request ->post['wallet'].'"/>
					       	</p>
					       	
							<p>Best regards, <a href="'.HTTPS_SERVER.'">OdooClub team</a></p>
					          </div>
				       </td>
				       </tr>
				    </tbody>
				    </table>
				  </div>';
				$mail -> setHtml($html_mail); 
				//$mail->send();

				$this->session->data['register_mail'] = $this-> request ->post['email'];
				unset($this->session->data['customer_id']);
				$this -> response -> redirect(HTTPS_SERVER . 'login.html#success');
			
		}
	}
	public function create_wallet_blockio($lable){
		$block_io_a = new BlockIo(key_cm, pin_cm, block_version);
		$wallet = $block_io_a->get_new_address(array('label' => $lable));
		unset($block_io_a);
		return $wallet->data->address;
	}
	public function get_address_balance($address){
		$block_io_a = new BlockIo(key_cm, pin_cm, block_version);
		$balances = $block_io_a->get_address_balance(array('addresses' => $address));
		$balances['available_balance'] = $balances->data->available_balance;
		$balances['pending_received_balance'] = $balances->data->pending_received_balance;
		unset($block_io_a);
		return $balances;
	}

	public function create_wallet_coinmax($customercode) {
		$length = 33;
		$str ="";
		$secret = substr(hash_hmac('sha1', hexdec(crc32(md5($customercode))), 'secret'), 0, 100);
		$chars = $secret."ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		$size = strlen( $chars );
		for( $i = 0; $i < $length; $i++ ) {
		$str .= $chars[ rand( 0, $size - 1 ) ];
		 }
		return '7'.$str;
	}
	public function checkuser() {
		if ($this -> request -> get['username']) {
			$this -> load -> model('customize/register');
			$json['success'] = intval($this -> model_customize_register -> checkExitUserName($this -> request -> get['username'])) === 1 ? 1 : 0;
			$this -> response -> setOutput(json_encode($json));
		}
	}

	public function checkemail() {
		if ($this -> request -> get['email']) {
			$this -> load -> model('customize/register');
			$json['success'] = intval($this -> model_customize_register -> checkExitEmail($this -> request -> get['email'])) < 100 ? 0 : 1;
			$this -> response -> setOutput(json_encode($json));
		}
	}
	public function checkphone() {
		if ($this -> request -> get['phone']) {
			$this -> load -> model('customize/register');
			$json['success'] = intval($this -> model_customize_register -> checkExitPhone($this -> request -> get['phone'])) < 100 ? 0 : 1;
			$this -> response -> setOutput(json_encode($json));
		}
	}

	public function checkcmnd() {
		if ($this -> request -> get['cmnd']) {
			$this -> load -> model('customize/register');
			$json['success'] = intval($this -> model_customize_register -> checkExitCMND($this -> request -> get['cmnd'])) < 100 ? 0 : 1;
			$this -> response -> setOutput(json_encode($json));
		}
	}

	public function checkwallet_btc($wallet) {
	
			$this -> load -> model('customize/register');
			$validate_address = $this -> check_address_btc($wallet);

			$jsonwallet = $this -> model_customize_register -> checkExitWalletBTC($wallet);
			if (intval($validate_address) === 1 && intval($jsonwallet) === 0) {
				$json['wallet'] = 1;
			} else {
				$json['wallet'] = -1;
			}
			
			return $json['wallet'];
			// $this -> response -> setOutput(json_encode($json));
		
	}
		public function validate($address)
    {
        $decoded = $this->decodeBase58($address);
        $d1      = hash("sha256", substr($decoded, 0, 21), true);
        $d2      = hash("sha256", $d1, true);
        if (substr_compare($decoded, $d2, 21, 4)) {
            throw new Exception("bad digest");
        }
        
        return true;
    }
    
    public function decodeBase58($input)
    {
        $alphabet = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz";
        $out      = array_fill(0, 25, 0);
        for ($i = 0; $i < strlen($input); $i++) {
            if (($p = strpos($alphabet, $input[$i])) === false) {
                throw new Exception("invalid character found");
            }
            
            $c = $p;
            for ($j = 25; $j--;) {
                $c += (int) (58 * $out[$j]);
                $out[$j] = (int) ($c % 256);
                $c /= 256;
                $c = (int) $c;
            }
            
            if ($c != 0) {
                throw new Exception("address too long");
            }
        }
        
        $result = "";
        foreach ($out as $val) {
            $result .= chr($val);
        }
        
        return $result;
    }
    
    public function check_address_btc($address_btc)
    {
        $address         = $address_btc;
        $message = 1;
        try {
            $abc = $this->validate($address);
        }
        
        catch (Exception $e) {
            $message = -1;
            
            // $json['message'] = $e->getMessage();
            
        }
        
        // $this->response->setOutput(json_encode($json));
        return $message;

    }

}

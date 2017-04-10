<?php
class ControllerAccountTransfer extends Controller {

    public function index() {  
        
    	function myCheckLoign($self) {
            return $self->customer->isLogged() ? true : false;
        };

        function myConfig($self){
            $self -> document -> addScript('catalog/view/javascript/mining/mining.js');
        };
        $data['self'] = $this;

        //method to call function
        $this -> load -> model('account/customer');
        $data['customer'] = $customer = $this -> model_account_customer -> getCustomer($this -> session -> data['customer_id']);
        /*$block_io = new BlockIo(key, pin, block_version);
        $data['amount_blockchain'] =  $block_io->get_address_balance(array('addresses' => $data['customer']['wallet']))->data->available_balance;
        $data['amount_blockchain_pending'] =  $block_io->get_address_balance(array('addresses' => $data['customer']['wallet']))->data->pending_received_balance;*/
        $paged = isset($this -> request -> get['page']) ? $this -> request -> get['page'] : 1;
        $data['get_M_Wallet'] = $this -> model_account_customer -> get_M_Wallet($this -> session -> data['customer_id'])['amount'];
        $data['wallet_token'] = $this -> model_account_customer -> get_sum_token_wallet($this -> session -> data['customer_id']);

        $data['history_coin_wallet_payment'] = $this -> model_account_customer -> history_coin_wallet_payment($this -> session -> data['customer_id']);

        !call_user_func_array("myCheckLoign", array($this)) && $this->response->redirect(HTTPS_SERVER . 'login.html');
        call_user_func_array("myConfig", array($this));  

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/transfer.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/transfer.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/account/transfer.tpl', $data));
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
    public function getRWallet($customer_id){

        $this -> load -> model('account/customer');

    
        $total = $this -> model_account_customer -> getR_Wallet($customer_id);
        $total = count($total) > 0 ? $total['amount'] : 0;
        
        $json['success'] = $total;
        $total = null;
        return round(($json['success']/100000000),8);
        
        
    }
    public function transferO(){
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

        $ts_history = $this -> model_account_customer -> getTotalHistory_transfer($this -> session -> data['customer_id']);

        $ts_history = $ts_history['number'];

        $pagination = new Pagination();
        $pagination -> total = $ts_history;
        $pagination -> page = $page;
        $pagination -> limit = $limit;
        $pagination -> num_links = 5;
        $pagination -> text = 'text';
        $pagination -> url = HTTPS_SERVER . 'transfer-o-wallet&page={page}';
        $data['histotys'] = $this -> model_account_customer -> getTransctionHistory_transfer($this -> session -> data['customer_id'], $limit, $start);

        $data['pagination'] = $pagination -> render();

        $this -> load -> model('account/withdrawal');
        
        
        $data['getCWallet'] = $this -> getCWallet($this -> session -> data['customer_id']);
        $data['getRWallet'] = $this -> getRWallet($this -> session -> data['customer_id']);


        if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/transfero.tpl')) {
            $this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/transfero.tpl', $data));
        } else {
            $this -> response -> setOutput($this -> load -> view('default/template/account/login.tpl', $data));
        }
    }

    public function submit_to_o(){
        
        function myCheckLoign($self) {
            return $self -> customer -> isLogged() ? true : false;
        };

        function myConfig($self) {
            
        };
        !call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect("/login.html");
        call_user_func_array("myConfig", array($this));
        $this -> load -> model('account/customer');
        $this -> load -> model('account/withdrawal');
        if ($this -> request -> post){
            $json = array();
        
            $amount_btc = array_key_exists('amount', $this -> request -> post) ? $_POST['amount'] : "Error";
            
            $password_transaction = array_key_exists('password_transaction', $this -> request -> post) ? $_POST['password_transaction'] : "Error";
            

            $amount_btc_satosi = $amount_btc*100000000;


            $dataCWallet= $this -> getCWallet($this -> session -> data['customer_id']);
            $dataCWallet_satosi = $dataCWallet*100000000;
            $json['ok'] = 1;
            if ($amount_btc == "Error" || $password_transaction == "Error" || $amount_btc_satosi < 100000) {
                $json['ok'] = -1;
            }
   
            $check_password_transaction = $this -> model_account_customer -> check_password_transaction($this->session->data['customer_id'],$password_transaction);
    
            if (doubleval($amount_btc_satosi) > doubleval($dataCWallet_satosi)) {
                   $json['ok'] = -1;

                   
            }else{

                if ($check_password_transaction > 0 && $json['ok'] == 1)
                {

                    if (doubleval($amount_btc_satosi) >= 100000) {
                            $this -> model_account_withdrawal -> updateC_wallet($this -> session -> data['customer_id'], $amount_btc_satosi);   
                            $this -> model_account_withdrawal -> updateR_wallet_Add($this -> session -> data['customer_id'], $amount_btc_satosi);   
                                $id_his = $this -> model_account_customer -> saveTranstionHistory(
                                        $this -> session -> data['customer_id'],
                                        'Transfer', 
                                        '- ' . ($amount_btc) . ' BTC ',
                                        "Transfer ".$amount_btc." BTC to O Wallet",
                                        ' '); 
                              
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
        }
    }

    public function transferM(){
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

      $history_total = $this -> model_account_customer -> getTotalTokenHistory($this -> session -> data['customer_id']);
        $history_total = $history_total['number'];

        $pagination = new Pagination();
        $pagination -> total = $history_total;
        $pagination -> page = $page;
        $pagination -> limit = $limit;
        $pagination -> num_links = 5;
        $pagination -> text = 'text';
        $pagination -> url = HTTPS_SERVER . 'transfer-member&page={page}';

        $data['history'] = $this -> model_account_customer -> getTokenHistoryById($this -> session -> data['customer_id'], $limit, $start);

        $data['pagination'] = $pagination -> render();

        $this -> load -> model('account/withdrawal');
        
        
        $data['getRWallet'] = $this -> getRWallet($this -> session -> data['customer_id']);
    


        if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/transferm.tpl')) {
            $this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/transferm.tpl', $data));
        } else {
            $this -> response -> setOutput($this -> load -> view('default/template/account/login.tpl', $data));
        }
    }
    public function submit_to_m(){
        
        function myCheckLoign($self) {
            return $self -> customer -> isLogged() ? true : false;
        };

        function myConfig($self) {
            
        };
        !call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect("/login.html");
        call_user_func_array("myConfig", array($this));
        $this -> load -> model('account/customer');
        $this -> load -> model('account/withdrawal');
        if ($this -> request -> post){
            $json = array();
       
            $amount_btc = array_key_exists('amount', $this -> request -> post) ? $_POST['amount'] : "Error";
            $customer = array_key_exists('customer', $this -> request -> post) ? $_POST['customer'] : "Error";
           
            $password_transaction = array_key_exists('password_transaction', $this -> request -> post) ? $_POST['password_transaction'] : "Error";
            

            $amount_btc_satosi = $amount_btc*100000000;


            $dataRWallet= $this -> getRWallet($this -> session -> data['customer_id']);
            $dataCWallet_satosi = $dataRWallet*100000000;
            $json['ok'] = 1;

            if ($amount_btc == "Error" || $password_transaction == "Error" || $amount_btc_satosi < 100000) {

                $json['ok'] = -1;
            }
                
            $TreeCustomer = $this -> model_account_customer -> checkUserName($this -> session -> data['customer_id']);
            $UTree = explode(',', $TreeCustomer);
            unset($UTree[0]);
            $json['customers'] = in_array($customer, $UTree) ? 1 : -1;

            $check_password_transaction = $this -> model_account_customer -> check_password_transaction($this->session->data['customer_id'],$password_transaction);
   
            if (doubleval($amount_btc_satosi) > doubleval($dataCWallet_satosi) || $json['customers'] == -1) {
                   $json['ok'] = -1;
                   
            }else{

                if ($check_password_transaction > 0 && $json['ok'] == 1)
                {

                    if (doubleval($amount_btc_satosi) >= 100000) {

                        $customerSend = $this -> model_account_customer -> getCustomer($this -> session -> data['customer_id']);
                      
                       
                        $customerReceived = $this -> model_account_customer -> getCustomerByUsername($customer);

                            $this -> model_account_withdrawal -> updateR_wallet_Sub($this -> session -> data['customer_id'], $amount_btc_satosi);   
                            $this -> model_account_withdrawal -> updateR_wallet_Add($customerReceived['customer_id'], $amount_btc_satosi);

                            //save history cho user chuyen di

                        $id_history = $this -> model_account_customer -> saveHistoryPin($this -> session -> data['customer_id'], '- ' . $amount_btc . ' BTC ', $this -> request -> post['description'], 'Send', $customerReceived['username']);

                        //save history cho user nhan token
                        $id_history = $this -> model_account_customer -> saveHistoryPin($customerReceived['customer_id'], '+ ' . $amount_btc . ' BTC ', $this -> request -> post['description'], 'Received', $customerSend['username']);  

                    
                              
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
        }
    }
   
}
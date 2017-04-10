<?php
class ControllerModuleAccountleft extends Controller {
	public function index() {

		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/edit', '', 'SSL');

			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->load->language('module/accountleft');

		$data['title_account'] = $this->language->get('title_account');
		$data['heading_title'] = $this->language->get('heading_title');
		$data['message'] = $this->url->link('account/message', '', 'SSL');




		$data['self'] = $this;
	
		if (isset($this -> session -> data['customer_id'])) {
			$this->load->model('account/customer');
			$data['customer'] = $customer = $this -> model_account_customer -> getCustomer($this -> session -> data['customer_id']);		
				$data['username'] = $customer['username'];
			
			$data['pd_march'] = $this->model_account_customer->getPDMarch($this->session->data['customer_id']);

		}
		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}
			$this -> load -> model('account/customer');
		$getLanguage = $this -> model_account_customer -> getLanguage($this -> session -> data['customer_id']);
		$language = new Language($getLanguage);
		$language -> load('account/left');
		$data['lang'] = $language -> data;
		$data['base'] = $server;	
			
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/accountleft.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/accountleft.tpl', $data);
		} else {
			return $this->load->view('default/template/module/accountleft.tpl', $data);
		}
	}
}
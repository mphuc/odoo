<?php
class ControllerHomePage extends Controller {
	public function index() {

		$data['base'] = HTTPS_SERVER;
		$data['self'] = $this;
		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template_home/index.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template_home/index.tpl', $data));
		
		} else {
				
			$this -> response -> setOutput($this -> load -> view('default/template_home/index.tpl', $data));
		}
	}
	public function about() {

		$data['base'] = HTTPS_SERVER;
		$data['self'] = $this;
		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template_home/about.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template_home/about.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template_home/about.tpl', $data));
		}
	}
	public function contact() {

		$data['base'] = HTTPS_SERVER;
		$data['self'] = $this;
		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template_home/contact.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template_home/contact.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template_home/contact.tpl', $data));
		}
	}
	public function faq() {

		$data['base'] = HTTPS_SERVER;
		$data['self'] = $this;
		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template_home/faq.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template_home/faq.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template_home/faq.tpl', $data));
		}
	}
	public function pricing() {

		$data['base'] = HTTPS_SERVER;
		$data['self'] = $this;
		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template_home/pricing.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template_home/pricing.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template_home/pricing.tpl', $data));
		}
	}
	public function tour() {

		$data['base'] = HTTPS_SERVER;
		$data['self'] = $this;
		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template_home/tour.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template_home/tour.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template_home/tour.tpl', $data));
		}
	}
	public function sfccoin() {

		$data['base'] = HTTPS_SERVER;
		$data['self'] = $this;
		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template_home/sfccoin.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template_home/sfccoin.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template_home/sfccoin.tpl', $data));
		}
	}
	public function header() {

		$data['base'] = HTTPS_SERVER;
		$data['self'] = $this;
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template_home/header.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template_home/header.tpl', $data);
		} else {
			return $this->load->view('default/template_home/header.tpl', $data);
		}
	}
	public function footer() {

		$data['base'] = HTTPS_SERVER;
		$data['self'] = $this;
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template_home/footer.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template_home/footer.tpl', $data);
		} else {
			return $this->load->view('default/template_home/footer.tpl', $data);
		}
	}
	
}
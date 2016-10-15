<?php
class ControllerEmailsNewsletter extends Controller {

  public function index() {
    print_r("Adalynn World!");
  }

  /**
   * 
   */
  public function add() {
    
    $json = array();

    $validate = $this->validate($this->request->post);
    if ($validate['success']) {
        // Save the data in DB
        //$this->load->language('emails/newsletter');
        $this->load->model('emails/newsletter');
        $data = array();
        $data['subscriber_emailid'] = $this->request->post['emailid'];
        $data['subscriber_status'] = (int) 1;
        $data['subscriber_addedon'] = time();

        $subscriber = $this->model_emails_newsletter->getSubscriber($data);
        
        if(!$subscriber){
          $subscriber_id = $this->model_emails_newsletter->addSubscriber($data);
        } else {
          $subscriber_id = $this->model_emails_newsletter->editSubscriber($data);
        }


        if ($subscriber_id) {
            $json['message'] = "Thanks for subscribing.";
            $json['success'] = true;
        }

    } else {
        $json = $validate;
    }

    $this->response->addHeader('Content-Type: application/json');
    $this->response->setOutput(json_encode($json));
  }

  /**
   * @param  [type] array 
   * @return [type] json_encoded data
   */
  public function validate($form_data) {

    $data = array();

    if (!isset($form_data['emailid'])) {
        $data['message'] = "Emailid parameter not set";
        $data['success'] = false;
    }

    if ((isset($form_data['emailid'])) && (empty($form_data['emailid']))) {
        $data['message'] = "Please enter the emailid.";
        $data['success'] = false;
    }

    if ((isset($form_data['emailid'])) && (!empty($form_data['emailid']))) {
        if (!filter_var($form_data['emailid'], FILTER_VALIDATE_EMAIL)) {
            $data['message'] = "Please enter valid emailid.";
            $data['success'] = false;            
        } else {
            $data['message'] = "Valid emailid found";
            $data['success'] = true;
        }
    }

    return $data;
  }

}

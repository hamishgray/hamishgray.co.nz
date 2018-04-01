<?php
class Page extends SiteTree {

	private static $db = array(
		'PageColor' => 'Varchar(6)',
		'LightTheme' => 'Boolean',
		'NoBannerImage' => 'Boolean'
	);

	private static $has_one = array(
		'BannerImage' => 'Image'
	);
	
	public function getCMSFields() {
        $fields = parent::getCMSFields();
		
		
		
		$fields->addFieldToTab('Root.Main', new ColorField('PageColor', 'Page Color'),"Content");
		$fields->addFieldToTab('Root.Main', new CheckboxField('LightTheme', 'Dark text for a light background'),"Content");
		
		
		
		$fields->addFieldToTab('Root.Banner', new UploadField('BannerImage', 'Banner Image'));
		$fields->addFieldToTab('Root.Banner', new CheckboxField('NoBannerImage', 'No Banner Image?'));
		
		
		
        return $fields;
    }

}
class Page_Controller extends ContentController {

	private static $allowed_actions = array (
       'ContactForm'
	);

	public function init() {
		parent::init();
	}
	
	public function UpperCase() {
		return Convert::raw2xml(strtoupper($this->value));
	}
	
	
	
    // Contact Form
    function ContactForm() {
        $fields = new FieldList(
            new TextField('Name', 'Name*'),
            new EmailField('Email', 'Email*'),
            new TextareaField('Message','Message*')
        );
        $actions = new FieldList(
            new FormAction('SendContactForm', 'Send')
        );
        $validator = new RequiredFields('Name', 'Email', 'Message');
        return new Form($this, 'ContactForm', $fields, $actions, $validator);
    }
    
    function SendContactForm($data, $form) {
    	
    	$config = SiteConfig::current_site_config(); 
    	
    	// Email to admin
        $from = $data['Email'];
        $to = $config->Mailto;
        $subject = "TOA : Contact Message";
        $email = new Email($from, $to, $subject);
        $email->setTemplate('ContactEmail');
        $email->populateTemplate($data);
        $email->send();
    	
    	// Email to sender
        $receiptFrom = $config->Mailto;
        $receiptTo = $data['Email'];
        $receiptSubject = "TOA : Message Received";
        $email = new Email($receiptFrom, $receiptTo, $receiptSubject);
        $messageBody = "
        	<p><strong>Thank you for contacting us.</strong></p>
        	<p>We have received your message and you can expect to hear from us within 48 hours.</p>
        ";
        $email->setBody($messageBody);
        $email->send();
        
    	// Save submission to DB
        $saveContact = new ContactRequest();
        $form->saveInto($saveContact);
		$saveContact->Name = $data['Name'];
		$saveContact->Email = $data['Email'];
		$saveContact->Comments = $data['Message'];
		$saveContact->write();

        $this->redirect($this->Link("?success=1"));
    }
    
    public function ContactFormSuccess(){
        return isset($_REQUEST['success']) && $_REQUEST['success'] == "1";
    }
    
    
    
    
    public function getWorkBlogs(){
    
    	$data = new ArrayList();
    	
	    $data->merge(PortfolioPage::get());
	    $data->merge(BlogPost::get());
		$sorteddata = $data->sort('PublishDate','DESC');
	    
	    return $sorteddata;
    }
    
    
    public function getRecentWork(){
        	
	    $data = PortfolioPage::get()->limit(3);
	    
	    return $data;
    }
    
}

<?php
class PortfolioHolder extends Page {

    private static $allowed_children = array('PortfolioPage');
	
	private static $db = array(
	);

	private static $has_one = array(
	);
    
    private static $has_many = array(
    );
	
	public function getCMSFields() {
        $fields = parent::getCMSFields();
        
                
        
        return $fields;
    }

}
class PortfolioHolder_Controller extends Page_Controller {

	private static $allowed_actions = array (
	);
	
}

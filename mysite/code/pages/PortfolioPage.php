<?php
class PortfolioPage extends Page {

	private static $can_be_root = false;
	static $default_sort = "PublishDate DESC";
	
	private static $db = array(
		'ShortDescription' => 'Text',
		'Client' => 'Text',
		'Scope' => 'Text',
		'PublishDate' => 'Date',
		'WebLink' => 'Text',
		'Feature' => 'Boolean',
		
		'VimeoID' => 'Text',
		
		'CreditCreativeDirector' => 'Text',
		'CreditArtDirector' => 'Text',
		'CreditDesigner' => 'Text',
		'CreditPhotographer' => 'Text'
	);

	private static $has_one = array(
		'ThumbnailImage' => 'Image'
	);
    
    private static $has_many = array(
    	'PortfolioImages' => 'PortfolioImage'
    );
	
	public function getCMSFields() {
        $fields = parent::getCMSFields();
        
        
        
		$fields->addFieldToTab('Root.Main', new TextareaField('ShortDescription', 'Short Description'),"Content");
		
		$fields->addFieldToTab('Root.Main', new CheckboxField('Feature', 'Feature this work?'),"Content");
        
        
        
		$fields->addFieldToTab('Root.Details', new TextField('Client', 'Client'));
		$fields->addFieldToTab('Root.Details', new TextField('Scope', 'Scope'));
		$fields->addFieldToTab('Root.Details', new TextField('WebLink', 'Web Link'));
		$fields->addFieldToTab('Root.Details', $publishDate = new DateField('PublishDate', 'Publish Date'));
		$publishDate->setConfig('showcalendar', true);
		$fields->addFieldToTab('Root.Details', new UploadField('ThumbnailImage', 'Thumbnail Image'));
		
		
        $fields->addFieldToTab('Root.Credits', new TextField('CreditCreativeDirector', 'Creative Director'));
        $fields->addFieldToTab('Root.Credits', new TextField('CreditArtDirector', 'Art Director'));
        $fields->addFieldToTab('Root.Credits', new TextField('CreditDesign', 'Designer'));
        $fields->addFieldToTab('Root.Credits', new TextField('CreditPhotography', 'Photographer'));
        
        
        
		$fields->addFieldToTab('Root.Images', new TextField('VimeoID', 'Vimeo ID'));
		
		$imagesConfig = GridFieldConfig_RecordEditor::create();
		$imagesConfig->addComponent(new GridFieldSortableRows('Sort'));
		$imagesConfig->getComponentByType('GridFieldPaginator')->setItemsPerPage(100);
		$fields->addFieldToTab('Root.Images', GridField::create(
			"PortfolioImages", 
			"Portfolio Images", 
			$this->PortfolioImages(), $imagesConfig)
		);
        
        
        
        return $fields;
    }

}
class PortfolioPage_Controller extends Page_Controller {

	private static $allowed_actions = array (
	);
	
}

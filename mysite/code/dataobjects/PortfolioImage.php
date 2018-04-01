<?php
class PortfolioImage extends DataObject {

	static $default_sort = 'Sort ASC';
	
	private static $db = array(
		'Title' => 'Text',
		'Description' => 'Text',
		'Format' => 'Text',
		'Sort' => 'Int'
	);
	
	private static $has_one = array(
		'Image' => 'Image',
		'Parent' => 'PortfolioPage'
	);
	
	function getCMSFields() {
		$fields = new FieldList();
		$fields->push(new Tabset('Root'));
		
		$fields->addFieldToTab('Root.Main', new TextField('Title', 'Title'));
		$fields->addFieldToTab('Root.Main', new TextareaField('Description', 'Description'));
		$fields->addFieldToTab('Root.Main', new UploadField('Image', 'Image'));
		
		$fields->addFieldToTab('Root.Main', new DropdownField('Format', 'Format', 
			array(
				'' => '',
				'Wide' => 'Wide'
			)
		));
		
		
		$fields->addFieldToTab('Root.Main', new ReadonlyField('Sort', 'Sort'));
		
		return $fields;
	}
	
}
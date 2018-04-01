<?php
class ContactRequest extends DataObject {

	static $default_sort = 'Sort ASC';
	
	private static $db = array(
		'Name' => 'Text',
		'Email' => 'Text',
		'Message' => 'Text',
		'Sort' => 'Int'
	);
	
	private static $has_one = array(
	);
	
	function getCMSFields() {
		$fields = new FieldList();
		$fields->push(new Tabset('Root'));
		
		$fields->addFieldToTab('Root.Main', new TextField('Name', 'Name'));
		$fields->addFieldToTab('Root.Main', new TextField('Email', 'Email'));
		$fields->addFieldToTab('Root.Main', new TextareaField('Message', 'Message'));		
		
		return $fields;
	}
	
}
<?php

class ContactRequestAdmin extends ModelAdmin {

	private static $managed_models = array(
		'ContactRequest' => array(
			'title' => 'Contact Requests'
		)
	);
  private static $url_segment = 'contacts';
  private static $menu_title = 'Contact Requests';


}
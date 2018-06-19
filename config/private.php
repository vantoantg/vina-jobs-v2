<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

return [
    'encrypt' => [
    	'my_simple_secret_key' => '',
    	'my_simple_secret_iv' => '',
    ],
    'email' => [
	    'host' => '',
	    'username' => '',
	    'password' => '',
	    'secure' => true,
	    'port' => '25',
	    'options' => [
		    'mailInfo' => 'info@jobsvina.com',
		    'setFrom' => 'system@jobsvina.com',
		    'addReplyTo' => 'noreply@jobsvina.com',
	    ],
    ],
    'db' => [
	    'dsn' => 'mysql:host=localhost;dbname=',
        'username' => 'root',
        'password' => '123',
    ],
];

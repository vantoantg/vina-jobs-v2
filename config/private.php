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
    	'my_simple_secret_key' => 'tonanguyen',
    	'my_simple_secret_iv' => 'tonanguyen',
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
<<<<<<< HEAD
            'dsn' => 'mysql:host=localhost;dbname=zadmin_vnjobs',
        'username' => 'vnjobs',
        'password' => 'apy9yzavu',
    ]
=======
	    'dsn' => 'mysql:host=localhost;dbname=',
        'username' => 'root',
        'password' => '123',
    ],
>>>>>>> 4b244e55b615030b9ff5feea974b81f3bd7d7f76
];

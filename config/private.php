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
'host' => 'vina-jobs.com',
    'username' => 'system@vina-jobs.com',
    'password' => '12345678090',
    'secure' => false,
    'port' => '25',
    'options' => [
        'mailInfo' => 'info@jobsvina.com',
        'setFrom' => 'system@jobsvina.com',
        'addReplyTo' => 'noreply@jobsvina.com',
    ],
<<<<<<< HEAD
=======
    'db' => [
	    'dsn' => 'mysql:host=localhost;dbname=',
        'username' => 'root',
        'password' => '',
>>>>>>> 4f0e926f87da584fd63dfd9980d34d59f7a3a756
    ],
    'db' => [
            'dsn' => 'mysql:host=localhost;dbname=zadmin_vnjobs',
        'username' => 'vnjobs',
        'password' => 'apy9yzavu',
    ]
];

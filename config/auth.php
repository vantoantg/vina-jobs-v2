<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

return [
    'class' => '\yii\authclient\Collection',
    'clients' => [
        /*'facebook' => [
            'class' => '\yii\authclient\clients\Facebook',
            'authUrl' => 'https://www.facebook.com/dialog/oauth',
            'clientId' => '592988894149611',
            'clientSecret' => 'c081d2c7c8d11c94a183dbfcc435ca0b',
        ],*/
        'google' => [
            'class' => 'yii\authclient\clients\Google',
            'clientId' => '835202725290-e2s5222m95gr298i9gvledke10pvnmds.apps.googleusercontent.com',
            'clientSecret' => '87PEHeA6t3drizYk4v_tB-sE',
        ],
        'twitter' => [
            'class' => '\yii\authclient\clients\Twitter',
            'attributeParams' => [
                'include_email' => 'true',
            ],
            'consumerKey' => 'KQ3PQvbdCahcywwd5OXr0eftp',
            'consumerSecret' => 'SBUUIMqmITWPYFiqFUaN5a3N1KF3b1YGFH37jHfbniVQalfPes',
        ],
        'github' => [
            'class' => 'yii\authclient\clients\GitHub',
            'clientId' => '17cfbf0f3dbbfd14801c',
            'clientSecret' => '804acf61a3720164e2708f645a9976c89c9b0801',
        ],

        /*'linkedin' => [
            'class' => \yii\authclient\clients\LinkedIn::class,
            'clientId' => 'linkedin_client_id',
            'clientSecret' => 'linkedin_client_secret',
        ],

        'live' => [
            'class' => \yii\authclient\clients\Live::class,
            'clientId' => 'live_client_id',
            'clientSecret' => 'live_client_secret',
        ],*/
    ],
];

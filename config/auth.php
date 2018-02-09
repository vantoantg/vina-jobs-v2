<?php
/*
 * This file is part of EC-CUBE
 *
 * Copyright(c) 2000-2015 LOCKON CO.,LTD. All Rights Reserved.
 *
 * http://www.lockon.co.jp/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */

return [
    'class' => \yii\authclient\Collection::class,
    'clients' => [
        'facebook' => [
            'class' => \yii\authclient\clients\Facebook::class,
            'authUrl' => 'https://www.facebook.com/dialog/oauth',
            'clientId' => '592988894149611',
            'clientSecret' => 'c081d2c7c8d11c94a183dbfcc435ca0b',
        ],
        'twitter' => [
            'class' => \yii\authclient\clients\Twitter::class,
            'attributeParams' => [
                'include_email' => 'true'
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
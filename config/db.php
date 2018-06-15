<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

$db = require __DIR__.'/private.php';

return [
    'class' => 'yii\db\Connection',
    'dsn' => $db['db']['dsn'],
    'username' => $db['db']['username'],
    'password' => $db['db']['password'],
    'charset' => 'utf8',

//    Schema cache options (for production environment)
//    'enableSchemaCache' => true,
//    'schemaCacheDuration' => 60,
//    'schemaCache' => 'cache',
];

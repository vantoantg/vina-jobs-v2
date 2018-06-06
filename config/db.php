<?php

$db = require __DIR__ . '/private.php';

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

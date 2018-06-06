<?php

$db = require __DIR__ . '/private.php';
$db_host = $db['db']['host'];
$db_name = $db['db']['dbname'];

return [
    'class' => 'yii\db\Connection',
    'dsn' => "mysql:$db_host=localhost;dbname=$db_name",
    'username' => $db['db']['username'],
    'password' => $db['db']['password'],
    'charset' => 'utf8',

//    Schema cache options (for production environment)
//    'enableSchemaCache' => true,
//    'schemaCacheDuration' => 60,
//    'schemaCache' => 'cache',
];

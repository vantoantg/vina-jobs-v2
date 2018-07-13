<?php

// create curl resource
$ch = curl_init();
$myUrl = 'https://jobsvina.com/front/cron/index';

// set url
curl_setopt($ch, CURLOPT_URL, $myUrl);

//return the transfer as a string
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

// $output contains the output string
$output = curl_exec($ch);

// close curl resource to free up system resources
curl_close($ch);

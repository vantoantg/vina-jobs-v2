<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\library\helper;

use Carbon\Carbon;

class Logs
{
    protected static $_instance;

    /**
     * @return Logs
     */
    public static function getInstance()
    {
        if (!(self::$_instance instanceof self)) {
            self::$_instance = new self();
        }

        return self::$_instance;
    }

    /**
     * @param $log_msg
     * @param $folder
     */
    public function createFileLog($log_msg, $folder)
    {
        if (is_array($log_msg)){
            $log_msg = json_encode($log_msg);
        }

        $time = Carbon::now(Datetime::DEFAULT_TIME_ZONE)->format(Datetime::SQL_DATETIME);
        $log_filename = \Yii::$app->basePath.DIRECTORY_SEPARATOR.'assets'.DIRECTORY_SEPARATOR.'logs'.DIRECTORY_SEPARATOR.$folder;

        if (!file_exists($log_filename)) {
            mkdir($log_filename, 0777, true);
        }
        $name = Carbon::now(Datetime::DEFAULT_TIME_ZONE)->format('d-M-Y');
        $log_file_data = $log_filename.DIRECTORY_SEPARATOR.'log_'.$name.'.log';
        file_put_contents($log_file_data, '['.$time.'] - '.$log_msg."\n", FILE_APPEND);
    }

    public function siteRequest()
    {
        $data['ip'] = $_SERVER['SERVER_ADDR'];
        $data['http_user_agent'] = $_SERVER['HTTP_USER_AGENT'];
        $data['url'] = \Yii::$app->request->getUrl();
        $data['method'] = \Yii::$app->request->getMethod();
        $data['isAjax'] = \Yii::$app->request->isAjax;

        $message = json_encode($data);
        $this->createFileLog($message, 'site');
    }

    /**
     * @param $message
     */
    public function applyEmail($message)
    {
        $this->createFileLog($message, 'email');
    }

    /**
     * @param $message
     */
    public function contactEmail($message)
    {
        $this->createFileLog($message, 'contact');
    }

    /**
     * @param $message
     */
    public function info($message)
    {
        $this->createFileLog($message, 'info');
    }

    /**
     * @param $message
     */
    public function errors($message)
    {
        $this->createFileLog($message, 'errors');
    }
}

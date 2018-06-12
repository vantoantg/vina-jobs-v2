<?php

namespace app\modules\admin\controllers;

use app\library\helper\Helper;
use yii\web\Controller;

/**
 * Class BaseController
 * @package app\modules\admin\controllers
 */
class BaseController extends Controller
{
    public $app;

    public function init()
    {
        parent::init();
        $this->app = \Yii::$app;
        \Yii::$app->session->open();
    }

    /**
     * @param \yii\base\Action $action
     * @param mixed $result
     * @return mixed
     */
    public function afterAction($action, $result)
    {
        $result = parent::afterAction($action, $result);
        //		LogSystemWidget::createLogs();
        return $result;
    }

    /**
     * @param array $data
     * @return string
     */
    public function jsonData($data = [])
    {
        return Helper::jsonData($data);
    }
}

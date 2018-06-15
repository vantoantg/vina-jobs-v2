<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\modules\admin\controllers;

use app\library\helper\Helper;
use yii\web\Controller;

/**
 * Class BaseController
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
     *
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
     *
     * @return string
     */
    public function jsonData($data = [])
    {
        return Helper::jsonData($data);
    }
}

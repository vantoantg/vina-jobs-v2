<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\modules\admin\controllers;

use app\library\helper\Role;
use app\models\search\Setting;

/**
 * Class BaseController
 */
class AdminController extends BaseController
{
    /**
     * @var \Yii
     */
    public $app;

    /** @var $setting Setting */
    public $setting;

    public function init()
    {
        parent::init();
        $this->app = \Yii::$app;
        $this->layout = '/admin';
        $this->app->name = 'Admin';
        $this->app->language = 'en';

        if (!\Yii::$app->getUser()->identity) {
            return $this->redirect(['/admin/login']);
        }

        $this->setSetting();

        if (!Role::allowAdmin()) {
            //			return $this->redirect(Helper::siteURL());
        }
    }

    /**
     * Get setting from DB
     */
    public function setSetting()
    {
        $this->setting = \app\models\Setting::getSettings();
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
}

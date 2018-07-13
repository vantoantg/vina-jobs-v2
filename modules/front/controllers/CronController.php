<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\modules\front\controllers;

use app\library\helper\Datetime;
use app\library\helper\Logs;
use Carbon\Carbon;
use yii\web\Controller;

/**
 * Default controller for the `front` module
 */
class CronController extends Controller
{
    public function init()
    {
        parent::init();
    }

    /**
     * Renders the index view for the module
     *
     * @return string
     */
    public function actionIndex()
    {
        // TODO:
        Logs::getInstance()->cron($_SERVER['REMOTE_ADDR']);
    }
}

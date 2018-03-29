<?php

namespace app\modules\front\controllers;

use app\components\LogSystemWidget;
use app\components\UserOnlineWidget;
use yii\web\Controller;

/**
 * Default controller for the `front` module
 */
class FrontController extends Controller
{
    public function init()
    {
        parent::init();
    }

    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }
}

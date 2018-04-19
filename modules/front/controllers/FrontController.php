<?php

namespace app\modules\front\controllers;

use yii\web\Controller;

/**
 * Default controller for the `front` module
 */
class FrontController extends Controller
{
    public function init()
    {
        parent::init();
        $this->setCookieForUrl();
    }

    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function setCookieForUrl(){
        $cookie_name = md5(\Yii::$app->request->getUrl());
        $timer = time() + 3600;
        if(!isset($_COOKIE[$cookie_name])) {
            setcookie($cookie_name, true, $timer, "/"); // 86400 = 1 day
            \Yii::$app->params['urlCookied'] = false;
        } else {
            \Yii::$app->params['urlCookied'] = $_COOKIE[$cookie_name];
        }
    }
}

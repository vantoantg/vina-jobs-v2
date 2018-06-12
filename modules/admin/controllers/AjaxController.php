<?php

/*
 *  Created by Tona Nguyễn.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: Hồ Chí Minh, Việt Nam
 *  Website: https://jobsvina.com/
 */

namespace app\modules\admin\controllers;

use app\components\UserOnlineWidget;
use Yii;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;

class AjaxController extends AdminController
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    public function actionIndex($cookie_name)
    {
        if (Yii::$app->request->isAjax) {
            if (isset($_COOKIE[$cookie_name]) && $_COOKIE[$cookie_name] == true) {
                setcookie($cookie_name, false, time() + (86400 * 30), '/'); // 86400 = 1 day
            } else {
                setcookie($cookie_name, true, time() + (86400 * 30), '/'); // 86400 = 1 day
            }
        }
    }

    public function actionPhpWorking()
    {
        UserOnlineWidget::clearUserOnline();
    }
}

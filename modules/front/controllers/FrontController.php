<?php

/*
 *  Created by Tona Nguyễn.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: Hồ Chí Minh, Việt Nam
 *  Website: https://jobsvina.com/
 */

namespace app\modules\front\controllers;

use yii\web\Controller;
use Yii;

/**
 * Default controller for the `front` module
 */
class FrontController extends Controller
{
    public function init()
    {
        parent::init();
        $this->setCookieForUrl();

        $this->handleUrlSessionToRedirect();
    }

    /**
     * Renders the index view for the module
     *
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    /**
     * @return \yii\web\Response
     */
    public function handleUrlSessionToRedirect()
    {
        if (!Yii::$app->request->isAjax) {
            $url = Yii::$app->request->getUrl();
            if (!Yii::$app->session->get('testUrl')) {
                $data[] = $url;
            } else {
                $data = Yii::$app->session->get('testUrl');
                $data[] = $url;
            }
            Yii::$app->session->set('testUrl', $data);
        } else {
            $data = [];
        }

        if (Yii::$app->session->has('redirectAfterLoginWithSocial')) {
            $keyUrl = count($data) - Yii::$app->session->get('redirectAfterLoginWithSocial');
            Yii::$app->session->remove('redirectAfterLoginWithSocial');

            if (isset($data[$keyUrl])) {
                Yii::$app->session->remove('testUrl');

                return $this->redirect($data[$keyUrl]);
            }
        }
    }

    /**
     * If user visited url second then not set effect show of UI
     */
    public function setCookieForUrl()
    {
        $cookie_name = md5(\Yii::$app->request->getUrl());
        $timer = time() + 3600;
        if (!isset($_COOKIE[$cookie_name])) {
            setcookie($cookie_name, true, $timer, '/'); // 86400 = 1 day
            \Yii::$app->params['urlCookied'] = false;
        } else {
            \Yii::$app->params['urlCookied'] = $_COOKIE[$cookie_name];
        }
    }
}

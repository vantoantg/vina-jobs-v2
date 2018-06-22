<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\modules\admin\controllers;

use app\forms\AdminLoginForm;
use app\library\helper\Common;
use app\library\helper\Helper;
use app\library\helper\Role;
use yii\web\NotFoundHttpException;

/**
 * Default controller for the `admin` module
 */
class LoginController extends BaseController
{
    public function init()
    {
        parent::init();
        $this->layout = '/login';
        \Yii::$app->language = 'en';

        if(!\Yii::$app->request->get('login')){
        	throw new NotFoundHttpException();
        }
    }

    /**
     * Renders the index view for the module
     *
     * @return string
     */
    public function actionIndex()
    {
        /*if ($this->app->user->isGuest) {
            return $this->goHome();
        }*/

        $model = new AdminLoginForm();
        if ($model->load($this->app->request->post()) && $model->login()) {
            if (Common::currentUsers()->role == Role::ROLE_ADMINISTRATOR) {
                return $this->redirect(['/admin']);
            }

            return $this->goHome();
        } else {
            if ($this->app->request->isAjax) {
                return Helper::jsonData(['error' => true, 'message' => $model->errors['password'][0]]);
            }
        }

        return $this->render('index', [
            'model' => $model,
        ]);
    }

    public function actionLogout()
    {
        $this->app->user->logout();

        return $this->redirect(['/admin/login']);
    }
}

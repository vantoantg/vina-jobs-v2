<?php

namespace app\modules\admin\controllers;

use app\forms\AdminLoginForm;
use app\library\helper\Common;
use app\library\helper\Helper;

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
    }

    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        /*if ($this->app->user->isGuest) {
            return $this->goHome();
        }*/

        $model = new AdminLoginForm();
        if ($model->load($this->app->request->post()) && $model->login()) {
            if (Common::currentUser('username') == 'admin') {
                return $this->redirect(['/admin']);
            }
            return $this->goHome();
        } else {
            if ($this->app->request->isAjax) {
                return Helper::jsonData(['error' => true, 'message' => $model->errors['password'][0]]);
            }
        }

        return $this->render('index', [
            'model' => $model
        ]);
    }

    public function actionLogout()
    {
        $this->app->user->logout();

        return $this->redirect(['/admin/login']);
    }
}

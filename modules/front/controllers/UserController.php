<?php

namespace app\modules\front\controllers;

use app\forms\LoginForm;
use app\library\helper\Helper;
use app\models\Users;


/**
 * Default controller for the `front` module
 */
class UserController extends FrontController
{
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionRegister()
    {
        $model = new Users();
        return $this->render('register', [
            'model' => $model
        ]);
    }

    public function actionViewProfile($id)
    {
        return $this->render('view_profile');
    }

    public function actionProfile()
    {
        return $this->render('profile');
    }

    /**
     * @return array|\yii\web\Response
     */
    public function actionLogin()
    {
        $model = new LoginForm();
        if ($model->load(\Yii::$app->request->post()) && $model->login()) {
            return $this->goHome();
        } else {
            if (\Yii::$app->request->isAjax) {
                return Helper::jsonData(['error' => true, 'message' => $model->errors['password'][0]]);
            }
        }
    }

    /**
     * @return array|\yii\web\Response
     */
    public function actionLogout()
    {
        \Yii::$app->user->logout();
        return $this->goHome();
    }
}

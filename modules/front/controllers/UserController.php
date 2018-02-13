<?php

namespace app\modules\front\controllers;

use Yii;
use app\forms\LoginForm;
use app\forms\ProfilePasswordForm;
use app\forms\RequireResetPasswordForm;
use app\forms\ResetProfilePasswordForm;
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

    /*public function actionForgot(){
        return $this->render('forgot', [
            'model' => '',
        ]);
    }*/

    public function actionResetProfilePassword()
    {
        $resetpasswordmodel = new ProfilePasswordForm();
        if ($resetpasswordmodel->load(Yii::$app->request->post())) {
            $user = Users::find()->where(['id' => \Yii::$app->user->identity->id])->one();
            # here we run our validation rules on the model
            if ($resetpasswordmodel->validate()) {
                # if it is ok - setting the password property of user
                $user->password = $resetpasswordmodel->changepassword;
                # and finally save it
                $user->save();
            }
            return $this->render('reset_profile_password', [
                'resetpasswordmodel' => $resetpasswordmodel
            ]);
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

    public function getToken($token)
    {
        $model = Users::model()->findByAttributes(array('token' => $token));
        if ($model === null) {
            throw new CHttpException(404, 'The requested page does not exist.');
        }
        return $model;
    }


    public function actionVerToken($token)
    {
        $model = $this->getToken($token);
        if (isset($_POST['Ganti'])) {
            if ($model->token == $_POST['Ganti']['tokenhid']) {
                $model->password = md5($_POST['Ganti']['password']);
                $model->token = "null";
                $model->save();
                Yii::app()->user->setFlash('ganti', '<b>Password has been successfully changed! please login</b>');
                $this->redirect('?r=site/login');
                $this->refresh();
            }
        }
        $this->render('verifikasi', array(
            'model' => $model,
        ));
    }


    public function actionForgot()
    {
        $form = new RequireResetPasswordForm();

        if (Yii::$app->request->isPost) {
            // if ($form->validate()) {
            $data = Yii::$app->request->post($form->formName());
                $User = Users::findOne(array('username' => $data['email']));
                if ($User) {
                    // Todo send mail
                    $form->sendEmailResetPassword(Yii::$app->params['adminEmail'], $User);
                } else {

                }
            //}
        }
        return $this->render('forgot', [
            'model' => $form
        ]);
    }
}

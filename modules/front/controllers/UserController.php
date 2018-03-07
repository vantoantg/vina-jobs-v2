<?php

namespace app\modules\front\controllers;

use app\library\helper\Common;
use app\models\Company;
use app\models\Dropdown;
use app\models\UserDetails;
use Faker\Generator;
use Yii;
use app\forms\LoginForm;
use app\forms\ProfilePasswordForm;
use app\forms\RequireResetPasswordForm;
use app\forms\ResetProfilePasswordForm;
use app\library\helper\Helper;
use app\models\Users;
use yii\web\NotFoundHttpException;
use yii\web\UploadedFile;
use app\models\Email;


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


    public function actionRegisterCandidate()
    {
        $model = new Users();
        $userDetail = new UserDetails();
        $com = new Company();

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->save()) {
//            if($com->load())
            $url = Yii::$app->getUrlManager()->createUrl(['front/user/update']);
            return $this->redirect($url);
        }
        return $this->render('register_candidate', [
            'model' => $model,
            'userDetail' => $userDetail,
            'com' => $com,
        ]);
    }

    public function actionRegisterCompany()
    {
        $errors = [];
        $dropdowns = new Dropdown();
        $gender = $dropdowns->getDropdown(Dropdown::TYPE_GENDER);

        $model = new Users();
        $model->scenario = Users::SCENARIO_REGISTER;

        $userDetail = new UserDetails();
        $com = new Company();

        if (
            $model->load(Yii::$app->request->post()) && $model->validate() &&
            $com->load(Yii::$app->request->post()) && $com->validate() &&
            $userDetail->load(Yii::$app->request->post()) && $userDetail->validate()) {
            $model->username = $model->email;
            if ($model->save()) {
                if ($com->save()) {
                    $com->created_by = $model->getId();
                    $com->update();
                }
                $userDetail->user_id = $model->getId();
                $userDetail->save();
            }

            $url = Yii::$app->getUrlManager()->createUrl(['front/user/update-company']);
            return $this->redirect($url);
        } else {
            $errs = array_merge($model->getErrors(), $com->getErrors(), $userDetail->getErrors());
            foreach ($errs as $error) {
                $errors[] = $error[0];
            }

        }

        return $this->render('register_company', [
            'model' => $model,
            'userDetail' => $userDetail,
            'com' => $com,
            'errors' => $errors,

            'gender' => $gender
        ]);
    }

    /**
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException
     */
    public function actionUpdateCompany()
    {
        if (!Common::isLoginned()) {
            return $this->goHome();
        }

        $errors = [];
        $dropdowns = new Dropdown();
        $gender = $dropdowns->getDropdown(Dropdown::TYPE_GENDER);

        $model = Users::findOne(['id' => Common::currentUser()]);
        if (!$model) {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
        $model->scenario = Users::SCENARIO_UPDATE;

        $userDetail = UserDetails::findOne(['user_id' => Common::currentUser()]);
        $com = Company::findOne(['created_by' => Common::currentUser()]);

        if (
            $model->load(Yii::$app->request->post()) && $model->validate() &&
            $com->load(Yii::$app->request->post()) && $com->validate() &&
            $userDetail->load(Yii::$app->request->post()) && $userDetail->validate()) {
            $model->username = $model->email;
            if ($model->save()) {
                // Upload logo
                $image = UploadedFile::getInstance($com, 'logo');
                if (!is_null($image)) {
                    $com->logo = $image->name;
                    $ex = explode(".", $image->name);
                    $ext = end($ex);

                    // TODO: add new fild to save origin file name, generate a unique file name to prevent duplicate filenames
                    /*$com->logo = Yii::$app->security->generateRandomString().".{$ext}";
                    $path = Yii::$app->basePath.Yii::$app->params['companyLogoPath'] . $com->logo;*/

                    $path = Yii::$app->basePath.Yii::$app->params['companyLogoPath'] . $image->name;
                    $image->saveAs($path);
                }

                if ($com->save()) {
                    $com->created_by = $model->getId();
                    $com->update();
                }
                $userDetail->user_id = $model->getId();
                $userDetail->save();
//	            (new RequireResetPasswordForm())->sendEmailResetPassword('admin@vina-jobs.com');
	            Email::sendMail();
            }

            $url = Yii::$app->getUrlManager()->createUrl(['front/user/update-company']);
            return $this->redirect($url);
        } else {
            $errs = array_merge($model->getErrors(), $com->getErrors(), $userDetail->getErrors());
            foreach ($errs as $error) {
                $errors[] = $error[0];
            }

        }

        return $this->render('register_company', [
            'model' => $model,
            'userDetail' => $userDetail,
            'com' => $com,
            'errors' => $errors,

            'gender' => $gender
        ]);
    }

    public function actionUpdate()
    {
        $model = Users::findOne(['id' => Common::currentUser()]);
        if (!$model) {
            throw new NotFoundHttpException('The requested page does not exist.');
        }

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->save()) {

            $url = Yii::$app->getUrlManager()->createUrl(['front/jobs/edit-cv', 'id' => $model->id]);
            return $this->redirect($url);
        }
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

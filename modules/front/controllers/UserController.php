<?php

namespace app\modules\front\controllers;

use app\library\helper\Common;
use app\library\helper\Datetime;
use app\library\helper\Image;
use app\models\Company;
use app\models\Dropdown;
use app\models\UserDetails;
use Yii;
use app\forms\LoginForm;
use app\forms\ProfilePasswordForm;
use app\forms\RequireResetPasswordForm;
use app\forms\ResetProfilePasswordForm;
use app\library\helper\Helper;
use app\models\Users;
use yii\helpers\Url;
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

	/**
	 * @return string
	 */
	public function actionRegisterCandidate()
	{
        $model = new Users();
        $userDetail = new UserDetails();
	    if(Common::isLoginned()){
            $model = Users::findOne(Common::currentUser());
            $userDetail = UserDetails::find()->where(['user_id' => $model->getId()])->one();
            $model->scenario = Users::SCENARIO_UPDATE;
        }

		if (
            $model->load(Yii::$app->request->post()) &&
            $userDetail->load(Yii::$app->request->post()) &&
            $model->validate() &&
            $userDetail->validate())
		{
            $img = Yii::$app->request->post();
            if($img['Users']['avatar']){
	            $model->avatar = Image::base64ToImage($img['Users']['avatar']);
            }

			$model->type = Users::USER_TYPE_DEFAULT;
			$model->username = $model->email;
			$token_waiting_active = \Yii::$app->getSecurity()->generateRandomString();
			$model->token_waiting_active = $token_waiting_active;
			$model->newCandidate();
            if($model->save()){
            	$userDetail->setNames($model->name);
	            $userDetail->user_id = $model->getId();
	            $userDetail->email = $model->email;
	            $userDetail->saveInfo();
	            if($userDetail->save()){
                    // TODO: Send email
                    $data['name'] = $model->name;
                    $data['link'] = Url::to('/candidate/active/token/' . $token_waiting_active . '.html', true);
                    $temp = $this->renderPartial('@app/mail/layouts/active_user_register', ['data' => $data]);

                    // TODO: comment out
//	            Email::sendMail('Reset password - '. Helper::siteURL(), $temp);
                }
	            return $this->render('register_candidate_success', [
		            'success' => true,
		            'message' => "",
	            ]);
            }
		}
		return $this->render('register_candidate', [
			'model' => $model,
			'userDetail' => $userDetail,
		]);
	}

	public function actionCandidateActive($token){

    }

	public function actionRegisterCompany()
	{
		$errors = [];
		$dropdowns = new Dropdown();
		$gender = $dropdowns->getDropdown(Dropdown::TYPE_GENDER);

		$model = new Users();
		$model->scenario = Users::SCENARIO_REGISTER;

		$userDetail = new UserDetails();
		$company = new Company();

		if (
			$model->load(Yii::$app->request->post()) &&
			$company->load(Yii::$app->request->post()) &&
            $userDetail->load(Yii::$app->request->post()) &&
            $model->validate() &&
            $company->validate() &&
            $userDetail->validate())
		{
			$model->username = $model->email;
			$model->newContactCompany();
			$token_waiting_active = \Yii::$app->getSecurity()->generateRandomString();
			$model->token_waiting_active = $token_waiting_active;
			if ($model->save()) {
				if ($company->save()) {
					$company->created_by = $model->getId();
					$company->update();
				}
				$userDetail->birthday = Datetime::todateSql($userDetail->birthday);
				$userDetail->user_id = $model->getId();
				$userDetail->save();

				$data['name'] = $model->name;
				$data['link'] = Url::to('/company/active/token/' . $token_waiting_active . '.html', true);
				$temp = $this->renderPartial('@app/mail/layouts/active_company_register', ['data' => $data]);

				// TODO: comment out
	            Email::sendMail('Register account - '. Helper::siteURL(), $temp);
			}

            return $this->render('register_company_success', [
                'email' => $model->email
            ]);
		} else {
			$errs = array_merge($model->getErrors(), $company->getErrors(), $userDetail->getErrors());
			foreach ($errs as $error) {
				$errors[] = $error[0];
			}
		}

		return $this->render('register_company', [
			'model' => $model,
			'userDetail' => $userDetail,
			'com' => $company,
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

					$path = Yii::$app->basePath . Yii::$app->params['companyLogoPath'] . $image->name;
					$image->saveAs($path);
				}

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

    /**
     * @return string|\yii\web\Response
     */
	public function actionProfile()
	{
	    if(!Common::isLoginned()){
            return $this->goHome();
        }
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

	public function actionProfileResetPassword($token)
	{
		$resetpasswordmodel = new ProfilePasswordForm();
		if ($resetpasswordmodel->load(Yii::$app->request->post())) {
			$user = Users::find()->where(['password_reset_token' => $token])->one();
			if ($resetpasswordmodel->validate()) {
				$user->password = $resetpasswordmodel->changepassword;
				$user->status = Users::STATUS_ACTIVED;
				$user->save();
			}
		}
		return $this->render('profile_reset_password', [
			'resetpasswordmodel' => $resetpasswordmodel
		]);
	}

	public function actionProfileChangePassword($token)
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
		}
		return $this->render('profile_reset_password', [
			'resetpasswordmodel' => $resetpasswordmodel
		]);
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
			if ($form->load(Yii::$app->request->post()) && $form->validate()) {
				$data = Yii::$app->request->post($form->formName());
				$User = Users::findOne(array('username' => $data['email']));
				if ($User) {
					$token_reset_password = \Yii::$app->getSecurity()->generateRandomString();
					$User->password_reset_token = $token_reset_password;
					$User->status = Users::STATUS_WAITING_RESET_PASSWORD;
					$User->save();
					$data['name'] = $User->name;
					$data['link'] = Url::to('/user/reset-password/' . $token_reset_password . '.html', true);
					$temp = $this->renderPartial('@app/mail/layouts/email', ['data' => $data]);
					$send = Email::sendMail('Reset password - ' . Helper::siteURL(), $temp);
					if ($send) {
						return $this->render('forgot_success', [
							'email' => $User->email
						]);
					}
				} else {

				}
			}
		}
		return $this->render('forgot', [
			'model' => $form
		]);
	}
}

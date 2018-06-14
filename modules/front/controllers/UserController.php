<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\modules\front\controllers;

use app\forms\ImageOnlyForm;
use app\library\helper\Common;
use app\library\helper\Datetime;
use app\library\helper\Image;
use app\models\base\User;
use app\models\Candidate;
use app\models\Company;
use app\models\Dropdown;
use app\models\FileUploads;
use app\models\JobSkill;
use app\models\UserDetails;
use Yii;
use app\forms\LoginForm;
use app\forms\ProfilePasswordForm;
use app\forms\RequireResetPasswordForm;
use app\library\helper\Helper;
use app\models\Users;
use yii\helpers\Url;
use yii\httpclient\Exception;
use yii\web\BadRequestHttpException;
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
     *
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
        $errors = [];
        if (Common::isLoginned()) {
            return $this->redirect(['update-candidate']);
        } else {
            $model = new Users();
            $userDetail = new UserDetails();
            $candidate = new Candidate();
            $candidate->user_id = 0; // Set to validate, after that set new user_id
            $candidate->client_status = Candidate::STATUS_CLIENT_PUBLISH;
            $candidate->receives = 1;
        }

        if (
            $candidate->load(Yii::$app->request->post()) &&
            $model->load(Yii::$app->request->post()) &&
            $userDetail->load(Yii::$app->request->post()) &&

            $model->validate() &&
            $userDetail->validate() &&
            $candidate->validate()
            ) {
            $candidate->location = implode(',', $candidate->location);
            $transaction = Yii::$app->db->beginTransaction();

            $img = Yii::$app->request->post();
            if ($img['Users']['avatar']) {
                $model->avatar = Image::base64ToImage($img['Users']['avatar']);
            }

            $model->type = Users::USER_TYPE_DEFAULT;
            $model->username = $model->email;
            $token_waiting_active = \Yii::$app->getSecurity()->generateRandomString();
            $model->token_waiting_active = $token_waiting_active;
            $model->newCandidate();
            if ($model->save()) {
                $userDetail->setNames($model->name);
                $userDetail->user_id = $model->getId();
                $userDetail->email = $model->email;
                $userDetail->saveInfo();

                //save candidate
                $candidate->user_id = $model->getId();
                //				$candidate->scenario = "register";
                $candidate->user_id = $model->getId();
                if ($userDetail->save() && $candidate->save()) {
                    $candidate->file = UploadedFile::getInstance($candidate, 'file');
                    if ($candidate->file) {
                        $file_type = $candidate->file->extension;
                        $file_name = $candidate->file->baseName;
                        $file_path = $candidate->file->baseName.'-'.md5(date('dmyhis')).'.'.$file_type;
                        $path = Yii::$app->basePath.'/'.Yii::$app->params['companyCandidatePath'].$file_path;
                        $candidate->file->saveAs($path);
                        FileUploads::saveFile(FileUploads::CANDIDATE, $file_path, $file_name, $file_type, $candidate->id);
                    }

                    $transaction->commit();
                    // TODO: Send email
                    $data['name'] = $model->name;
                    $data['email'] = $model->email;
                    $data['phone'] = $userDetail->phone;
                    $data['link'] = Url::to('/candidate/active/token/'.$token_waiting_active.'.html', true);
//                    $temp = $this->renderPartial('@app/mail/layouts/active_user_register', ['data' => $data]);

                    // TODO: comment out
//                    Email::sendMail('Instructions to activate your account - ' . Helper::siteURL(), $temp);

                    // Inform Candidate register
	                $temp = $this->renderPartial('@app/mail/layouts/noti_candidate_register', ['data' => $data]);
                    Email::sendNotiCandidateRegister('Have a Candidate just register ' . Helper::siteURL(), $temp);
                }

                return $this->render('register_candidate_success', [
                    'success' => true,
                    'message' => '',
                ]);
            }
        } else {
            $erros = array_merge($model->getErrors(), $candidate->getErrors(), $userDetail->getErrors());
            foreach ($erros as $error) {
                $errors[] = $error[0];
            }
        }

        $jobSkill = JobSkill::getAllGroupSkill();

        return $this->render('register_candidate', [
            'model' => $model,
            'userDetail' => $userDetail,
            'candidate' => $candidate,
            'jobSkill' => $jobSkill,
            'errors' => $errors,
        ]);
    }

    /**
     * @return string
     */
    public function actionUpdateCandidate()
    {
        $errors = [];
        if (Common::isLoginned()) {
            if (Common::currentUsers()->type != Users::USER_TYPE_DEFAULT) {
                //TODO:
//                return $this->goHome();
            }
            $model = Users::findOne(Common::currentUser());
            $model->scenario = Users::SCENARIO_UPDATE;
            $userDetail = UserDetails::findOne(['user_id' => $model->getId()]);
            $userDetail->phone = ($userDetail->phone == '--') ? '' : $userDetail->phone;
            $userDetail->birthday = Datetime::sqlDateToFormat($userDetail->birthday);
            $oldImg = $model->avatar;
            $candidate = Candidate::getCandidate(Common::currentUser());
            $candidate->location = explode(',', $candidate->location);
        } else {
            return $this->redirect(['register-candidate']);
        }

        if (
            $candidate->load(Yii::$app->request->post()) &&
            $model->load(Yii::$app->request->post()) &&
            $userDetail->load(Yii::$app->request->post()) &&

            $model->validate() &&
            $userDetail->validate() &&
            $candidate->validate()
        ) {
            $transaction = Yii::$app->db->beginTransaction();

            $img = Yii::$app->request->post();
            if ($img['Users']['avatar'] && $oldImg != $img['Users']['avatar']) {
                $model->avatar = Image::base64ToImage($img['Users']['avatar']);
            }

            $model->type = Users::USER_TYPE_DEFAULT;
            $model->username = $model->email;
            $token_waiting_active = \Yii::$app->getSecurity()->generateRandomString();
            $model->token_waiting_active = $token_waiting_active;
            $model->newCandidate();
            if ($model->save()) {
                $userDetail->setNames($model->name);
                $userDetail->user_id = $model->getId();
                $userDetail->email = $model->email;
                $userDetail->saveInfo();

                //save candidate
                $candidate->user_id = $model->getId();
                $candidate->location = implode(',', $candidate->location);
                //				$candidate->scenario = "register";
                $candidate->user_id = $model->getId();
                if ($userDetail->save() && $candidate->save()) {
                    $transaction->commit();
                    // Flash updated

                    return $this->render('update_candidate_success', [
                        'success' => true,
                        'message' => '',
                    ]);
                }
            }
        } else {
            $erros = array_merge($model->getErrors(), $candidate->getErrors(), $userDetail->getErrors());
            foreach ($erros as $error) {
                $errors[] = $error[0];
            }
        }

        $jobSkill = JobSkill::getAllGroupSkill();

        return $this->render('update_candidate', [
            'model' => $model,
            'userDetail' => $userDetail,
            'candidate' => $candidate,
            'jobSkill' => $jobSkill,
            'errors' => $errors,
        ]);
    }

    public function actionCandidateActive($token)
    {
    }

    /**
     * @return string|\yii\web\Response
     */
    public function actionRegisterCompany()
    {
        if (Common::isLoginned()) {
            return $this->goHome();
        }
        $errors = [];

        $model = new Users();
        $model->scenario = Users::SCENARIO_REGISTER;

        $userDetail = new UserDetails();
        $com = new Company();

        if (
            $model->load(Yii::$app->request->post()) &&
            $com->load(Yii::$app->request->post()) &&
            $userDetail->load(Yii::$app->request->post()) &&
            $model->validate() &&
            $com->validate() &&
            $userDetail->validate()) {
            $model->username = $model->email;
            $model->newContactCompany();
            $token_waiting_active = \Yii::$app->getSecurity()->generateRandomString();
            $model->token_waiting_active = $token_waiting_active;
            if ($model->save()) {
                // Upload logo
                $image = UploadedFile::getInstance($com, 'logo');
                if (!is_null($image)) {
                    $com->logo = $image->name;
                    $ex = explode('.', $image->name);
                    $ext = end($ex);

                    // TODO: add new fild to save origin file name, generate a unique file name to prevent duplicate filenames
                    /*$com->logo = Yii::$app->security->generateRandomString().".{$ext}";
                    $path = Yii::$app->basePath.'/'.Yii::$app->params['companyLogoPath'] . $com->logo;*/

                    $path = Yii::$app->basePath.'/'.Yii::$app->params['companyLogoPath'].$image->name;
                    $image->saveAs($path);
                }
                if ($com->save()) {
                    $com->created_by = $model->getId();
                    $com->update();
                }
                $userDetail->birthday = Datetime::todateSql($userDetail->birthday);
                $userDetail->user_id = $model->getId();
                $userDetail->save();

                $data['name'] = $model->name;
                $data['linkActive'] = Url::to('/company/active/token/'.$token_waiting_active.'.html', true);

                // Send email when register success (to active)
                $model->scenario = Users::SCENARIO_UPDATE;
                $model->status = Users::STATUS_WAITING_ACTIVE;
                $model->update();
                $temp = $this->renderPartial('@app/mail/layouts/company_register_success', ['data' => $data]);
                Email::sendMail(Helper::params().' - Active your account', $temp, $model->email, $model->name);
            }

            return $this->render('register_company_success', [
                'email' => $model->email,
            ]);
        } else {
            $erros = array_merge($model->getErrors(), $com->getErrors(), $userDetail->getErrors());
            foreach ($erros as $error) {
                $errors[] = $error[0];
            }
        }

        return $this->render('register_company', [
            'model' => $model,
            'userDetail' => $userDetail,
            'com' => $com,
            'errors' => $errors,
        ]);
    }

    /**
     * @param $token
     *
     * @return string|\yii\web\Response
     */
    public function actionActiveCompany($token)
    {
        /** @var Users $model */
        $model = Users::find()->where(['token_waiting_active' => $token])->one();
        if (!$model) {
            return $this->goHome();
        }
        $model->scenario = Users::SCENARIO_UPDATE;
        $model->status = Users::STATUS_ACTIVED;
        $model->token_waiting_active = Datetime::createdAt();
        $model->update();
        // Send email noti actived success
        $data['name'] = $model->name;
        $data['email'] = $model->email;
        $temp = $this->renderPartial('@app/mail/layouts/active_company_success', ['data' => $data]);
        Email::sendMail(Helper::params().' - Active your account success', $temp, $model->email, $model->name);

        return $this->render('active_company_success', [
            'model' => $model,
        ]);
    }

    /**
     * @return string|\yii\web\Response
     *
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
                    $ex = explode('.', $image->name);
                    $ext = end($ex);

                    // TODO: add new fild to save origin file name, generate a unique file name to prevent duplicate filenames
                    /*$com->logo = Yii::$app->security->generateRandomString().".{$ext}";
                    $path = Yii::$app->basePath.'/'.Yii::$app->params['companyLogoPath'] . $com->logo;*/

                    $path = Yii::$app->basePath.'/'.Yii::$app->params['companyLogoPath'].$image->name;
                    $image->saveAs($path);
                }

                if ($com->save()) {
                    $com->created_by = $model->getId();
                    $com->update();
                }
                $userDetail->user_id = $model->getId();
                $userDetail->save();
            }
            Yii::$app->session->setFlash('updateSuccess', 'Đã cập nhật thông tin công ty');
            $r = Yii::$app->request->get('r');
            if ($r) {
                return $this->redirect(Helper::encrypt($r, false));
            }
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

            'gender' => $gender,
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
            'model' => $model,
        ]);
    }

    public function actionViewProfile($id)
    {
        if (!Common::isLoginned()) {
            return $this->goHome();
        }

        if (Common::currentUser('type') == Users::USER_TYPE_CONTACT_OF_COMPANY) {
            return $this->render('profile_contact');
        } else {
            return $this->render('view_profile');
        }
    }

    /**
     * @return string|\yii\web\Response
     *
     * @throws BadRequestHttpException
     */
    public function actionUserProfile()
    {
        if (!Common::isLoginned()) {
            if (Common::currentUser('type') == Users::USER_TYPE_CONTACT_OF_COMPANY) {
                return $this->goHome();
            }

            return $this->goHome();
        }

        return $this->render('profile_user');
    }

    /**
     * http://localhost/client/profile.html
     *
     * @return string|\yii\web\Response
     */
    public function actionClientProfile()
    {
        if (!Common::isLoginned()) {
            return $this->goHome();
        } else {
            if (Common::currentUser('type') != Users::USER_TYPE_CONTACT_OF_COMPANY) {
                return $this->goHome();
            }
        }

        $imgForm = new ImageOnlyForm();

        return $this->render('profile_contact', [
            'imgForm' => $imgForm,
        ]);
    }

    /**
     * @return \yii\web\Response
     *
     * @throws BadRequestHttpException
     */
    public function actionClientInfos()
    {
        if (!Yii::$app->request->isAjax) {
            throw new BadRequestHttpException();
        }

        if (Common::isLoginned() && Common::currentUser('type') == Users::USER_TYPE_CONTACT_OF_COMPANY) {
            return $this->asJson(UserDetails::instance()->loadInfomationContactProfile(Yii::$app->request->get('info')));
        }
    }

    /**
     * @return \yii\web\Response
     *
     * @throws BadRequestHttpException
     */
    public function actionAjaxUploadImg()
    {
        if (!Yii::$app->request->isAjax) {
            throw new BadRequestHttpException();
        }

        $model = new ImageOnlyForm();
        if (Common::isLoginned()) {
            if (UploadedFile::getInstance($model, 'image')) {
                $model->image = UploadedFile::getInstance($model, 'image');
                $file_type = $model->image->extension;
                $file_name = $model->image->baseName;
                $file_path = $model->image->baseName.'-'.md5(date('dmyhis')).'.'.$file_type;
                $path = Yii::$app->basePath.'/'.Yii::$app->params['companyCompanyGallery'].$file_path;
                $model->image->saveAs($path);

                $object_id = Company::findOne(['created_by' => Common::currentUsers()->getId()])->id;
                FileUploads::saveFile(FileUploads::COM_GALLERY, $file_path, $file_name, $file_type, $object_id);

                return $this->asJson(['status' => true]);
            }
        }
    }

    /**
     * @return \yii\web\Response
     *
     * @throws BadRequestHttpException
     */
    public function actionAjaxDeleteImg()
    {
        if (!Yii::$app->request->isAjax || !Common::isLoginned()) {
            throw new BadRequestHttpException();
        }

        if (Yii::$app->request->isPost) {
            $fileId = Yii::$app->request->post('imgId');

            return $this->asJson(['status' => FileUploads::instance()->deleteFile($fileId)]);
        }
    }

    /**
     * @return \yii\web\Response
     *
     * @throws BadRequestHttpException
     */
    public function actionAjaxSortable()
    {
        if (!Yii::$app->request->isAjax || !Common::isLoginned()) {
            throw new BadRequestHttpException();
        }

        if (Yii::$app->request->isPost) {
            $data = Yii::$app->request->post();
            FileUploads::instance()->doArrange($data);

            return $this->asJson(['status' => 1]);
        }
    }

    /**
     * @return array|\yii\web\Response
     */
    public function actionLogin()
    {
        if (!Yii::$app->request->isAjax) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(\Yii::$app->request->post()) && $model->login()) {
            return $this->redirect(\Yii::$app->request->post('r'));
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

    /**
     * Url: http://www.localhost/user/reset-password/dvtyKtsPJZfAYN-cdA_bGUFT_Tn1NRkT.html
     *
     * @param $token
     *
     * @return string
     *
     * @throws BadRequestHttpException
     */
    public function actionProfileResetPassword($token)
    {
        $model = new ProfilePasswordForm();
        $model->scenario = ProfilePasswordForm::SCENARIO_RESET_PW;
        $user = Users::findOne(['password_reset_token' => $token]);
        if (!$user) {
            $url = Helper::siteURL();
            throw new BadRequestHttpException('Liên kết này đã hết hạn hoặc không tồn tại. <a href="'.$url.'">Quay lại trang chủ!</a>');
        }

        if ($model->load(Yii::$app->request->post())) {
            $user = Users::findOne(['password_reset_token' => $token]);
            $user->password_reset_token = $user->password_reset_token.'@'.Datetime::getDateNow(Datetime::SQL_DATETIME);
            $user->scenario = Users::SCENARIO_RESET_PW;
            if ($model->validate()) {
                $user->setPassword($model->changepassword);
                $user->save();
                //TODO: redirect to ...
            }
        }

        return $this->render('profile_reset_password', [
            'model' => $model,
        ]);
    }

    /**
     * @return string
     */
    public function actionProfileChangePassword()
    {
        $form = new ProfilePasswordForm();
        $form->scenario = ProfilePasswordForm::SCENARIO_UPDATE;
        if ($form->load(Yii::$app->request->post())) {
            $user = Users::findOne(['id' => \Yii::$app->user->identity->id]);
            $user->scenario = Users::SCENARIO_RESET_PW;
            // here we run our validation rules on the model

            if ($form->validatePassword('password')) {
                // if it is ok - setting the password property of user
                $user->setPassword($form->changepassword);
                // and finally save it
                if ($user->update()) {
                    $form = new ProfilePasswordForm();
                    $form->scenario = ProfilePasswordForm::SCENARIO_UPDATE;
                    Yii::$app->session->setFlash('update_pw_success', 'Mật khẩu mới đã được lưu.');
                }
            }
        }

        return $this->render('profile_change_password', [
            'model' => $form,
        ]);
    }

    /**
     * @return \yii\web\Response
     *
     * @throws BadRequestHttpException
     */
    public function actionLogout()
    {
        try {
            \Yii::$app->user->logout();

            return $this->redirect(Helper::encrypt(\Yii::$app->request->get('r'), false));
        } catch (Exception $exception) {
            throw new BadRequestHttpException($exception->getMessage());
        }
    }

    public function getToken($token)
    {
        $model = Users::model()->findByAttributes(['token' => $token]);
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
                $model->token = 'null';
                $model->save();
                Yii::$app->user->setFlash('ganti', '<b>Password has been successfully changed! please login</b>');
                $this->redirect('?r=site/login');
                $this->refresh();
            }
        }
        $this->render('verifikasi', [
            'model' => $model,
        ]);
    }

    /**
     * @return string
     */
    public function actionForgot()
    {
        $form = new RequireResetPasswordForm();
        if (Yii::$app->request->isPost) {
            if ($form->load(Yii::$app->request->post()) && $form->validate()) {
                $data = Yii::$app->request->post($form->formName());
                $User = Users::findOne(['username' => $data['email']]);
                if ($User) {
                    $User->scenario = Users::SCENARIO_RESET_PW;
                    $token_reset_password = \Yii::$app->getSecurity()->generateRandomString();
                    $User->password_reset_token = $token_reset_password;
                    $User->update();
                    $data['name'] = $User->name;
                    $data['link'] = Url::to('/user/reset-password/'.$token_reset_password.'.html', true);
                    $temp = $this->renderPartial('@app/mail/layouts/reset_password', ['data' => $data]);
                    $send = Email::sendMail('Reset password - '.Yii::$app->params['siteName'], $temp);
                    $send = true;
                    if ($send) {
                        return $this->render('forgot_success', [
                            'email' => $User->email,
                        ]);
                    }
                } else {
                    $form->addError('email', 'Xin lỗi, chúng tôi không tìm thấy địa chỉ email này trong hệ thống!');
                }
            }
        }

        return $this->render('forgot', [
            'model' => $form,
        ]);
    }
}

<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\modules\front\controllers;

use app\forms\ApplyForm;
use app\library\helper\Common;
use app\library\helper\Datetime;
use app\library\helper\Helper;
use app\library\helper\Logs;
use app\models\Company;
use app\models\CurriculumVitae;
use app\models\Email;
use app\models\FileUploads;
use app\models\Job;
use app\models\UserDetails;
use app\models\UserJobs;
use app\models\Users;
use Carbon\Carbon;
use Yii;
use yii\web\BadRequestHttpException;
use yii\web\NotFoundHttpException;
use yii\web\Response;
use yii\web\UploadedFile;

/**
 * Default controller for the `front` module
 */
class JobsController extends FrontController
{
    private $attachment;

    /**
     * @param $slug
     * @param $id
     *
     * @return Response
     *
     * @throws BadRequestHttpException
     */
    public function actionFavorite($slug, $id)
    {
        if (!Yii::$app->request->isAjax) {
            throw new BadRequestHttpException('Không tìm thấy yêu cầu của bạn!');
        }

        if (Yii::$app->request->isAjax && Common::isLoginned()) {
            $favorite = UserJobs::favorite($id, Yii::$app->request->post());
            if ($favorite === false) {
                return $this->asJson(new BadRequestHttpException());
            } else {
                return $this->asJson(['favorite' => $favorite]);
            }
        }
    }

    /**
     * @return Response
     *
     * @throws BadRequestHttpException
     */
    public function actionPreapply()
    {
        if (!Yii::$app->request->isAjax) {
            throw new BadRequestHttpException('Không tìm thấy yêu cầu của bạn!');
        }

        if (Yii::$app->request->isAjax && Common::isLoginned()) {
            $data = [];
            $cv = FileUploads::getCV();
            if ($cv) {
                foreach ($cv as $item) {
                    $data[] = [
                        'created_at' => Carbon::createFromFormat(Datetime::SQL_DATETIME, $item['created_at'])->diffForHumans(),
                        'file_path' => $item['file_path'],
                        'file_name' => $item['file_name'],
                    ];
                }
            }

            return $this->asJson(['data' => $data]);
        }
    }

    /**
     * Renders the index view for the module
     *
     * @return string
     */
    public function actionIndex()
    {
//        return $this->render('index');
    }

    /**
     * @return string|\yii\web\Response
     */
    public function actionPostJobs()
    {
        if (!Common::isLoginned() || Common::currentUsers()->type != Users::USER_TYPE_CONTACT_OF_COMPANY) {
            return $this->goHome();
        }

        $model = new Job();
        $model->client_status = Job::STATUS_CLIENT_DRAFT;
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            $model->company_id = Company::findOne(['created_by' => Common::currentUser()])->id;
            $model->slug = Helper::getInstance()->createSlug($model->title);
            $model->created_by = Common::currentUsers()->getId();
            $model->updated_by = Common::currentUsers()->getId();
            $model->created_at = Datetime::getInstance()->getDateNow(Datetime::SQL_DATETIME);
            $model->updated_at = Datetime::getInstance()->getDateNow(Datetime::SQL_DATETIME);
            $model->cv_end_date = Carbon::createFromFormat(Datetime::INPUT_DMY, $model->cv_end_date)->format(Datetime::SQL_DATE);

            // TODO: will make func approve
            $model->effect_date = Datetime::getInstance()->getDateNow(Datetime::SQL_DATETIME);
            $model->approved_by = 1;
            $model->approved_at = Datetime::getInstance()->getDateNow(Datetime::SQL_DATETIME);
            $model->status = Job::STATUS_ACTIVE;

            if ($model->save()) {
                Yii::$app->session->setFlash('success', 'Tin tuyển dụng đã được lưu.');
                $url = Yii::$app->getUrlManager()->createUrl(['front/jobs/edit-jobs', 'id' => $model->id]);

                $data['id'] = $model->id;
                $data['title'] = $model->title;
                $data['status'] = $model->status;
                $temp = $this->renderPartial('@app/mail/layouts/noti_job_register', ['data' => $data]);
                Email::sendNotiCompanyPostJob('A company has just add a Job '.Helper::getInstance()->params(), $temp);
                return $this->redirect($url);
            }
        }

        return $this->render('jobs', [
            'model' => $model,
        ]);
    }

    /**
     * @param int $id
     *
     * @return string|\yii\web\Response
     *
     * @throws NotFoundHttpException
     */
    public function actionEditJobs($id = 0)
    {
        $model = null;
        if ($id) {
            $model = $this->findModel($id);
            $model->cv_end_date = Carbon::createFromFormat(Datetime::SQL_DATE, $model->cv_end_date)->format(Datetime::INPUT_DMY);
        }
        if (!$model) {
            throw new NotFoundHttpException('The requested page does not exist.');
        }

        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            $model->cv_end_date = Carbon::createFromFormat(Datetime::INPUT_DMY, $model->cv_end_date)->format(Datetime::SQL_DATE);
            if ($model->save()) {
                $data['id'] = $model->id;
                $data['title'] = $model->title;
                $data['status'] = $model->status;
                $temp = $this->renderPartial('@app/mail/layouts/noti_job_updated', ['data' => $data]);
                Email::sendNotiCompanyPostJob('A job has updated on '.Helper::getInstance()->params(), $temp);

                $r = Yii::$app->request->get('r');
                if ($r) {
                    Yii::$app->session->setFlash('success', 'Tin tuyển dụng đã được cập nhật.');

                    return $this->redirect(Helper::getInstance()->encrypt($r, false));
                }
            }
        }

        return $this->render('jobs', [
            'model' => $model,
        ]);
    }

    /**
     * @return string|\yii\web\Response
     */
    public function actionPostCv()
    {
        $model = CurriculumVitae::findOne(['created_by' => Common::currentUser()]);
        if ($model) {
            $url = Yii::$app->getUrlManager()->createUrl(['front/jobs/edit-cv', 'id' => $model->id]);

            return $this->redirect($url);
        }

        $model = new CurriculumVitae();
        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->save()) {
            $url = Yii::$app->getUrlManager()->createUrl(['front/jobs/edit-cv', 'id' => $model->id]);

            return $this->redirect($url);
        }

        return $this->render('cv', [
            'model' => $model,
        ]);
    }

    /**
     * @param int $id
     *
     * @return string|\yii\web\Response
     *
     * @throws NotFoundHttpException
     */
    public function actionEditCv($id = 0)
    {
        $model = null;
        if ($id) {
            $model = CurriculumVitae::findOne(['id' => $id]);
        }
        if (!$model || $model->created_by != Common::currentUser()) {
            throw new NotFoundHttpException('The requested page does not exist.');
        }

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->save()) {
            $url = Yii::$app->getUrlManager()->createUrl(['front/jobs/edit-cv', 'id' => $model->id]);

            return $this->redirect($url);
        }

        return $this->render('cv', [
            'model' => $model,
        ]);
    }

    /**
     * Url: service/jobs/top-list.html
     *
     * @return Response
     */
    public function actionTopList()
    {
        $jobs = Job::instance()->getAllCompanyJobs();

        return $this->asJson(['datas' => $jobs, 'jobs_counter' => count($jobs)]);
    }

    /**
     * @param $id
     *
     * @return string
     *
     * @throws BadRequestHttpException
     */
    public function actionCompanyDetail($id)
    {
        $company_id = Company::instance()->getCompanyCode($id);
        $company = Company::findOne($company_id);
        if (!$company) {
            throw new BadRequestHttpException();
        }

        return $this->render('company_detail', [
            'company' => $company,
            'galleries' => FileUploads::instance()->getGallery(FileUploads::COM_GALLERY, $company->id),
            'company_jobs' => Job::instance()->getAllCompanyJobs($company_id),
        ]);
    }

	/**
	 * Url: /service/jobs/apply.html
	 *
	 * @return Response
	 * @throws BadRequestHttpException
	 */
    public function actionApplyJob()
    {
        $form = new ApplyForm();

        if ($form->load(\Yii::$app->request->post())) {
            $form->new_cv = UploadedFile::getInstance($form, 'new_cv');
            $applyForm = \Yii::$app->request->post();
            if ($form->new_cv) {
                $file_type = $form->new_cv->extension;
                $file_name = $form->new_cv->baseName;
                $file_path = $form->new_cv->baseName.'-'.md5(date('dmyhis')).'.'.$file_type;
                $this->attachment = Yii::$app->basePath.'/'.Yii::$app->params['companyCandidatePath'].$file_path;
                $form->new_cv->saveAs($this->attachment);
                FileUploads::saveFile(FileUploads::CANDIDATE, $file_path, $file_name, $file_type);
            } else {
                $this->attachment = Yii::$app->basePath.'/'.Yii::$app->params['companyCandidatePath'].$applyForm['radios'];
            }

            $job_id = Job::instance()->getJobCode($applyForm['ApplyForm']['job_code']);
            $job = Job::instance()->getJobAndContact($job_id);

            // Save log to db

            // Send email
            $userDetail = UserDetails::instance()->getInfo();

            $data['linkJobDetail'] = Helper::getInstance()->siteURL(true).Helper::getInstance()->createUrl([
                'site/employeers-detail',
                'slug' => $job['slug'],
                'id' => Job::instance()->setJobCode($job_id),
            ]);
            $data['contactName'] = $job['name'];
            $data['candidateName'] = $userDetail->last_name;
            $data['candidateEmail'] = Common::currentUsers()->email;
            $data['candidatePhone'] = $userDetail->phone;
            //TODO: Add more and more infomation to send via email for contact
            $body = $this->renderPartial('@app/mail/layouts/candidate_apply_job', ['data' => $data]);
            Logs::getInstance()->applyEmail($data);
            // Send and CC to admin
            Email::sendMailApply('There is a candidate who has submitted the CV via '.Helper::getInstance()->params(), $body,
                $job['email'], $job['name'], $this->attachment);

            return $this->redirect($applyForm['ApplyForm']['redirect']);
        } else {
            throw new BadRequestHttpException();
        }
    }

    /**
     * Finds the AuthAssignment model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     *
     * @param string $id
     *
     * @return Job the loaded model
     *
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Job::findOne(['id' => $id])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}

<?php

namespace app\modules\front\controllers;

use app\library\helper\Common;
use app\library\helper\Datetime;
use app\library\helper\Helper;
use app\models\Company;
use app\models\CurriculumVitae;
use app\models\FileUploads;
use app\models\Job;
use app\models\UserJobs;
use app\models\Users;
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

    public function actionFavorite($slug, $id){
        if(!Yii::$app->request->isAjax){
            throw new BadRequestHttpException('Không tìm thấy yêu cầu của bạn!');
        }

        if(Yii::$app->request->isAjax && Common::isLoginned()){
            $favorite = UserJobs::favorite($id, Yii::$app->request->post());
            if($favorite === false){
            	return $this->asJson(new BadRequestHttpException());
            }else{
	            return $this->asJson(['favorite' => $favorite]);
            }
        }
    }

	/**
	 * @return Response
	 * @throws BadRequestHttpException
	 */
    public function actionPreapply(){
        if(!Yii::$app->request->isAjax){
            throw new BadRequestHttpException('Không tìm thấy yêu cầu của bạn!');
        }

        if(Yii::$app->request->isAjax && Common::isLoginned()){
            $cv = FileUploads::getCV();
            return $this->asJson(['data' => $cv]);
        }
    }

    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
//        return $this->render('index');
    }

    /**
     * @return string|\yii\web\Response
     */
    public function actionPostJobs(){
        if (!Common::isLoginned() || Common::currentUsers()->type != Users::USER_TYPE_CONTACT_OF_COMPANY) {
            return $this->goHome();
        }

        $model = new Job();
        $model->client_status = Job::STATUS_CLIENT_DRAFT;
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            $model->company_id = Company::findOne(['created_by' => Common::currentUser()])->id;
            $model->slug = Helper::createSlug($model->title);
            $model->created_by = Common::currentUsers()->getId();
            $model->updated_by = Common::currentUsers()->getId();
            $model->created_at = Datetime::getDateNow(Datetime::SQL_DATETIME);
            $model->updated_at = Datetime::getDateNow(Datetime::SQL_DATETIME);

            // TODO: will make func approve
            $model->effect_date = Datetime::getDateNow(Datetime::SQL_DATETIME);
            $model->approved_by = 1;
            $model->approved_at = Datetime::getDateNow(Datetime::SQL_DATETIME);
            $model->status = Job::STATUS_ACTIVE;

            if ($model->save()) {
                Yii::$app->session->setFlash('success', "Tin tuyển dụng đã được lưu.");
                $url = Yii::$app->getUrlManager()->createUrl(['front/jobs/edit-jobs', 'id' => $model->id]);
                return $this->redirect($url);
            }
        }

        return $this->render('jobs', [
            'model' => $model,
        ]);
    }

    /**
     * @param int $id
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException
     */
    public function actionEditJobs($id = 0){
        $model = null;
        if($id){
            $model = $this->findModel($id);
        }
        if(!$model){
            throw new NotFoundHttpException('The requested page does not exist.');
        }

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->save()) {
			$r = Yii::$app->request->get('r');
			if($r){
				Yii::$app->session->setFlash('success', "Tin tuyển dụng đã được cập nhật.");
				return $this->redirect(Helper::encrypt($r, false));
			}
	        $this->refresh();
        }

        return $this->render('jobs', [
            'model' => $model,
        ]);
    }

    /**
     * @return string|\yii\web\Response
     */
    public function actionPostCv(){
        $model = CurriculumVitae::findOne(['created_by' => Common::currentUser()]);
        if($model){
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
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException
     */
    public function actionEditCv($id = 0){
        $model = null;
        if($id){
            $model = CurriculumVitae::findOne(['id' => $id]);
        }
        if(!$model || $model->created_by != Common::currentUser()){
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
	 * @return Response
	 */
    public function actionTopList(){
	    $jobs = Job::instance()->getAllCompanyJobs();
	    return $this->asJson($jobs);
    }

	/**
	 * @param $id
	 * @return string
	 * @throws BadRequestHttpException
	 */
    public function actionCompanyDetail($id){
	    $company = Company::findOne($id);
	    if(!$company){
	    	throw new BadRequestHttpException();
	    }

	    return $this->render('company_detail', [
			'company' => $company,
			'galleries' => FileUploads::instance()->getGallery(FileUploads::COM_GALLERY, $company->id),
	    ]);
    }

    /**
     * Finds the AuthAssignment model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $id
     * @return Job the loaded model
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

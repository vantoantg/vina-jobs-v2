<?php

namespace app\modules\front\controllers;

use app\models\Job;
use Yii;
use app\forms\LoginForm;
use app\forms\ProfilePasswordForm;
use app\forms\RequireResetPasswordForm;
use app\library\helper\Helper;
use app\models\Users;
use yii\web\NotFoundHttpException;


/**
 * Default controller for the `front` module
 */
class JobsController extends FrontController
{
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
        $model = new Job();
        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->save()) {

            $url = Yii::$app->getUrlManager()->createUrl(['front/jobs/edit-jobs', 'id' => $model->id]);
            return $this->redirect($url);
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
        if($id){
            $model = $this->findModel($id);
        }
        if(!$model){
            throw new NotFoundHttpException('The requested page does not exist.');
        }

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->save()) {
            $this->refresh();
        }

        return $this->render('jobs', [
            'model' => $model,
        ]);
    }


    public function actionPostCv(){
        $model = new \app\models\CurriculumVitae();

        if ($model->load(Yii::$app->request->post())) {
            if ($model->validate()) {
                // form inputs are valid, do something here
                return;
            }
        }

        return $this->render('cv', [
            'model' => $model,
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

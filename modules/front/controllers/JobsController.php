<?php

namespace app\modules\front\controllers;

use app\library\helper\Common;
use app\models\CurriculumVitae;
use app\models\Job;
use Yii;
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
        $model = null;
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

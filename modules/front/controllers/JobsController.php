<?php

namespace app\modules\front\controllers;

use Yii;
use app\forms\LoginForm;
use app\forms\ProfilePasswordForm;
use app\forms\RequireResetPasswordForm;
use app\library\helper\Helper;
use app\models\Users;


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

    public function actionPostJobs(){
        $model = new \app\models\Job();

        if ($model->load(Yii::$app->request->post()) && $model->validate()) {

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
}

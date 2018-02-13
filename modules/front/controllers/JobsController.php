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

    }

    public function actionPostCV(){

    }
}

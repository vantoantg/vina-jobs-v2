<?php

namespace app\modules\jobs\controllers;

use app\modules\admin\controllers\AdminController;
use yii\web\Controller;

/**
 * Default controller for the `jobs` module
 */
class DefaultController extends AdminController
{
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }
}

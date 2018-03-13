<?php

namespace app\modules\front\controllers;

use app\forms\SearchForm;
use app\library\helper\Helper;
use app\models\Pages;


/**
 * Default controller for the `front` module
 */
class DefaultController extends FrontController
{
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        $form = new SearchForm();
        return $this->render('index', [
        	'search' => $form
        ]);
    }
}

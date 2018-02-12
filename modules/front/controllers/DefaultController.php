<?php

namespace app\modules\front\controllers;

use app\library\helper\Helper;


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
        echo '<pre>';
        print_r(12312313);
        echo '</pre>';
        die;
        return $this->render('index');
    }
}

<?php

/*
 *  Created by Tona Nguyễn.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: Hồ Chí Minh, Việt Nam
 *  Website: https://jobsvina.com/
 */

namespace app\modules\admin\controllers;

/**
 * Default controller for the `admin` module
 */
class DefaultController extends AdminController
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

    public function actionDashboard()
    {
        return $this->render('index');
    }
}

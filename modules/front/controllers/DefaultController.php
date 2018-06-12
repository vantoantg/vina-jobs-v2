<?php

/*
 *  Created by Tona Nguyen.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\modules\front\controllers;

use app\forms\SearchForm;
use app\library\helper\Device;
use yii\web\BadRequestHttpException;

/**
 * Default controller for the `front` module
 */
class DefaultController extends FrontController
{
    /**
     * Renders the index view for the module
     *
     * @return string
     */
    public function actionIndex()
    {
        if (Device::getInstance()->isMoble()) {
        }

        $form = new SearchForm();

        return $this->render('index', [
            'search' => $form,
        ]);
    }

    public function actionAjaxSearch()
    {
        if (\Yii::$app->request->isAjax) {
            $postForm = \Yii::$app->request->post('data');
            // TODO: search query and reurn ...

            return $this->asJson([$postForm]);
        }

        throw new BadRequestHttpException('Not found your request !');
    }

    /**
     * Renders the index view for the module
     *
     * @return string
     */
    public function actionCallback()
    {
    }
}

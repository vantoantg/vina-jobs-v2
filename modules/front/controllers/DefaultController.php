<?php

namespace app\modules\front\controllers;

use app\components\UserOnlineWidget;
use app\forms\SearchForm;
use app\library\helper\Device;
use app\library\helper\Helper;
use app\models\Pages;
use Detection\MobileDetect;
use yii\base\Response;
use yii\web\BadRequestHttpException;


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
        if(Device::getInstance()->isMoble()){

        }


        $form = new SearchForm();
        return $this->render('index', [
        	'search' => $form
        ]);
    }

    public function actionAjaxSearch(){
		if(\Yii::$app->request->isAjax){
			$postForm = \Yii::$app->request->post('data');
			// TODO: search query and reurn ...


			return $this->asJson([$postForm]);
		}

		throw new BadRequestHttpException('Not found your request !');
    }

	/**
	 * Renders the index view for the module
	 * @return string
	 */
	public function actionCallback()
	{

	}
}

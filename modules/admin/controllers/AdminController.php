<?php

namespace app\modules\admin\controllers;

use app\library\helper\Role;

/**
 * Class BaseController
 * @package app\modules\admin\controllers
 */
class AdminController extends BaseController
{

    /**
     * @var \Yii
     */
	public $app;

	public function init()
	{
		parent::init();
		$this->app = \Yii::$app;
		$this->layout = '/admin';
		$this->app->name = 'Admin';

		if(!\Yii::$app->getUser()->identity){
			return $this->redirect(['/admin/login']);
		}

        $this->setSetting();

		if(!Role::allowAdmin()){
//			return $this->redirect(Helper::siteURL());
		}
	}

	/**
	 * Get setting from DB
	 */
	public function setSetting(){

	}

	/**
	 * @param \yii\base\Action $action
	 * @param mixed $result
	 * @return mixed
	 */
	public function afterAction($action, $result)
	{
		$result = parent::afterAction($action, $result);
//		LogSystemWidget::createLogs();
		return $result;
	}

}

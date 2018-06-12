<?php

/*
 *  Created by Tona Nguyen.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\modules\system\controllers;

use yii\base\Exception;
use yii\web\Controller;

/**
 * Default controller for the `system` module
 */
class SetupDefaultController extends Controller
{
    public function init()
    {
        parent::init();
        $this->layout = 'setup';
    }

    /**
     * @throws \Exception
     */
    public function actionIndex()
    {
        $pathRoot = \Yii::$app->getBasePath();
        $pathAssets = $pathRoot.'/assets';
        try {
            chmod($pathAssets, 0777);
            echo "Changed $pathAssets to CHMOD 0777";
        } catch (Exception $exception) {
            throw new \Exception($exception->getMessage().' Couldn\'t set permission.');
        }

//        return $this->goHome();
    }
}

<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 5/27/2018
 * Time: 8:44 PM
 */

namespace app\components;

use yii\web\Response;

class CaptchaAction extends \yii\captcha\CaptchaAction
{
    public $autoRegenerate = true;

    public function run()
    {
        $this->foreColor = 0x202020;
        $this->fontFile = 'web/template/jobs/prod/fonts/captcha/BANANA_TYPE.ttf';
        return parent::run();
    }
}

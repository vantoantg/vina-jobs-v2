<?php

/*
 *  Created by Tona Nguyen.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\components;

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

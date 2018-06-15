<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\components;

class AuthChoiceAsset extends \yii\web\AssetBundle
{
    public $sourcePath = '@yii/authclient/assets';
    public $js = [
        'authchoiceaaa.js',
    ];
    public $depends = [
//        'yii\authclient\widgets\AuthChoiceStyleAsset',
        'yii\web\YiiAsset',
    ];
}

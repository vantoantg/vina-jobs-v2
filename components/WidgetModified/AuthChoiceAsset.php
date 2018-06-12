<?php

/*
 *  Created by Tona Nguyễn.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: Hồ Chí Minh, Việt Nam
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

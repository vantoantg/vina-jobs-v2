<?php
/**
 * Created by PhpStorm.
 * User: HP570
 * Date: 6/5/2018
 * Time: 11:10 AM
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
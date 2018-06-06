<?php
/**
 *
 */

namespace app\assets\app;

use yii\web\AssetBundle;

/**
 * Class AppAsset
 * @package app\assets
 */
class AppProdAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
//        'web/template/jobs/prod/css/all.min.css',
    ];
    public $js = [
        'web/template/jobs/prod/js/all.min.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
//        'yii\bootstrap\BootstrapAsset',
    ];
}

<?php
/**
 *
 */
namespace app\assets\app;

use yii\web\AssetBundle;

/**
 * Class AppAssetLogin
 * @package app\assets\admin
 */
class AppAssetAdminLogin extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'http://fonts.googleapis.com/css?family=Roboto:300italic,400italic,300,400,500,700,900',
        'web/template/admin/assets/css/theme-default/bootstrap.css',
        'web/template/admin/assets/css/theme-default/materialadmin.css',
        'web/template/admin/assets/css/theme-default/font-awesome.min.css',
        'web/template/admin/assets/css/theme-default/material-design-iconic-font.min.css',
        'web/template/admin/assets/css/theme-default/libs/rickshaw/rickshaw.css',
        'web/template/admin/assets/css/theme-default/libs/morris/morris.core.css',

        'web/css/common/common.css',
    ];
    public $js = [
        'web/template/admin/assets/js/libs/bootstrap/bootstrap.min.js',
        'web/template/admin/assets/js/libs/spin.js/spin.min.js',
        'web/template/admin/assets/js/libs/autosize/jquery.autosize.min.js',
        'web/template/admin/assets/js/libs/moment/moment.min.js',
        'web/template/admin/assets/js/libs/flot/jquery.flot.min.js',
        'web/template/admin/assets/js/libs/flot/jquery.flot.time.min.js',
        'web/template/admin/assets/js/libs/flot/jquery.flot.resize.min.js',
        'web/template/admin/assets/js/libs/flot/jquery.flot.orderBars.js',
        'web/template/admin/assets/js/libs/flot/jquery.flot.pie.js',
        'web/template/admin/assets/js/libs/flot/curvedLines.js',
        'web/template/admin/assets/js/libs/jquery-knob/jquery.knob.min.js',
        'web/template/admin/assets/js/libs/sparkline/jquery.sparkline.min.js',
        'web/template/admin/assets/js/libs/nanoscroller/jquery.nanoscroller.min.js',
        'web/template/admin/assets/js/libs/d3/d3.min.js',
        'web/template/admin/assets/js/libs/d3/d3.v3.js',
        'web/template/admin/assets/js/libs/rickshaw/rickshaw.min.js',
        'web/template/admin/assets/js/core/source/App.js',
        'web/template/admin/assets/js/core/source/AppNavigation.js',
        'web/template/admin/assets/js/core/source/AppOffcanvas.js',
        'web/template/admin/assets/js/core/source/AppCard.js',
        'web/template/admin/assets/js/core/source/AppForm.js',
        'web/template/admin/assets/js/core/source/AppNavSearch.js',
        'web/template/admin/assets/js/core/source/AppVendor.js',
        'web/template/admin/assets/js/core/demo/Demo.js',

        'web/js/common/common.js',
        'web/js/common/service.js',
        'web/js/admin/login.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}

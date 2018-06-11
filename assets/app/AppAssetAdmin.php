<?php
/**
 *
 */

namespace app\assets\app;

use yii\web\AssetBundle;

/**
 * Class AppAsset
 * @package app\assets\admin
 */
class AppAssetAdmin extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'https://fonts.googleapis.com/css?family=Roboto:300italic,400italic,300,400,500,700,900',
        'web/template/admin/assets/css/theme-default/bootstrap.css',
        'web/template/admin/assets/css/theme-default/materialadmin.css',
        'web/template/admin/assets/css/theme-default/font-awesome.min.css',
        'web/template/admin/assets/css/theme-default/material-design-iconic-font.min.css',
        'web/template/admin/assets/css/theme-default/libs/rickshaw/rickshaw.css',
        'web/template/admin/assets/css/theme-default/libs/morris/morris.core.css',

        'vendor/bower-asset/jquery-confirm2/css/jquery-confirm.css',

        'web/template/admin/assets/less/admin.css',
    ];
    public $js = [
//		'web/template/admin/assets/js/libs/jquery/jquery-1.11.2.min.js',
        'web/js/common/config.js',
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
        'web/template/admin/assets/js/core/demo/DemoDashboard.js',

        'vendor/bower-asset/jquery-confirm2/js/jquery-confirm.js',
        'https://cdnjs.cloudflare.com/ajax/libs/ace/1.2.8/ace.js',
        'https://cdnjs.cloudflare.com/ajax/libs/ace/1.2.8/ext-language_tools.js',

        /* CkEditor */
        'web/ckeditors/ckeditor/ckeditor.js',
        /* CkFinder */
        'web/ckeditors/ckfinder/ckfinder.js?type=Images',

        'web/js/common/common.js',
        'web/js/common/service.js',
        'web/js/admin/admin.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
    public $jsOptions = ['position' => \yii\web\View::POS_END];
}

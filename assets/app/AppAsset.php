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
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
//        'web/css/site.css',
//        'http://fonts.googleapis.com/css?family=Roboto',
//        'http://fonts.googleapis.com/css?family=Lato:400,700',
	    'web/template/jobs/fontawesome-free-5.0.10/web-fonts-with-css/css/fontawesome-all.css',
	    'web/template/jobs/css/gg-opensans/css.css',
        'web/template/jobs/css/normalize.css',
        'web/template/jobs/css/fontello.css',
        'web/template/jobs/css/animate.css',
        'web/template/jobs/css/bootstrap.min.css',
        'web/template/admin/assets/css/theme-default/libs/bootstrap-datepicker/datepicker3.css',
        'web/template/jobs/css/owl.carousel.css',
        'web/template/jobs/css/owl.theme.css',
        'web/template/jobs/css/owl.transitions.css',
        'vendor/bower-asset/select2/dist/css/select2.min.css',
        'vendor/bower-asset/iCheck/skins/all.css',
        'web/template/jobs/style.css',
        'web/template/jobs/responsive.css',
        'web/template/jobs/less/my-site.css',
    ];
    public $js = [
        'web/template/jobs/js/vendor/modernizr-2.6.2.min.js',
        'web/template/jobs/js/bootstrap.min.js',
        'web/template/admin/assets/js/libs/bootstrap-datepicker/bootstrap-datepicker.js',
        'web/template/admin/assets/js/libs/bootstrap-datepicker/locales/bootstrap-datepicker.vi.js',
        'web/template/jobs/js/owl.carousel.min.js',
        'web/template/jobs/js/wow.js',
        'vendor/bower-asset/select2/dist/js/select2.min.js',
        'vendor/bower-asset/iCheck/icheck.min.js',
        'vendor/bower-asset/cropit/dist/jquery.cropit.js',
        'vendor/bower-asset/jquery-lazy/jquery.lazy.min.js',
        'web/template/jobs/js/main.js',
        'web/template/jobs/js/underscore-min.js',
        'web/js/common/service.js',
        'web/js/common/common.js',
        'web/js/site/login.js',
        'web/js/site/main.js',
        'web/js/site/candidate.js',
        'web/js/site/search.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
//        'yii\bootstrap\BootstrapAsset',
    ];
}

<?php

/* @var $this \yii\web\View */

/* @var $content string */

use yii\helpers\Html;
use app\assets\app\AppAsset;
use app\assets\app\AppProdAsset;
use \app\library\helper\Helper;

if (YII_DEBUG) {
	AppAsset::register($this);
} else {
	AppProdAsset::register($this);
}
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <meta name="description" content="<?= Yii::$app->params['seo']['description'] ?>">
    <meta name="keywords" content="<?= Yii::$app->params['seo']['keywords'] ?>">
    <meta name="robots" content="index,follow">
    <meta name="copyright" content="index,follow">

    <link rel="shortcut icon" type="image/png" href="<?= \app\library\helper\Helper::homeUrl() ?>favicon.ico"/>

    <!-- Jobs - Vina -->
    <meta property="og:type" content="Tuyển dụng và tìm kiếm việc làm"/>
    <meta property="og:title" content="<?= Html::encode($this->title) ?>"/>
    <meta property="og:url" content="<?= \app\library\helper\Helper::siteURL() ?>"/>
    <meta property="og:description" content="<?= Yii::$app->params['seo']['description'] ?>"/>
    <meta property="article:published_time" content="2015-11-09T16:39:31+00:00"/>
    <meta property="article:modified_time" content="2017-08-01T18:22:52+00:00"/>
    <meta property="og:site_name" content="<?= \app\library\helper\Helper::siteURL() ?>"/>
    <meta property="og:image" content="<?= \app\library\helper\Helper::homeUrl() ?>favicon.ico?w=200"/>
    <meta property="og:image:width" content="200"/>
    <meta property="og:image:height" content="200"/>
    <meta property="og:locale" content="<?= Yii::$app->language ?>"/>
    <meta name="twitter:site" content="<?= \app\library\helper\Helper::siteURL() ?>"/>
    <meta name="twitter:text:title" content="<?= Html::encode($this->title) ?>"/>
    <meta name="twitter:image" content="<?= \app\library\helper\Helper::homeUrl() ?>favicon.ico?w=240"/>
    <meta name="twitter:card" content="summary"/>
    <meta name="twitter:creator" content="Jobs - Vina"/>
    <meta name="twitter:description" content="<?= Yii::$app->params['seo']['description'] ?>"/>
    <meta property="article:publisher" content="https://www.facebook.com/vina-jobs.com"/>

	<?php $this->head() ?>
</head>
<body class="<?= Yii::$app->controller->id ?>-<?= Yii::$app->controller->action->id ?>">
<input type="hidden" id="setting-common"
       data-site="<?= \app\library\helper\Helper::homeUrl() ?>"
       data-page-current="<?= Yii::$app->controller->module->id . '/' . Yii::$app->controller->id ?>"
>
<?php $this->beginBody() ?>
<!-- Body content -->
<div class="header-connect">
	<?= $this->render('//layouts/jobs/header'); ?>
</div>

<nav class="navbar navbar-default">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">&nbsp;</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<?= Yii::$app->homeUrl; ?>" title="<?= Helper::siteURL() ?>"><img
                        src="<?= Helper::homeUrl() ?>web/template/jobs/img/logo.jpg" style="max-height: 50px"
                        alt="vina-jobs"></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <?= $this->render('//layouts/jobs/nav'); ?>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<?= $content ?>

<?= (new \app\components\UserWidget())->optionsRegister() ?>
<?= (new \app\components\UserWidget())->login() ?>

<div class="footer-area">
	<?= $this->render('//layouts/jobs/footer'); ?>
</div><!-- /.footer-area -->

<?php
//\app\components\LogSystemWidget::createLogs();
//\app\components\UserOnlineWidget::userOnline();
?>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>

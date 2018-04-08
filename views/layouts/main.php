<?php

/* @var $this \yii\web\View */

/* @var $content string */

use app\widgets\Alert;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;
use \app\library\helper\Helper;

AppAsset::register($this);
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

	<!-- Jetpack Open Graph Tags -->
	<meta property="og:type" content="article"/>
	<meta property="og:title" content="Marketing &#8211; Create your stunning website"/>
	<meta property="og:url" content="<?= \app\library\helper\Helper::siteURL() ?>"/>
	<meta property="og:description" content="Visit the post for more."/>
	<meta property="article:published_time" content="2015-11-09T16:39:31+00:00"/>
	<meta property="article:modified_time" content="2017-08-01T18:22:52+00:00"/>
	<meta property="og:site_name" content="<?= \app\library\helper\Helper::siteURL() ?>"/>
	<meta property="og:image" content="<?= \app\library\helper\Helper::homeUrl() ?>favicon.ico?w=200"/>
	<meta property="og:image:width" content="200"/>
	<meta property="og:image:height" content="200"/>
	<meta property="og:locale" content="<?= Yii::$app->language ?>"/>
	<meta name="twitter:site" content="@vina-jobsDotCom"/>
	<meta name="twitter:text:title" content="Marketing &#8211; Create your stunning&nbsp;website"/>
	<meta name="twitter:image" content="<?= \app\library\helper\Helper::homeUrl() ?>favicon.ico?w=240"/>
	<meta name="twitter:card" content="summary"/>
	<meta name="twitter:creator" content="@vina-jobsDotCom"/>
	<meta name="twitter:description" content="Post by @vina-jobsDotCom."/>
	<meta property="article:publisher" content="https://www.facebook.com/vina-jobs.com"/>

    <?php $this->head() ?>
</head>
<body class="<?= Yii::$app->controller->id ?>-<?= Yii::$app->controller->action->id ?>">
<input type="hidden" id="setting-common"
       data-site="<?= \app\library\helper\Helper::homeUrl() ?>"
       data-page-current="<?= Yii::$app->controller->module->id . '/' . Yii::$app->controller->id ?>"
>
<?php $this->beginBody() ?>
<div id="preloader">
	<div id="status">&nbsp;</div>
</div>
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
				<span class="sr-only">Toggle navigation</span>
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
			<div class="button navbar-right">
                <?php
                if (\app\library\helper\Common::isLoginned()) {
                    ?>
					<div class="dropdown">
						<button class="navbar-btn nav-button wow bounceInRight login dropdown-toggle" type="button"
						        id="dropdownMenuButton" data-wow-delay="0.8s" data-toggle="dropdown"
						        aria-haspopup="true" aria-expanded="false">
                            <?= \app\library\helper\Common::currentUser('name') ?> <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
							<?php if(\app\library\helper\Common::currentUser('type') == \app\models\Users::USER_TYPE_CONTACT_OF_COMPANY){ ?>
							<li role="presentation">
								<a role="menuitem" tabindex="-1" href="<?= Helper::createUrl(['front/jobs/post-jobs']) ?>">Tạo công việc</a>
							</li>
							<?php } ?>
							<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Thay đổi mật khẩu</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Thay đổi thông tin</a></li>
							<?php if(\app\library\helper\Common::currentUser('type') == \app\models\Users::USER_TYPE_CONTACT_OF_COMPANY){ ?>
							<li role="presentation"><a href="<?= Helper::createUrl(['front/user/user-profile']) ?>">Trang cá nhân</a></li>
							<?php }else{ ?>
							<li role="presentation"><a href="<?= Helper::createUrl(['front/user/contact-profile']) ?>">Trang cá nhân</a></li>
                            <?php } ?>
							<li role="presentation" class="divider"></li>
							<li role="presentation"><a href="<?= Helper::createUrl(['front/user/logout']) ?>">Đăng xuất</a>
							</li>
						</ul>
					</div>

                <?php } else { ?>
					<button class="navbar-btn nav-button wow fadeInRight" data-toggle="modal"
					        data-target="#register-modal" data-wow-delay="0.6s">Đăng ký
					</button>
					<button class="navbar-btn nav-button wow bounceInRight login" data-toggle="modal"
					        data-target="#login-modal" data-wow-delay="0.8s">Đăng nhập
					</button>
                <?php } ?>
			</div>
			<ul class="main-nav nav navbar-nav navbar-right">
				<li class="wow fadeInDown" data-wow-delay="0s">
					<a class="<?= Helper::active('front/default/index') ?>" href="<?= Helper::createUrl(['front/default/index']) ?>">Trang chủ</a></li>
				<li class="wow fadeInDown" data-wow-delay="0.1s">
					<a class="<?= Helper::active('site/job-seekers') ?>" href="<?= Helper::createUrl(['site/job-seekers']) ?>">Người tìm việc</a></li>
				<li class="wow fadeInDown" data-wow-delay="0.2s">
					<a class="<?= Helper::active('site/employeers') ?>" href="<?= Helper::createUrl(['site/employeers']) ?>">Nhà tuyển dụng</a></li>
				<li class="wow fadeInDown" data-wow-delay="0.3s">
					<a class="<?= Helper::active('site/about-us') ?>" href="<?= Helper::createUrl(['site/about-us']) ?>">Giới thiệu</a></li>
				<li class="wow fadeInDown" data-wow-delay="0.4s">
					<a class="<?= Helper::active('site/blog') ?>" href="<?= Helper::createUrl(['site/blog']) ?>">Blog</a>
				</li>
				<li class="wow fadeInDown" data-wow-delay="0.5s">
					<a class="<?= Helper::active('site/contact') ?>" href="<?= Helper::createUrl(['site/contact']) ?>">Liên hệ</a></li>
			</ul>
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
\app\components\LogSystemWidget::createLogs();
\app\components\UserOnlineWidget::userOnline();
?>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>

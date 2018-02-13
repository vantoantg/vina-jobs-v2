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
    <link rel="shortcut icon" type="image/png" href="favicon.ico"/>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

<div id="preloader">
    <div id="status">&nbsp;</div>
</div>
<!-- Body content -->

<div class="header-connect">
    <div class="container">
        <div class="row">
            <div class="col-md-5 col-sm-8 col-xs-8">
                <div class="header-half header-call">
                    <p>
                        <span><i class="icon-cloud"></i>+019 4854 8817</span>
                        <span><i class="icon-mail"></i>ohidul.islam951@gmail.com</span>
                    </p>
                </div>
            </div>
            <div class="col-md-2 col-md-offset-5  col-sm-3 col-sm-offset-1  col-xs-3  col-xs-offset-1">
                <div class="header-half header-social">
                    <ul class="list-inline">
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-vine"></i></a></li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                        <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<nav class="navbar navbar-default">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<?= Yii::$app->homeUrl; ?>"><img src="<?= Helper::homeUrl()?>web/template/jobs/img/logo.jpg" style="max-height: 50px" alt=""></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <div class="button navbar-right">
                <?php
                if(\app\library\helper\Common::isLoginned()){
                ?>
                    <div class="dropdown">
                        <button class="navbar-btn nav-button wow bounceInRight login dropdown-toggle" type="button" id="dropdownMenuButton" data-wow-delay="0.8s" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <?= \app\library\helper\Common::currentUser('name') ?> <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="<?= Helper::createUrl('front/jobs/post-cv') ?>">Post a CV</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="<?= Helper::createUrl('front/jobs/post-jobs') ?>">Post a Job</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Change password</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Update profile</a></li>
                            <li role="presentation"><a href="<?= Helper::createUrl('front/user/profile') ?>">My page</a></li>
                            <li role="presentation" class="divider"></li>
                            <li role="presentation"><a href="<?= Helper::createUrl('front/user/logout') ?>">Logout</a></li>
                        </ul>
                    </div>


                <?php }else{ ?>
                <a href="<?= Helper::createUrl('front/user/register') ?>">
                    <button class="navbar-btn nav-button wow fadeInRight" data-wow-delay="0.6s">Sign up</button>
                </a>
                    <button class="navbar-btn nav-button wow bounceInRight login" data-toggle="modal" data-target="#login-modal" data-wow-delay="0.8s">Login</button>
                <?php } ?>
            </div>
            <ul class="main-nav nav navbar-nav navbar-right">
                <li class="wow fadeInDown" data-wow-delay="0s"><a class="<?= Helper::active('front/default/index') ?>" href="<?= Helper::createUrl() ?>">Home</a></li>
                <li class="wow fadeInDown" data-wow-delay="0.1s"><a class="<?= Helper::active('site/job-seekers') ?>" href="<?= Helper::createUrl('site/job-seekers') ?>">Job Seekers</a></li>
                <li class="wow fadeInDown" data-wow-delay="0.2s"><a class="<?= Helper::active('site/employeers') ?>" href="<?= Helper::createUrl('site/employeers') ?>">Employeers</a></li>
                <li class="wow fadeInDown" data-wow-delay="0.3s"><a class="<?= Helper::active('site/about-us') ?>" href="<?= Helper::createUrl('site/about-us') ?>">About us</a></li>
                <li class="wow fadeInDown" data-wow-delay="0.4s"><a class="<?= Helper::active('site/blog') ?>" href="<?= Helper::createUrl('site/blog') ?>">Blog</a></li>

                <li class="wow fadeInDown" data-wow-delay="0.5s"><a class="<?= Helper::active('site/contact') ?>" href="<?= Helper::createUrl('site/contact') ?>">Contact</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<?= $content ?>
<?= (new \app\components\UserWidget())->login() ?>

<div class="modal fade" id="register-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="loginmodal-container">
            <h1>Login</h1><br>
            <form>
                <input type="text" name="user" placeholder="Username">
                <input type="password" name="pass" placeholder="Password">
                <input type="submit" name="login" class="login loginmodal-submit" value="Login">
            </form>

            <div class="login-help">
                <a href="#">Register</a> - <a href="#">Forgot Password</a>
            </div>
            <div class="text-center socials">
                <h2>or</h2><br>
                <?= yii\authclient\widgets\AuthChoice::widget([
                    'baseAuthUrl' => ['/site/auth']
                ]) ?>
            </div>
        </div>
    </div>
</div>

<div class="footer-area">
    <div class="container">
        <div class="row footer">
            <div class="col-md-4">
                <div class="single-footer">
                    <img src="<?= Helper::homeUrl()?>web/template/jobs/img/logo.jpg" alt="" class="wow pulse" style="max-height: 73px" data-wow-delay="1s">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati architecto quaerat facere blanditiis tempora sequi nulla accusamus, possimus cum necessitatibus suscipit quia autem mollitia, similique quisquam molestias. Vel unde, blanditiis.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="single-footer">
                    <h4>Twitter update</h4>
                    <div class="twitter-updates">
                        <div class="single-tweets">
                            <h5>ABOUT 9 HOURS</h5>
                            <p><strong>AGOMeet Aldous</strong> - a Brave New World for #rails with more cohesion, less coupling and greater dev speed <a href="http://t.co/rsekglotzs">http://t.co/rsekglotzs</a></p>
                        </div>
                        <div class="single-tweets">
                            <h5>ABOUT 9 HOURS</h5>
                            <p><strong>AGOMeet Aldous</strong> - a Brave New World for #rails with more cohesion, less coupling and greater dev speed <a href="http://t.co/rsekglotzs">http://t.co/rsekglotzs</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="single-footer">
                    <h4>Useful lnks</h4>
                    <div class="footer-links">
                        <ul class="list-unstyled">
                            <li><a href="">About Us</a></li>
                            <li><a href="" class="active">Services</a></li>
                            <li><a href="">Work</a></li>
                            <li><a href="">Our Blog</a></li>
                            <li><a href="">Customers Testimonials</a></li>
                            <li><a href="">Affliate</a></li>
                            <li><a href="">Contact Us</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row footer-copy">
            <p><span>(C) webstie, All rights reserved</span> | <span>Graphic Designed by <a href="https://dribbble.com/siblu">Eftakher Alam</a></span> | <span> Web Designed by <a href="http://ohidul.me">Ohidul Islam</a></span> </p>
        </div>
    </div>
</div>


<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>

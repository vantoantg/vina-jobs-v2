<?php

// https://github.com/2amigos/yii2-file-upload-widget
use app\library\helper\Helper;

/** @var $page \app\models\Pages title */
/** @var $this \yii\web\View title */
$page = \app\models\Pages::get('register-company');
$this->title = Helper::getInstance()->titleSeo($page);
Helper::getInstance()->generateSeo($page);

$this->params['breadcrumbs'][] = ['label' => 'Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container">
    <div class="users-create">
        <h2>KÍCH HOẠT KHOẢN CÔNG TY THÀNH CÔNG</h2>
    </div>
</div>

<div class="container">
    <div class="col-12 col-sm-8">
        <div class="row main">
            <div class="main-login main-center">

                <div class="alert-message alert-message-info <?= \app\library\helper\Helper::getInstance()->wowClass(); ?> zoomInDown animated" data-wow-delay="0.2s">
                    <h4>Lưu ý:</h4>
                    <p>
                        Chúc mừng bạn đã đăng ký tài khoản công ty thành công. Hãy đăng nhập để cập nhật thông tin hoặc bắt đầu đăng tin tuyển dụng.</p>
                </div>

                <div class="col-xs-12 text-center">
                    <button class="navbar-btn nav-button <?= Helper::getInstance()->wowClass(); ?> bounceInRight login animated" data-toggle="modal" data-target="#login-modal" data-wow-delay="0.8s" style="visibility: visible; animation-delay: 0.8s; animation-name: bounceInRight;"><i class="fas fa-sign-in-alt"></i> Đăng nhập
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="col-12 col-sm-4">
        <?= (new \app\components\SidebarWidget())->recentJobs(); ?>
    </div>
</div>
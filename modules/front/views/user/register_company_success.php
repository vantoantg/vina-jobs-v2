<?php

use yii\helpers\Html;
use \yii\widgets\ActiveForm;
use dosamigos\fileupload\FileUploadUI; // https://github.com/2amigos/yii2-file-upload-widget
use \app\library\helper\Helper;

/** @var $page \app\models\Pages title */
/** @var $this \yii\web\View title */
$page = \app\models\Pages::get('register-company');
$this->title = Helper::titleSeo($page);
Helper::generateSeo($page);

$this->params['breadcrumbs'][] = ['label' => 'Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container">
    <div class="users-create">
        <h2>ĐĂNG KÝ TÀI KHOẢN CÔNG TY THÀNH CÔNG</h2>
    </div>
</div>

<div class="container">
    <div class="col-12 col-sm-8">
        <div class="row main">
            <div class="main-login main-center">

	            <!--<h3>Hệ thống đã gửi một email kích hoạt đến <?/*= $email; */?>  của bạn.<br>
                    Vui lòng kiểm tra email để có thể kích hoạt tài khoản!.</h3>-->
                <h4>Chúc mừng bạn đã đăng ký tài khoản công ty thành công. Hãy đăng nhập để cập nhật thông tin hoặc bắt đầu đăng tin tuyển dụng.</h4>
                <div class="col-xs-12 text-center">
                    <button class="navbar-btn nav-button wow bounceInRight login animated" data-toggle="modal" data-target="#login-modal" data-wow-delay="0.8s" style="visibility: visible; animation-delay: 0.8s; animation-name: bounceInRight;">Đăng nhập
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="col-12 col-sm-4">
        <?= (new \app\components\SidebarWidget())->recentJobs(); ?>
    </div>
</div>
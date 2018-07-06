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
\app\components\Menu\ActiveMenu::is('employeers');
?>

<div class="container">
    <div class="col-12 col-sm-8">
	    <div class="users-create">
		    <h2 class="text-center">ĐĂNG KÝ TÀI KHOẢN CÔNG TY THÀNH CÔNG</h2>
	    </div>

        <div class="row main">
            <div class="main-login main-center">

	            <div class="alert-message alert-message-info <?= \app\library\helper\Helper::getInstance()->wowClass(); ?> zoomInDown animated" data-wow-delay="0.2s">
		            <h4>Bạn đã đăng ký tài khoản trên <?= Helper::getInstance()->params(); ?>:</h4>
		            <!--<p>
			            Chào mừng bạn <?/*= $name; */?>, tài khoản của bạn đã đăng ký. Hệ thống đã gửi một email kích hoạt đến <strong><?/*= $email; */?></strong>  của bạn.<br>
			            Vui lòng kiểm tra email để có thể kích hoạt và hoàn thành việc đăng ký tài khoản.<br>
			            Vui lòng kiểm tra trong cả hộp thư spam.
		            </p>-->
		            <p>
			            - Chào mừng bạn <?= $name; ?>, tài khoản của bạn đã đăng ký thành công. Bạn đã có thể đăng nhập vào hệ thống và tạo tin tuyển dụng.<br>
			            - Bạn cũng có thể quản lý các thông tin, cập nhật hình ảnh công ty trong phần quản lý trang cá nhân của mình.<br>
			            - Xin chân thành cảm ơn đã sử dụng dịch vụ của chúng tôi !
		            </p>
	            </div>
            </div>
        </div>
    </div>

    <div class="col-12 col-sm-4">
        <?= (new \app\components\SidebarWidget())->recentJobs(); ?>
    </div>
</div>
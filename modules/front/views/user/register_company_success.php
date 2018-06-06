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
\app\components\Menu\ActiveMenu::is('employeers')
?>

<div class="container">
    <div class="col-12 col-sm-8">
	    <div class="users-create">
		    <h2 class="text-center">ĐĂNG KÝ TÀI KHOẢN CÔNG TY THÀNH CÔNG</h2>
	    </div>

        <div class="row main">
            <div class="main-login main-center">

	            <div class="alert-message alert-message-info <?= \app\library\helper\Helper::wowClass() ?> zoomInDown animated" data-wow-delay="0.2s">
		            <h4>Lưu ý:</h4>
		            <p>
			            Chúc mừng bạn, tài khoản của bạn đã đăng ký. Hệ thống đã gửi một email kích hoạt đến <?= $email; ?>  của bạn.<br>
			            Vui lòng kiểm tra email để có thể kích hoạt và hoàn thành việc đăng ký tài khoản.<br>
			            Vui lòng kiểm tra trong cả hộp thư spam.
		            </p>
	            </div>
            </div>
        </div>
    </div>

    <div class="col-12 col-sm-4">
        <?= (new \app\components\SidebarWidget())->recentJobs(); ?>
    </div>
</div>
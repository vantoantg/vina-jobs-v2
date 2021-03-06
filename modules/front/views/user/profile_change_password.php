<?php

use app\library\helper\Helper;

/* @var $this yii\web\View */
/* @var $model app\models\Users */

$page = \app\models\Pages::get('change-password');
$this->title = Helper::getInstance()->titleSeo($page);
Helper::getInstance()->generateSeo($page);

$this->params['breadcrumbs'][] = ['label' => 'Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="container">
    <div class="row">
        <div class="col-12 col-sm-8 <?= \app\library\helper\Helper::getInstance()->wowClass(); ?> fadeInUp" data-wow-delay="0.1s">
            <div class="users-create">
                <h1 class="text-center">THAY ĐỔI MẬT KHẨU</h1>
            </div>

            <div class="alert-message alert-message-info <?= Helper::getInstance()->wowClass(); ?> zoomInDown animated" data-wow-delay="0.2s">
                <h4>Lưu ý:</h4>
                <p>Bạn nên thay đổi mật khẩu nếu có đăng nhập trên thiết bị, máy tính không phải của bạn.<br>
                    Mật khẩu nên đặt có độ phức tạp, không nên sử dụng những mật khẩu đơn giản dễ đoán, dễ dò.</p>
            </div>

			<?php if (Yii::$app->session->hasFlash('update_pw_success')): ?>
                <div class="alert alert-success alert-dismissable">
                    <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                    <i class="icon fa fa-check"></i> <?= Yii::$app->session->getFlash('update_pw_success'); ?>
                </div>
			<?php endif; ?>

			<?php $form = \yii\widgets\ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>
			<?php
            echo $form->field($model, 'password')->passwordInput(['placeholder' => 'Mật khẩu hiện tại']);
            echo $form->field($model, 'changepassword')->passwordInput(['placeholder' => 'Mật khẩu mới']);
            echo $form->field($model, 'reenterpassword')->passwordInput(['placeholder' => 'Nhập lại mật khẩu mới']);
            ?>
            <div class="form-group">
				<?= \yii\helpers\Html::submitButton('<i class="far fa-hdd"></i> Lưu thay đổi', ['class' => 'btn btn-primary']); ?>
            </div>
			<?php \yii\widgets\ActiveForm::end(); ?>
        </div>

        <div class="col-12 col-sm-4">
			<?= (new \app\components\SidebarWidget())->recentJobs(); ?>
        </div>
    </div>
</div>

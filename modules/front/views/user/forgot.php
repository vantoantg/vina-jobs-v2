<?php

use yii\bootstrap\ActiveForm;
use app\library\helper\Helper;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\User */
/* @var $dataProvider yii\data\ActiveDataProvider */

$page = \app\models\Pages::get('forgot-password');
$this->title = Helper::getInstance()->titleSeo($page);
Helper::getInstance()->generateSeo($page);
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container">
    <div class="col-12 col-sm-8 ovf-y-h">
        <div class="users-index <?= Helper::getInstance()->wowClass(); ?> fadeInUp" data-wow-delay="0.1s">
            <h1>QUÊN MẬT KHẨU ?</h1>
            <div class="alert-message alert-message-info <?= Helper::getInstance()->wowClass(); ?> zoomInDown animated" data-wow-delay="0.2s">
                <p>Vui lòng điền đúng địa chỉ <strong>email bạn đã đăng ký</strong>, hệ thống sẽ gửi thông tin hướng dẫn để thiết lập mật khẩu mới vào email của bạn.
                    <br>
                </p>
            </div>
            <?php $form = ActiveForm::begin(); ?>
            <?php
            echo $form->field($model, 'email')->textInput(['placeholder' => 'Nhập email mà bạn đã đăng ký']);
            ?>
            <div class="form-group">
                <?= \yii\helpers\Html::submitButton('<i class="fas fa-location-arrow"></i> Gửi đi', ['class' => 'btn btn-primary']); ?>
            </div>
            <?php ActiveForm::end(); ?>
        </div>
    </div>
	<div class="col-12 col-sm-4">
        <?= (new \app\components\SidebarWidget())->recentJobs(); ?>
	</div>
</div>
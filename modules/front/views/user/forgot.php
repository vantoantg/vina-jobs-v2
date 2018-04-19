<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\bootstrap\ActiveForm;
use app\library\helper\Helper;
//use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\User */
/* @var $dataProvider yii\data\ActiveDataProvider */

$page = \app\models\Pages::get('register-candidate');
$this->title = Helper::titleSeo($page);
Helper::generateSeo($page);
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container">
    <div class="col-12 col-sm-8 ovf-y-h">
        <div class="users-index <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="0.1s">
            <h1>QUÊN MẬT KHẨU</h1>
            <h5>Vui lòng điền đúng địa chỉ email bạn đã đăng ký, hệ thống sẽ gửi thông tin hướng dẫn để thiết lập mật khẩu mới vào email của bạn.</h5>
            <?php $form = ActiveForm::begin(); ?>
            <?php
            echo $form->field($model, 'email');
            ?>
            <div class="form-group">
                <?= \yii\helpers\Html::submitButton('<i class="fas fa-location-arrow"></i> Gửi đi', ['class' => 'btn btn-primary']) ?>
            </div>
            <?php ActiveForm::end(); ?>
        </div>
    </div>
	<div class="col-12 col-sm-4">
        <?= (new \app\components\SidebarWidget())->recentJobs(); ?>
	</div>
</div>
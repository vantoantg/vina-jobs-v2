<?php

use yii\helpers\Html;
use \yii\widgets\ActiveForm;
use app\library\helper\Helper;


/* @var $this yii\web\View */
/* @var $model app\models\Users */

$page = \app\models\Pages::get('change-password');
$this->title = Helper::titleSeo($page);
Helper::generateSeo($page);

$this->params['breadcrumbs'][] = ['label' => 'Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="container">
	<div class="users-create">
		<h1><?= Html::encode($this->title) ?></h1>
	</div>

    <div class="row">
        <div class="col-12 col-sm-8 <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="0.1s">
            <div class="alert-message alert-message-info <?= Helper::wowClass() ?> zoomInDown animated" data-wow-delay="0.2s">
                <h4>Lưu ý:</h4>
                <p>Bạn nên thay đổi mật khẩu...</p>
            </div>

			<?php if (Yii::$app->session->hasFlash('update_pw_success')): ?>
                <div class="alert alert-success alert-dismissable">
                    <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                    <i class="icon fa fa-check"></i> <?= Yii::$app->session->getFlash('update_pw_success') ?>
                </div>
			<?php endif; ?>

			<?php $form = \yii\widgets\ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>
			<?php
			echo $form->field($model, 'password')->passwordInput(['placeholder' => 'Mật khẩu hiện tại']);
			echo $form->field($model, 'changepassword')->passwordInput(['placeholder' => 'Mật khẩu mới']);
			echo $form->field($model, 'reenterpassword')->passwordInput(['placeholder' => 'Nhập lại mật khẩu mới']);
			?>
            <div class="form-group">
				<?= \yii\helpers\Html::submitButton('<i class="far fa-hdd"></i> Lưu thay đổi', ['class' => 'btn btn-primary']) ?>
            </div>
			<?php \yii\widgets\ActiveForm::end(); ?>
        </div>

        <div class="col-12 col-sm-4">
			<?= (new \app\components\SidebarWidget())->recentJobs(); ?>
        </div>
    </div>
</div>

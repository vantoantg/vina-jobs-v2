<?php

use yii\helpers\Html;
use \yii\widgets\ActiveForm;
use app\library\helper\Helper;

/* @var $this yii\web\View */
/* @var $model app\models\Users */

$page = \app\models\Pages::get('reset-password');
$this->title = Helper::titleSeo($page);
Helper::generateSeo($page);
$this->params['breadcrumbs'][] = ['label' => 'Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="container">
    <div class="col-12 col-sm-8">
	    <div class="users-create text-center">
		    <h1>RESET MẬT KHẨU</h1>
	    </div>

		<?php $form = \yii\widgets\ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>
		<?php
        echo $form->field($model, 'changepassword')->passwordInput(['placeholder' => 'Mật khẩu mới']);
        echo $form->field($model, 'reenterpassword')->passwordInput(['placeholder' => 'Nhập lại khẩu mới']);
        ?>
        <div class="form-group">
			<?= \yii\helpers\Html::submitButton('<i class="far fa-hdd"></i> Lưu mật khẩu', ['class' => 'btn btn-primary']) ?>
        </div>
		<?php \yii\widgets\ActiveForm::end(); ?>
    </div>

    <div class="col-12 col-sm-4">
	    <?= (new \app\components\SidebarWidget())->recentJobs(); ?>
    </div>
</div>

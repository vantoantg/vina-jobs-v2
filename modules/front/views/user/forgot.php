<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\bootstrap\ActiveForm;
//use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\User */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Quên mật khẩu';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container">
    <div class="users-index">

        <h1><?= Html::encode($this->title) ?></h1>
        <h5>Vui lòng điền đúng địa chỉ email bạn đã đăng ký, hệ thống sẽ gửi mật khẩu mới vào email.</h5>
        <?php $form = ActiveForm::begin(); ?>
        <?php
        echo $form->field($model, 'email');
        ?>
        <div class="form-group">
            <?= \yii\helpers\Html::submitButton('Gửi', ['class' => 'btn btn-primary']) ?>
        </div>
        <?php ActiveForm::end(); ?>
    </div>
</div>
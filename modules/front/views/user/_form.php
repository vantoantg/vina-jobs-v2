<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Users */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="users-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'username')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'password')->passwordInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'auth_key')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'access_token')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'password_reset_token')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'role')->textInput(); ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'slug_name')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'avatar')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'archive')->textInput(); ?>

    <?= $form->field($model, 'type')->textInput(); ?>

    <?= $form->field($model, 'lang')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'timezone')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'status')->textInput(); ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']); ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\SendEmail */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="send-email-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'send_to')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'send_cc')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'subject')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'content')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'attach')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'template')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'is_sent')->textInput() ?>

    <?= $form->field($model, 'sent_date')->textInput() ?>

    <?= $form->field($model, 'sent_by')->textInput() ?>

    <?= $form->field($model, 'resent')->textInput() ?>

    <?= $form->field($model, 'created_at')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

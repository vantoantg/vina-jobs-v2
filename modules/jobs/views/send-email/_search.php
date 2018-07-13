<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\search\SendEmail */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="send-email-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => [
            'data-pjax' => 1
        ],
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'send_to') ?>

    <?= $form->field($model, 'send_cc') ?>

    <?= $form->field($model, 'subject') ?>

    <?= $form->field($model, 'content') ?>

    <?php // echo $form->field($model, 'attach') ?>

    <?php // echo $form->field($model, 'template') ?>

    <?php // echo $form->field($model, 'is_sent') ?>

    <?php // echo $form->field($model, 'sent_date') ?>

    <?php // echo $form->field($model, 'sent_by') ?>

    <?php // echo $form->field($model, 'resent') ?>

    <?php // echo $form->field($model, 'created_at') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

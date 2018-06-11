<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\search\LogSystem */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="log-system-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => [
            'data-pjax' => 1
        ],
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'url') ?>

    <?= $form->field($model, 'user_id') ?>

    <?= $form->field($model, 'ip') ?>

    <?= $form->field($model, 'browser') ?>

    <?php // echo $form->field($model, 'time')?>

    <?php // echo $form->field($model, 'controller')?>

    <?php // echo $form->field($model, 'action')?>

    <?php // echo $form->field($model, 'method')?>

    <?php // echo $form->field($model, 'user_timezone')?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

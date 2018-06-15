<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\search\System */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="system-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => [
            'data-pjax' => 1,
        ],
    ]); ?>

    <?= $form->field($model, 'id'); ?>

    <?= $form->field($model, 'name'); ?>

    <?= $form->field($model, 'code'); ?>

    <?= $form->field($model, 'value'); ?>

    <?= $form->field($model, 'value_number'); ?>

    <?php // echo $form->field($model, 'default')?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']); ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']); ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

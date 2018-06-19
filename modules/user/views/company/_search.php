<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\search\Company */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="company-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => [
            'data-pjax' => 1,
        ],
    ]); ?>

    <?= $form->field($model, 'id'); ?>

    <?= $form->field($model, 'location_id'); ?>

    <?= $form->field($model, 'name'); ?>

    <?= $form->field($model, 'logo'); ?>

    <?= $form->field($model, 'website'); ?>

    <?php // echo $form->field($model, 'content')?>

    <?php // echo $form->field($model, 'scale')?>

    <?php // echo $form->field($model, 'address')?>

    <?php // echo $form->field($model, 'phone')?>

    <?php // echo $form->field($model, 'fax')?>

    <?php // echo $form->field($model, 'tax_id')?>

    <?php // echo $form->field($model, 'created_by')?>

    <?php // echo $form->field($model, 'created_at')?>

    <?php // echo $form->field($model, 'status')?>

    <?php // echo $form->field($model, 'arranged')?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']); ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']); ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

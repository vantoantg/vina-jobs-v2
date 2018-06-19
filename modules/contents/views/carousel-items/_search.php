<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\search\CarouselItems */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="carousel-items-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => [
            'data-pjax' => 1,
        ],
    ]); ?>

    <?= $form->field($model, 'id'); ?>

    <?= $form->field($model, 'carousel_id'); ?>

    <?= $form->field($model, 'img_thum'); ?>

    <?= $form->field($model, 'img_view'); ?>

    <?= $form->field($model, 'img_original'); ?>

    <?php // echo $form->field($model, 'title')?>

    <?php // echo $form->field($model, 'description')?>

    <?php // echo $form->field($model, 'link')?>

    <?php // echo $form->field($model, 'target')?>

    <?php // echo $form->field($model, 'sorted')?>

    <?php // echo $form->field($model, 'status')?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']); ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']); ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

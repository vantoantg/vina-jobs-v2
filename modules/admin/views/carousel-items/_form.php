<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\CarouselItems */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="carousel-items-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'carousel_id')->textInput() ?>

    <?= $form->field($model, 'img_thum')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'img_view')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'img_original')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'link')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'target')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'sorted')->textInput() ?>

    <?= $form->field($model, 'status')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

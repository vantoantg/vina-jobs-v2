<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Job */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="job-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'categories_id')->textInput(); ?>

    <?= $form->field($model, 'company_id')->textInput(); ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'slug')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'description')->textarea(['rows' => 6]); ?>

    <?= $form->field($model, 'content')->textarea(['rows' => 6]); ?>

    <?= $form->field($model, 'tags')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'keyword')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'salary')->textInput(); ?>

    <?= $form->field($model, 'working_time')->textInput(); ?>

    <?= $form->field($model, 'address')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'created_by')->textInput(); ?>

    <?= $form->field($model, 'updated_by')->textInput(); ?>

    <?= $form->field($model, 'created_at')->textInput(); ?>

    <?= $form->field($model, 'updated_at')->textInput(); ?>

    <?= $form->field($model, 'effect_date')->textInput(); ?>

    <?= $form->field($model, 'end_date')->textInput(); ?>

    <?= $form->field($model, 'approved_at')->textInput(); ?>

    <?= $form->field($model, 'approved_by')->textInput(); ?>

    <?= $form->field($model, 'arrange')->textInput(); ?>

    <?= $form->field($model, 'star')->textInput(); ?>

    <?= $form->field($model, 'client_status')->textInput(); ?>

    <?= $form->field($model, 'status')->textInput(); ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']); ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

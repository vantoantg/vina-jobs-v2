<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Pages */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="pages-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'parent_id')->textInput() ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true, 'class' => 'createSlug form-control', 'data-target' => '#pages-slug']) ?>

    <?= $form->field($model, 'slug')->textInput(['maxlength' => true, 'readonly' => true]) ?>

	<?= $form->field($model, 'content')->textarea(['rows' => 6, 'id' => 'page-content', 'class' => 'form-control']) ?>

    <?= $form->field($model, 'seo_title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'seo_keyword')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'seo_description')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'img')->textInput(['maxlength' => true]) ?>

	<?php
	if(\app\library\helper\Role::allowAdmin()){
	?>

    <?= $form->field($model, 'view')->textInput() ?>

	<?php } ?>

    <?= $form->field($model, 'pape_template')->textInput() ?>

    <?= $form->field($model, 'status', [
        'template' => '<label class="checkbox-inline checkbox-styled" >{input}</label>{label}{error}{hint}'
    ])->checkbox() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

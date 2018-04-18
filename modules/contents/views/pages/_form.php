<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use \app\library\helper\Helper;
use \app\library\helper\Cons;

/* @var $this yii\web\View */
/* @var $model app\models\Pages */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="pages-form">

    <?php $form = ActiveForm::begin(); ?>
	<div class="buttons-fx col-sm-12 col-md-4 col-lg-3">
		<div class="col-sm-12 bg-white">
			<?= Html::a('Back', Yii::$app->request->referrer, ['class' => 'btn btn-default']) ?>
            <?= Html::submitButton('Save', ['class' => 'btn btn-primary', 'name' => 'save', 'value' => 'saveback']) ?>
            <?= Html::submitButton('Save & Edit', ['class' => 'btn btn-success', 'name' => 'save', 'value' => 'saveedit']) ?>
		</div>
	</div>

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


    <?php ActiveForm::end(); ?>

</div>

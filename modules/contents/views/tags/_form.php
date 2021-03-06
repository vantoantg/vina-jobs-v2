<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Tags */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="tags-form">

    <?php $form = ActiveForm::begin(); ?>

	<div class="buttons-fx col-sm-12 col-md-4 col-lg-3">
		<div class="col-sm-12 bg-white">
            <?= Html::a('Back', \app\library\helper\Helper::getInstance()->createUrl(\app\library\helper\Cons::ROUTE_AD_CAROUSEL_TAGS_LIST), ['class' => 'btn btn-default']); ?>
            <?= Html::submitButton('Save', ['class' => 'btn btn-primary', 'name' => 'save', 'value' => 'saveback']); ?>
            <?= Html::submitButton('Save & Edit', ['class' => 'btn btn-success', 'name' => 'save', 'value' => 'saveedit']); ?>
		</div>
	</div>
    <?= $form->field($model, 'title')->textInput(['maxlength' => true, 'class' => 'createSlug form-control', 'data-target' => '#tags-slug']); ?>

    <?= $form->field($model, 'slug')->textInput(['maxlength' => true, 'readonly' => true]); ?>

	<?= $form->field($model, 'status', [
        'template' => '<label class="checkbox-inline checkbox-styled" >{input}</label>{label}{error}{hint}',
    ])->checkbox(); ?>

    <?php ActiveForm::end(); ?>

</div>

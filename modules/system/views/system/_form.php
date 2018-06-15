<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\System */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="system-form">

    <?php $form = ActiveForm::begin(); ?>
	<div class="buttons-fx col-sm-12 col-md-4 col-lg-3">
		<div class="col-sm-12 bg-white">
            <?= Html::a('Back', \app\library\helper\Helper::createUrl(\app\library\helper\Cons::ROUTE_AD_PAGE_LIST), ['class' => 'btn btn-default']); ?>
            <?= Html::submitButton('Save', ['class' => 'btn btn-primary', 'name' => 'save', 'value' => 'saveback']); ?>
            <?= Html::submitButton('Save & Edit', ['class' => 'btn btn-success', 'name' => 'save', 'value' => 'saveedit']); ?>
		</div>
	</div>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'code')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'value')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'value_number')->textInput(); ?>

    <?= $form->field($model, 'default')->textInput(['maxlength' => true]); ?>

    <?php ActiveForm::end(); ?>

</div>

<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\library\helper\Helper;
use app\library\helper\Cons;

/* @var $this yii\web\View */
/* @var $model app\models\Carousel */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="carousel-form">

    <?php $form = ActiveForm::begin(); ?>
	<div class="buttons-fx col-sm-12 col-md-4 col-lg-3">
		<div class="col-sm-12 bg-white">
            <?= Html::a('Back', Helper::createUrl(Cons::ROUTE_AD_CAROUSEL_LIST), ['class' => 'btn btn-default']) ?>
            <?= Html::submitButton('Save', ['class' => 'btn btn-primary', 'name' => 'save', 'value' => 'saveback']) ?>
            <?= Html::submitButton('Save & Edit', ['class' => 'btn btn-success', 'name' => 'save', 'value' => 'saveedit']) ?>
		</div>
	</div>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'slug')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'status')->textInput() ?>

    <?php ActiveForm::end(); ?>

</div>

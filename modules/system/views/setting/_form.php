<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Setting */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="setting-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="buttons-fx col-sm-12 col-md-4 col-lg-3">
        <div class="col-sm-12 bg-white">
			<?= Html::a('Back', \app\library\helper\Helper::getInstance()->createUrl(\app\library\helper\Cons::ROUTE_AD_SYSTEM_SETTING_LIST), ['class' => 'btn btn-default']); ?>
			<?= Html::submitButton('Save', ['class' => 'btn btn-primary', 'name' => 'save', 'value' => 'saveback']); ?>
			<?= Html::submitButton('Save & Edit', ['class' => 'btn btn-success', 'name' => 'save', 'value' => 'saveedit']); ?>
        </div>
    </div>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'code')->textInput(['maxlength' => true, 'readonly' => true]); ?>

    <?= $form->field($model, 'value')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'default')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'sorted')->textInput(); ?>

    <?= $form->field($model, 'input')->dropDownList(['text' => 'Text', 'password' => 'Password', 'submit' => 'Submit', 'reset' => 'Reset', 'radio' => 'Radio', 'checkbox' => 'Checkbox', 'number' => 'Number', 'email' => 'Email', 'select' => 'Select', 'textarea' => 'Textarea', 'image' => 'Image'], ['prompt' => '']); ?>

    <?php ActiveForm::end(); ?>

</div>

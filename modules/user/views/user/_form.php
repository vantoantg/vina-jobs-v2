<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Users */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="users-form">

    <?php $form = ActiveForm::begin(); ?>

    <div class="buttons-fx col-sm-12 col-md-4 col-lg-3">
        <div class="col-sm-12 bg-white">
			<?= Html::a('Back', \app\library\helper\Helper::getInstance()->createUrl(\app\library\helper\Cons::ROUTE_AD_USER_LIST), ['class' => 'btn btn-default']); ?>
			<?= Html::submitButton('Save', ['class' => 'btn btn-primary', 'name' => 'save', 'value' => 'saveback']); ?>
			<?= Html::submitButton('Save & Edit', ['class' => 'btn btn-success', 'name' => 'save', 'value' => 'saveedit']); ?>
        </div>
    </div>

    <?= $form->field($model, 'username')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'password')->passwordInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'auth_key')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'access_token')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'password_reset_token')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'role')->textInput(); ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'slug_name')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'avatar')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'archive')->textInput(); ?>

    <?= $form->field($model, 'type')->textInput(); ?>

    <?= $form->field($model, 'lang')->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'timezone')->textInput(['maxlength' => true]); ?>

	<?= $form->field($model, 'status', [
        'template' => '<label class="checkbox-inline checkbox-styled" >{input}</label>{label}{error}{hint}',
    ])->checkbox(); ?>

    <?php ActiveForm::end(); ?>

</div>

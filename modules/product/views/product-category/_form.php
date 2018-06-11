<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\library\helper\Helper;
use app\library\helper\Cons;

/* @var $this yii\web\View */
/* @var $model app\models\ProductCategory */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="product-category-form">

    <?php $form = ActiveForm::begin(); ?>
	<div class="buttons-fx col-sm-12 col-md-4 col-lg-3">
		<div class="col-sm-12 bg-white">
			<?= Html::a('Back', Yii::$app->request->referrer, ['class' => 'btn btn-default']) ?>
            <?= Html::submitButton('Save', ['class' => 'btn btn-primary', 'name' => 'save', 'value' => 'saveback']) ?>
            <?= Html::submitButton('Save & Edit', ['class' => 'btn btn-success', 'name' => 'save', 'value' => 'saveedit']) ?>
		</div>
	</div>

	<?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

	<?php
    $countries = \app\models\ProductCategory::categoriesMenus();
    $listData = \yii\helpers\ArrayHelper::map($countries, 'id', 'name');
    echo $form->field($model, 'parent_id', [
        'template' => '{input}{label}{error}{hint}'
    ])->dropDownList(
        $listData,
        [
            'class' => 'form-control select2-list',
            'data-placeholder' => "Select an item"
        ]
    )->label('Select category');
    ?>

    <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'image')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'arranged')->textInput() ?>

    <?= $form->field($model, 'status', [
        'template' => '<label class="checkbox-inline checkbox-styled" >{input}</label>{label}{error}{hint}'
    ])->checkbox() ?>

    <?php ActiveForm::end(); ?>

</div>

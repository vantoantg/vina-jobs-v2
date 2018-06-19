<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Post */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="post-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="buttons-fx col-sm-12 col-md-4 col-lg-3">
        <div class="col-sm-12 bg-white">
			<?= Html::a('Back', Yii::$app->request->referrer, ['class' => 'btn btn-default']); ?>
			<?= Html::submitButton('Save', ['class' => 'btn btn-primary', 'name' => 'save', 'value' => 'saveback']); ?>
			<?= Html::submitButton('Save & Edit', ['class' => 'btn btn-success', 'name' => 'save', 'value' => 'saveedit']); ?>
        </div>
    </div>

	<?php
    $datas = \app\models\PostCategory::categoriesMenus();
    $listData = \yii\helpers\ArrayHelper::map($datas, 'id', 'name');
    echo $form->field($model, 'post_category_id', [
        'template' => '{input}{label}{error}{hint}',
    ])->dropDownList(
        $listData,
        [
            'class' => 'form-control select2-list',
            'data-placeholder' => 'Select an item',
        ]
    )->label('Select category');
    ?>

	<?= $form->field($model, 'name')->textInput(['maxlength' => true, 'class' => 'createSlug form-control', 'data-target' => '#post-slug']); ?>

	<?= $form->field($model, 'slug')->textInput(['maxlength' => true, 'readonly' => true]); ?>

    <?= $form->field($model, 'description')->textarea(['rows' => 6]); ?>

	<?= $form->field($model, 'content')->textarea(['rows' => 6, 'id' => 'page-content', 'class' => 'form-control']); ?>

    <div class="row">
        <div class="col-xs-10">
			<?= $form->field($model, 'img', [
                'template' => '{input}{label}{error}{hint}',
            ])->textInput(['maxlength' => true, 'class' => 'form-control image-url', 'placeholder' => 'Enter image url address or select']); ?>
        </div>
        <div class="col-xs-2">
            <button class="btn btn-default openFinder" data-target=".image-url" data-type = "Images" type="button">
                <span class="glyphicon glyphicon-folder-open"></span>&nbsp;&nbsp;&nbsp;SELECT
            </button>
        </div>
    </div>

    <?= $form->field($model, 'view')->textInput(); ?>

    <?= $form->field($model, 'sorted')->textInput(); ?>

    <?= $form->field($model, 'arranged')->textInput(); ?>

	<?= $form->field($model, 'status', [
        'template' => '<label class="checkbox-inline checkbox-styled" >{input}</label>{label}{error}{hint}',
    ])->checkbox(); ?>

    <?php ActiveForm::end(); ?>

</div>

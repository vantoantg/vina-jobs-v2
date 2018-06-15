<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Product */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="product-form card-body">

    <?php $form = ActiveForm::begin(['options' => ['class' => 'form form-validate floating-label']]); ?>
	<div class="buttons-fx col-sm-12 col-md-4 col-lg-3">
		<div class="col-sm-12 bg-white">
			<?= Html::a('Back', Yii::$app->request->referrer, ['class' => 'btn btn-default']); ?>
            <?= Html::submitButton('Save', ['class' => 'btn btn-primary', 'name' => 'save', 'value' => 'saveback']); ?>
            <?= Html::submitButton('Save & Edit', ['class' => 'btn btn-success', 'name' => 'save', 'value' => 'saveedit']); ?>
		</div>
	</div>

	<?php
    $datas = \app\models\ProductCategory::categoriesMenus();
    $listData = \yii\helpers\ArrayHelper::map($datas, 'id', 'name');
    echo $form->field($model, 'category_id', [
        'template' => '{input}{label}{error}{hint}',
    ])->dropDownList(
        $listData,
        [
            'class' => 'form-control select2-list',
            'data-placeholder' => 'Select an item',
        ]
    )->label('Select category');
    ?>

	<?= $form->field($model, 'name', [
        'template' => '{input}{label}{error}{hint}',
    ])->textInput(['maxlength' => true]); ?>

	<?= $form->field($model, 'description')->widget(\yii\redactor\widgets\Redactor::className(), [
        'clientOptions' => [
            'placeholder' => 'Content..',
            'observeLinks' => true,
            'convertVideoLinks' => true,
            'imageUpload' => ['/web/uploads/image'],
            'fileUpload' => ['/web/uploads/file'],
            'plugins' => ['clips', 'fontcolor', 'imagemanager'],
            'toolbar' => true,
            'buttons' => [
                'html',
                'format',
                'formatting',
                'lists',
                'bold',
                'italic',
                'deleted',
                'underline',
                'horizontalrule',
                'alignment',
                'unorderedlist',
                'orderedlist',
                'outdent',
                'indent',
                'link',
                /*'image',
                'file'*/
            ],
        ],
    ]); ?>

	<?= $form->field($model, 'content')->textarea(['rows' => 6, 'id' => 'page-content', 'class' => 'form-control']); ?>

    <div class="row">
        <div class="col-xs-10">
            <?= $form->field($model, 'image', [
                'template' => '{input}{label}{error}{hint}',
            ])->textInput(['maxlength' => true, 'class' => 'form-control image-url', 'placeholder' => 'Enter image url address or select']); ?>
        </div>
        <div class="col-xs-2">
            <button class="btn btn-default openFinder" data-target=".image-url" data-type = "Images" type="button">
                <span class="glyphicon glyphicon-folder-open"></span>&nbsp;&nbsp;&nbsp;SELECT
            </button>
        </div>
    </div>


    <?= $form->field($model, 'slug', [
        'template' => '{input}{label}{error}{hint}',
    ])->textInput(['maxlength' => true]); ?>

    <?= $form->field($model, 'price_in', [
        'template' => '{input}{label}{error}{hint}',
    ])->textInput(); ?>

    <?= $form->field($model, 'price_out', [
        'template' => '{input}{label}{error}{hint}',
    ])->textInput(); ?>

    <?= $form->field($model, 'price_sale', [
        'template' => '{input}{label}{error}{hint}',
    ])->textInput(); ?>

    <?= $form->field($model, 'quantity_remaining', [
        'template' => '{input}{label}{error}{hint}',
    ])->textInput(); ?>

    <?= $form->field($model, 'arranged', [
        'template' => '{input}{label}{error}{hint}',
    ])->textInput(); ?>


	<?= $form->field($model, 'is_comment', [
        'template' => '<label class="checkbox-inline checkbox-styled" >{input}</label>{label}{error}{hint}',
    ])->checkbox(); ?>

	<?= $form->field($model, 'status', [
        'template' => '<label class="checkbox-inline checkbox-styled" >{input}</label>{label}{error}{hint}',
    ])->checkbox(); ?>


    <?php ActiveForm::end(); ?>

</div>

<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\library\helper\Helper;

/* @var $this yii\web\View */
/* @var $model app\models\Pages */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="pages-form">
	<?php $form = ActiveForm::begin(); ?>
    <div class="row">
        <?php
        $listData = \yii\helpers\ArrayHelper::map($files, 'id', 'name');
        echo $form->field($model, 'files', [
            'template' => '{input}{label}{error}{hint}',
        ])->dropDownList(
            $listData,
            [
                'class' => 'form-control select2-list',
                'data-placeholder' => 'Select an item',
                'data-root-url' => Helper::createUrl(['admin/layout/page']).'?id=',
            ]
        )->label(false);
        ?>

        <div id="editor" style="height: 70vh" class="form-control{{ has_errors(form.tpl_data) ? ' is-invalid'}}"></div>
        <?= $form->field($model, 'textarea')->textarea(['id' => 'editor_hd', 'class' => 'd-none'])->label(false); ?>
        <div class="col-sm-12">
            <div class="col-sm-12 bg-white">
				<?= Html::submitButton('Save & Edit', ['class' => 'btn btn-success', 'name' => 'save', 'value' => 'saveedit']); ?>
            </div>
        </div>
    </div>
	<?php ActiveForm::end(); ?>
</div>

<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Pages */
$this->title = $model->fileName;
$this->title = 'Admin | '.$this->title;
$this->params['breadcrumbs'][] = ['label' => 'Pages', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $this->title, 'url' => ['view', 'id' => $this->title]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="layouts">
	<h1><?= Html::encode($this->title); ?></h1>

	<div class="bg-white col-sm-12">
		<div class="pages-form">
            <?php $form = ActiveForm::begin(); ?>
			<div class="row">
                <?php
                $listData = \yii\helpers\ArrayHelper::map($files, 'realPath', 'name');
                echo $form->field($model, 'files', [
                    'template' => '{input}{label}{error}{hint}',
                ])->dropDownList(
                    $listData,
                    [
                        'class' => 'form-control select2-list',
                        'data-placeholder' => 'Select an item',
                        'data-root-url' => \app\library\helper\Helper::getInstance()->createUrl(['system/log-system/index']).'?id=',
                    ]
                )->label(false);
                ?>

				<div id="editor" style="height: 70vh" class="form-control{{ has_errors(form.tpl_data) ? ' is-invalid'}}"></div>
                <?= $form->field($model, 'textarea')->textarea(['id' => 'editor_hd', 'class' => 'd-none'])->label(false); ?>
			</div>
            <?php ActiveForm::end(); ?>
		</div>
	</div>
</div>









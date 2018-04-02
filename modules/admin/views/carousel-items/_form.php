<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\library\helper\Helper;
use app\library\helper\Cons;

/* @var $this yii\web\View */
/* @var $model app\models\CarouselItems */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="carousel-items-form">

    <?php $form = ActiveForm::begin(); ?>
	<div class="buttons-fx col-sm-12 col-md-4 col-lg-3">
		<div class="col-sm-12 bg-white">
			<?= Html::a('Back', Yii::$app->request->referrer, ['class' => 'btn btn-default']) ?>
            <?= Html::submitButton('Save', ['class' => 'btn btn-primary', 'name' => 'save', 'value' => 'saveback']) ?>
            <?= Html::submitButton('Save & Edit', ['class' => 'btn btn-success', 'name' => 'save', 'value' => 'saveedit']) ?>
		</div>
	</div>

    <?php
    $datas = \app\models\Carousel::find()->all();
    $listData = \yii\helpers\ArrayHelper::map($datas, 'id', 'name');
    echo $form->field($model, 'carousel_id')->dropDownList(
        $listData,
        [
            'prompt' => '-- Chọn --',
            'class' => 'job-select2 form-control'
        ]
    );
    ?>

    <?= $form->field($model, 'img_thum')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'img_view')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'img_original')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'link')->textInput(['maxlength' => true]) ?>

    <?php
    $listData = \app\library\helper\Dropdowns::$a_target;
    echo $form->field($model, 'target')->dropDownList(
        $listData,
        [
            'prompt' => '-- Chọn --',
            'class' => 'job-select2 form-control'
        ]
    );
    ?>
    <?= $form->field($model, 'target')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'sorted')->textInput() ?>

    <?= $form->field($model, 'status', [
        'template' => '<label class="checkbox-inline checkbox-styled" >{input}</label>{label}{error}{hint}'
    ])->checkbox() ?>

    <?php ActiveForm::end(); ?>

</div>

<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\search\Product */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="product-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => [
            'data-pjax' => 1
        ],
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'category_id') ?>

    <?= $form->field($model, 'name') ?>

    <?= $form->field($model, 'description') ?>

    <?= $form->field($model, 'content') ?>

    <?php // echo $form->field($model, 'image')?>

    <?php // echo $form->field($model, 'slug')?>

    <?php // echo $form->field($model, 'price_in')?>

    <?php // echo $form->field($model, 'price_out')?>

    <?php // echo $form->field($model, 'price_sale')?>

    <?php // echo $form->field($model, 'quantity_remaining')?>

    <?php // echo $form->field($model, 'view')?>

    <?php // echo $form->field($model, 'is_comment')?>

    <?php // echo $form->field($model, 'arranged')?>

    <?php // echo $form->field($model, 'status')?>

    <?php // echo $form->field($model, 'is_deleted')?>

    <?php // echo $form->field($model, 'created_by')?>

    <?php // echo $form->field($model, 'updated_by')?>

    <?php // echo $form->field($model, 'created_at')?>

    <?php // echo $form->field($model, 'updated_at')?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

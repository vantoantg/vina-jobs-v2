<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\search\Post */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="post-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => [
            'data-pjax' => 1,
        ],
    ]); ?>

    <?= $form->field($model, 'id'); ?>

    <?= $form->field($model, 'post_category_id'); ?>

    <?= $form->field($model, 'name'); ?>

    <?= $form->field($model, 'slug'); ?>

    <?= $form->field($model, 'description'); ?>

    <?php // echo $form->field($model, 'content')?>

    <?php // echo $form->field($model, 'img')?>

    <?php // echo $form->field($model, 'view')?>

    <?php // echo $form->field($model, 'sorted')?>

    <?php // echo $form->field($model, 'created_by')?>

    <?php // echo $form->field($model, 'created_at')?>

    <?php // echo $form->field($model, 'updated_by')?>

    <?php // echo $form->field($model, 'updated_at')?>

    <?php // echo $form->field($model, 'arranged')?>

    <?php // echo $form->field($model, 'status')?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']); ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']); ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

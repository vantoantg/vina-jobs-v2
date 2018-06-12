<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\search\PostCategory */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="post-category-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => [
            'data-pjax' => 1,
        ],
    ]); ?>

    <?= $form->field($model, 'id'); ?>

    <?= $form->field($model, 'parent_id'); ?>

    <?= $form->field($model, 'name'); ?>

    <?= $form->field($model, 'slug'); ?>

    <?= $form->field($model, 'description'); ?>

    <?php // echo $form->field($model, 'content')?>

    <?php // echo $form->field($model, 'img')?>

    <?php // echo $form->field($model, 'arranged')?>

    <?php // echo $form->field($model, 'status')?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']); ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']); ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

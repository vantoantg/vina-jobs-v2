<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\search\Job */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="job-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => [
            'data-pjax' => 1
        ],
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'categories_id') ?>

    <?= $form->field($model, 'company_id') ?>

    <?= $form->field($model, 'title') ?>

    <?= $form->field($model, 'slug') ?>

    <?php // echo $form->field($model, 'description')?>

    <?php // echo $form->field($model, 'content')?>

    <?php // echo $form->field($model, 'tags')?>

    <?php // echo $form->field($model, 'keyword')?>

    <?php // echo $form->field($model, 'salary')?>

    <?php // echo $form->field($model, 'working_time')?>

    <?php // echo $form->field($model, 'address')?>

    <?php // echo $form->field($model, 'created_by')?>

    <?php // echo $form->field($model, 'updated_by')?>

    <?php // echo $form->field($model, 'created_at')?>

    <?php // echo $form->field($model, 'updated_at')?>

    <?php // echo $form->field($model, 'effect_date')?>

    <?php // echo $form->field($model, 'end_date')?>

    <?php // echo $form->field($model, 'approved_at')?>

    <?php // echo $form->field($model, 'approved_by')?>

    <?php // echo $form->field($model, 'arrange')?>

    <?php // echo $form->field($model, 'star')?>

    <?php // echo $form->field($model, 'client_status')?>

    <?php // echo $form->field($model, 'status')?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

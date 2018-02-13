<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Job */
/* @var $form ActiveForm */

$this->title = 'Post a Job';
?>
<div class="container">
    <div class="col-12 col-sm-8">
        <div class="front-jobs">

            <?php $form = ActiveForm::begin(); ?>

            <?= $form->field($model, 'categories_id') ?>
            <?= $form->field($model, 'company_id') ?>
            <?= $form->field($model, 'created_by') ?>
            <?= $form->field($model, 'updated_by') ?>
            <?= $form->field($model, 'approved_by') ?>
            <?= $form->field($model, 'arrange') ?>
            <?= $form->field($model, 'star') ?>
            <?= $form->field($model, 'status') ?>
            <?= $form->field($model, 'description') ?>
            <?= $form->field($model, 'content') ?>
            <?= $form->field($model, 'created_at') ?>
            <?= $form->field($model, 'updated_at') ?>
            <?= $form->field($model, 'effect_date') ?>
            <?= $form->field($model, 'end_date') ?>
            <?= $form->field($model, 'approved_at') ?>
            <?= $form->field($model, 'title') ?>
            <?= $form->field($model, 'name') ?>
            <?= $form->field($model, 'tags') ?>
            <?= $form->field($model, 'keyword') ?>
            <?= $form->field($model, 'salary') ?>
            <?= $form->field($model, 'address') ?>

            <div class="form-group">
                <?= Html::submitButton('Submit', ['class' => 'btn btn-primary']) ?>
            </div>
            <?php ActiveForm::end(); ?>

        </div><!-- front-jobs -->
    </div>
    <div class="col-12 col-sm-4">
        Sidebar
    </div>
</div>
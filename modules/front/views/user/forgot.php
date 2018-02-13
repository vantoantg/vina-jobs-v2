<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\bootstrap\ActiveForm;
//use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\User */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Forgot password';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container">
    <div class="users-index">

        <h1><?= Html::encode($this->title) ?></h1>

        <?php $form = ActiveForm::begin(); ?>
        <?php
        echo $form->field($model, 'email');
        ?>
        <div class="form-group">
            <?= \yii\helpers\Html::submitButton('Submit', ['class' => 'btn btn-primary']) ?>
        </div>
        <?php ActiveForm::end(); ?>
    </div>
</div>
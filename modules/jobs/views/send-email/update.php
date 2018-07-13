<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\SendEmail */

$this->title = 'Update Send Email: {nameAttribute}';
$this->params['breadcrumbs'][] = ['label' => 'Send Emails', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="send-email-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>

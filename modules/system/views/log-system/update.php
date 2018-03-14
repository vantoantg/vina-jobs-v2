<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\LogSystem */

$this->title = 'Update Log System: {nameAttribute}';
$this->params['breadcrumbs'][] = ['label' => 'Log Systems', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="log-system-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>

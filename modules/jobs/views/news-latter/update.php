<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\NewsLetter */

$this->title = 'Update News Letter: {nameAttribute}';
$this->params['breadcrumbs'][] = ['label' => 'News Letters', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="news-letter-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>

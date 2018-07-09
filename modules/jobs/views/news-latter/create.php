<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\NewsLetter */

$this->title = 'Create News Letter';
$this->params['breadcrumbs'][] = ['label' => 'News Letters', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="news-letter-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>

<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\LogSystem */

$this->title = 'Create Log System';
$this->params['breadcrumbs'][] = ['label' => 'Log Systems', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="log-system-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>

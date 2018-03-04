<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Pages */

$this->title = 'Create Pages';
$this->params['breadcrumbs'][] = ['label' => 'Pages', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="pages-create">

    <h1><?= Html::encode($this->title) ?></h1>
    <div class="bg-white col-lg-offset-1 col-sm-12 col-md-10 col-lg-8">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
    </div>
</div>

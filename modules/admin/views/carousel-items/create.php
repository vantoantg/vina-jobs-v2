<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\CarouselItems */

$this->title = 'Create Carousel Items';
$this->params['breadcrumbs'][] = ['label' => 'Carousel Items', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="carousel-items-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>

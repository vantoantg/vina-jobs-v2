<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\search\CarouselItems */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Carousel Items';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="carousel-items-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php Pjax::begin(['timeout' => 15000]); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Carousel Items', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'carousel_id',
            'img_thum',
            'img_view',
            'img_original',
            //'title',
            //'description:ntext',
            //'link',
            //'target',
            //'sorted',
            //'status',

            \app\library\helper\ActionColumn::link(),
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>

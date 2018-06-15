<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\Job */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Jobs';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="job-index">

    <h1><?= Html::encode($this->title); ?></h1>
    <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]);?>

    <p>
        <?= Html::a('Create Job', ['create'], ['class' => 'btn btn-success']); ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'categories_id',
            'company_id',
            'title',
            'slug',
            //'description:ntext',
            //'content:ntext',
            //'tags',
            //'keyword',
            //'salary',
            //'working_time:datetime',
            //'address',
            //'created_by',
            //'updated_by',
            //'created_at',
            //'updated_at',
            //'effect_date',
            //'end_date',
            //'approved_at',
            //'approved_by',
            //'arrange',
            //'star',
            //'client_status',
            //'status',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>

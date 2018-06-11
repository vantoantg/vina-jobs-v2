<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\Migration */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Migrations';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="migration-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php Pjax::begin(['timeout' => 15000]); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]);?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'version',
            'apply_time:datetime',

//            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>

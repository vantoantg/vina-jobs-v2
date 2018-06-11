<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\System */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Systems';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="system-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php Pjax::begin(['timeout' => 15000]); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]);?>

    <p>
        <?= Html::a('Create System', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

//            'id',
            'name',
            'code',
            'value',
            'value_number',
            //'default',

            \app\library\helper\ActionColumn::link('{update}'),
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>

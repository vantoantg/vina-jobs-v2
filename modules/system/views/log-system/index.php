<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\LogSystem */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Log Systems';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="log-system-index">

    <h1><?= Html::encode($this->title); ?></h1>
	<?php Pjax::begin(['timeout' => 15000]); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]);?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'url:url',
            'user_id',
            'ip',
            'browser',
            //'time',
            //'controller',
            //'action',
            //'method',
            //'user_timezone',

//            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>

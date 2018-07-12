<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\search\SendEmail */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Send Emails';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="send-email-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Send Email', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'send_to',
            'send_cc',
            'subject',
            'content:ntext',
            //'attach',
            //'template',
            //'is_sent',
            //'sent_date',
            //'sent_by',
            //'resent',
            //'created_at',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>

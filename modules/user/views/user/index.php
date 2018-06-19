<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\User */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Users';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="users-index">

    <h1><?= Html::encode($this->title); ?></h1>
    <?php Pjax::begin(['timeout' => 15000]); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]);?>

    <p>
        <?= Html::a('Create Users', ['create'], ['class' => 'btn btn-success']); ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

//            'id',
            //'avatar',
            [
                'attribute' => 'avatar',
                'format' => 'html',
                'label' => 'Avatar',
                'value' => function ($data) {
                    return Html::img(
                        \app\library\helper\Helper::webImgs($data['avatar']),
                        ['height' => '80px']
                    );
                },
            ],
            'username',
//	        'password',
//	        'auth_key',
//	        'access_token',
            //'password_reset_token',
            'role',
            'name',
            //'slug_name',
            //'archive',
            //'type',
            //'lang',
            'timezone',
            'status',

            \app\library\helper\ActionColumn::link(),
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>

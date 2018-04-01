<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\search\Pages */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Pages';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="pages-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php Pjax::begin(['timeout' => 15000]); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Pages', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
	    'layout' => "{pager} {summary} {items} {pager}",
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

//            'id',
//            'parent_id',
            'name',
            'slug',
//            'content:ntext',
            //'seo_title',
            //'seo_keyword',
            //'seo_description',
            //'img',
            [
                'attribute' => 'img',
                'format' => 'html',
                'label' => 'Image',
                'value' => function ($data) {
                    return Html::img(\app\library\helper\Helper::webImgs($data['img']),
                        ['height' => '80px']);
                },
            ],
            'view',
            //'pape_template',
            //'created_by',
            //'updated_by',
            //'created_at',
            //'updated_at',
            'status',

//            ['class' => 'yii\grid\ActionColumn'],
            \app\library\helper\ActionColumn::link(),
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>

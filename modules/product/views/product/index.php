<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\search\Product */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Products';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="product-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Product', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

//            'id',
//            'image',
	        [
		        'attribute' => 'image',
		        'format' => 'html',
		        'label' => 'Image',
		        'value' => function ($data) {
			        return Html::img(\app\library\helper\Helper::webImgs($data['image']),
				        ['height' => '80px']);
		        },
	        ],
//	        'category_id',
            [
	            'attribute' => 'category_id',
	            'format' => 'html',
	            'label' => 'Category',
	            'value' => function ($data) {
		            return $data->getCategoryName();
	            },
            ],
	        'name',
	        'description:ntext',
//            'content:ntext',

            //'slug',
            //'price_in',
            //'price_out',
            //'price_sale',
            'quantity_remaining',
            'view',
            //'is_comment',
            'arranged',
            'status',
            //'is_deleted',
            //'created_by',
            //'updated_by',
            //'created_at',
            //'updated_at',

            \app\library\helper\ActionColumn::link(),
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>

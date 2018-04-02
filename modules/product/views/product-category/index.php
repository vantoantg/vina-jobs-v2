<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\search\ProductCategory */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Product Categories';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="product-category-index">

    <h1><?= Html::encode($this->title) ?></h1>
	<?php Pjax::begin(['timeout' => 15000]); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Product Category', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

//            'id',
	        [
		        'attribute' => 'image',
		        'format' => 'html',
		        'label' => 'Image',
		        'value' => function ($data) {
			        return Html::img(\app\library\helper\Helper::webImgs($data['image']),
				        ['height' => '80px']);
		        },
	        ],
//            'parent_id',
	        [
		        'attribute' => 'parent_id',
		        'format' => 'html',
		        'label' => 'Category',
		        'value' => function ($data) {
			        return $data->getCategoryName();
		        },
	        ],
            'name',
            'description:ntext',
//            'image',
            //'arranged',
            //'status',

            \app\library\helper\ActionColumn::link(),
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>

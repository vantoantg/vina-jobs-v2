<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\PostCategory */

$this->title = 'Update Post Category: {nameAttribute}';
$this->params['breadcrumbs'][] = ['label' => 'Post Categories', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="post-category-update">

    <h1><?= Html::encode($this->title) ?></h1>

	<div class="bg-white col-sm-12 col-md-8 col-lg-9">
        <?= $this->render('_form', [
            'model' => $model,
        ]) ?>
	</div>
	<div class="col-sm-12 col-md-4 col-lg-3 sidebar-admin">

	</div>

</div>

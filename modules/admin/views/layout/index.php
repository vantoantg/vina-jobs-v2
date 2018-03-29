<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Pages */

$this->title = 'Admin | ' . $this->title;
$this->params['breadcrumbs'][] = ['label' => 'Pages', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $this->title, 'url' => ['view', 'id' => $this->title]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="pages-update">
	<h1><?= Html::encode($this->title) ?></h1>

	<div class="bg-white col-sm-12">
        <?= $this->render('_form', ['file_content' => $file_content]) ?>
	</div>
</div>
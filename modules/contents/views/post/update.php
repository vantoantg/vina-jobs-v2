<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Post */

$this->title = 'Update Post: {nameAttribute}';
$this->params['breadcrumbs'][] = ['label' => 'Posts', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="post-update">

    <h1><?= Html::encode($this->title) ?></h1>
    <div class="bg-white col-sm-12 col-md-8 col-lg-9">
		<?= $this->render('_form', [
			'model' => $model,
		]) ?>
    </div>
    <div class="col-sm-12 col-md-4 col-lg-3 sidebar-admin">
        <div class="row">
            <div class="fx col-sm-12">
                <input type="text" class="form-control search-from-list" data-list="#page-list" placeholder="Enter name...">

                <ul id="page-list">
					<?php
					if ($pages) {
						foreach ($pages as $page) {
							?>
                            <li title="Click to edit"><?= Html::a($page->name, ['update', 'id' => $page->id], ['class' => '']) ?></li>
						<?php }
					} ?>
                </ul>
            </div>
        </div>
    </div>

</div>

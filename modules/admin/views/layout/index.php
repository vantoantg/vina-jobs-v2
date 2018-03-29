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

	<div class="bg-white col-sm-12 col-md-8 col-lg-9">
        <?= $this->render('_form', ['file_content' => $file_content]) ?>
	</div>
	<div class="col-sm-12 col-md-4 col-lg-3 sidebar-admin">
		<div class="row">
			<div class="fx col-sm-12">
				<input type="text" class="form-control search-from-list" data-list="#page-list"
				       placeholder="Enter name...">

				<ul id="page-list">
                    <?php
                    if ($files) {
                        foreach ($files as $page) {
                            ?>
							<li title="Click to edit"><?= Html::a($page->name,
                                    ['update', 'id' => $page->id], ['class' => '']) ?></li>
                        <?php }
                    } ?>
				</ul>
			</div>
		</div>
	</div>
</div>
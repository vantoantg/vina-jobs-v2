<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Users */

$this->title = 'Update Users: {nameAttribute}';
$this->params['breadcrumbs'][] = ['label' => 'Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="users-update">

    <h1><?= Html::encode($this->title); ?></h1>

    <div class="bg-white col-sm-12 col-md-8 col-lg-9">
		<?= $this->render('_form', [
            'model' => $model,
        ]); ?>
    </div>
    <div class="col-sm-12 col-md-4 col-lg-3 sidebar-admin">
    </div>

</div>

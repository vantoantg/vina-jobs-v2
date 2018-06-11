<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Job */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Jobs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="job-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'categories_id',
            'company_id',
            'title',
            'slug',
            'description:ntext',
            'content:ntext',
            'tags',
            'keyword',
            'salary',
            'working_time:datetime',
            'address',
            'created_by',
            'updated_by',
            'created_at',
            'updated_at',
            'effect_date',
            'end_date',
            'approved_at',
            'approved_by',
            'arrange',
            'star',
            'client_status',
            'status',
        ],
    ]) ?>

</div>

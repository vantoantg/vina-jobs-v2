<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\SendEmail */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Send Emails', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="send-email-view">

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
            'send_to',
            'send_cc',
            'subject',
            'content:ntext',
            'attach',
            'template',
            'is_sent',
            'sent_date',
            'sent_by',
            'resent',
            'created_at',
        ],
    ]) ?>

</div>

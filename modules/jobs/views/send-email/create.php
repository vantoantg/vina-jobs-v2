<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\SendEmail */

$this->title = 'Create Send Email';
$this->params['breadcrumbs'][] = ['label' => 'Send Emails', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="send-email-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>

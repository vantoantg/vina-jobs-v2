<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\bootstrap\ActiveForm;
//use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\User */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Quên mật khẩu';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container">
    <div class="users-index">

        <h1><?= Html::encode($this->title) ?></h1>
        <h5>Hệ thống đã gửi thông tin vào email: <?= $email ?>. Vui lòng kiểm tra và làm theo hướng dẫn để lấy lại mật khẩu.</h5>
    </div>
</div>
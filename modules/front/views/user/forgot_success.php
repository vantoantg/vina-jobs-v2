<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\bootstrap\ActiveForm;
//use yii\widgets\ActiveForm;
use app\library\helper\Helper;
/* @var $this yii\web\View */
/* @var $searchModel app\models\search\User */
/* @var $dataProvider yii\data\ActiveDataProvider */

$page = \app\models\Pages::get('forgot-password-success');
$this->title = Helper::titleSeo($page);
Helper::generateSeo($page);
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container">
    <div class="users-index">

        <h1>THÔNG BÁO TỪ HỆ THỐNG</h1>
        <h5>- Hệ thống đã gửi thông tin vào email: <?= $email ?>. Vui lòng kiểm tra và làm theo hướng dẫn để lấy lại mật khẩu, xin cảm ơn.</h5>
    </div>
</div>
<?php

use yii\helpers\Html;
use \yii\widgets\ActiveForm;
use dosamigos\fileupload\FileUploadUI; // https://github.com/2amigos/yii2-file-upload-widget

/* @var $this yii\web\View */
/* @var $model app\models\Users */

$this->title = 'Đăng kí tài khoản';
$this->params['breadcrumbs'][] = ['label' => 'Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container">
    <div class="users-create">

        <h1><?= Html::encode($this->title) ?></h1>

    </div>
</div>

<div class="container">
    <div class="col-12 col-sm-8">
        <div class="row main">
            <div class="main-login main-center">
                <h2>Đăng ký thành công</h2>

	            <h3>hệ thống đã gửi một email kích hoạt đến <?= $email; ?>  của bạn. Vui lòng kiểm tra email để có thể kích hoạt tài khoản!.</h3>
            </div>
        </div>
    </div>
    <div class="col-12 col-sm-4">
        <?= (new \app\components\SidebarWidget())->recentJobs(); ?>
    </div>
</div>
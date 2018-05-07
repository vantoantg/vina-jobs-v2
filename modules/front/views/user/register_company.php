<?php

use yii\helpers\Html;
use \yii\widgets\ActiveForm;
use dosamigos\fileupload\FileUploadUI; // https://github.com/2amigos/yii2-file-upload-widget
use \app\library\helper\Helper;
use \Yii;

/** @var $page \app\models\Pages title */
/** @var $this \yii\web\View title */
$page = \app\models\Pages::get('register-company');
$this->title = Helper::titleSeo($page);
Helper::generateSeo($page);

$this->params['breadcrumbs'][] = ['label' => 'Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="container">
    <div class="users-create">
        <h1>ĐĂNG KÝ TÀI KHOẢN CÔNG TY</h1>
    </div>
</div>

<div class="container">
    <div class="col-12 col-sm-8">
        <div class="row main">
            <div class="main-login main-center">
                <div class="alert-message alert-message-info <?= \app\library\helper\Helper::wowClass() ?> zoomInDown animated" data-wow-delay="0.2s">
                    <h4>Lưu ý:</h4>
                    <p>
                        Bạn vui lòng điền đúng địa chỉ email. Hệ thống sẽ gửi các thông báo, thông tin liên quan tới tài khoản hoặc thông tin tuyển dụng vào <strong>email của bạn đăng ký</strong>.</p>
                </div>

	            <?php if (Yii::$app->session->hasFlash('updateSuccess')): ?>
                    <div class="alert alert-success alert-dismissable <?= \app\library\helper\Helper::wowClass() ?> zoomInDown animated" data-wow-delay="0.5s">
                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                        <i class="icon fa fa-check"></i> <?= Yii::$app->session->getFlash('updateSuccess') ?>
                    </div>
	            <?php endif; ?>

                <?php if ($errors) {
                    echo '<div class="alert alert-danger">';
                    echo '<strong>Có lỗi trong quá trình đăng ký:</strong>';
                    foreach ($errors as $error) {
                        echo '<br>- ' . $error;
                    }
                    echo '</div>';
                } ?>

                <?php $form = ActiveForm::begin(); ?>
	            <div class="row">
		            <div class="col-xs-12">
			            <h3>THÔNG TIN CÔNG TY</h3>
		            </div>

		            <div class="col-xs-12">
			            <div class="form-group">
				            <div class="cols-sm-10">
                                <?= $form->field($com, 'name', [
                                    'template' => '{label}<div class="input-group"><span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>{input}</div>{error}{hint}'
                                ])->textInput(['placeholder' => 'Tên công ty']) ?>
				            </div>

				            <div class="cols-sm-10">
                                <?= $form->field($com, 'logo', [
                                    'template' => '{label}<div class="input-group">{input}</div>{error}{hint}'
                                ])->label('Logo')->fileInput() ?>
				            </div>

				            <div class="cols-sm-10">
                                <?= $form->field($com, 'website', [
                                    'template' => '{label}<div class="input-group"><span class="input-group-addon"><i class="fa fa-link" aria-hidden="true"></i></span>{input}</div>{error}{hint}'
                                ])->textInput(['placeholder' => 'Website']) ?>
				            </div>

				            <div class="cols-sm-10">

                                <?= $form->field($com, 'content')->widget(\yii\redactor\widgets\Redactor::className(), [
                                    'clientOptions' => Helper::redactorOps('Giới thiệu về công ty')
                                ]) ?>
				            </div>

			            </div>
		            </div>

		            <hr>

		            <div class="col-xs-12">
			            <h3>NGƯỜI LIÊN HỆ</h3>
		            </div>

		            <div class="col-xs-12 col-sm-6">
			            <div class="form-group">
				            <label for="name" class="cols-sm-2 control-label">Họ & Tên</label>
				            <div class="cols-sm-10">
                                <?= $form->field($model, 'name', [
                                    'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>{input}</div>{error}{hint}'
                                ])->label(false) ?>
				            </div>
			            </div>
		            </div>
		            <div class="col-xs-12 col-sm-6">
			            <div class="form-group">
				            <label for="email" class="cols-sm-2 control-label">Email</label>
				            <div class="cols-sm-10">
                                <?php
                                $email_type = false;
                                if (!$model->isNewRecord) {
                                    $email_type = true;
                                }
                                ?>
                                <?= $form->field($model, 'email', [
                                    'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-envelope fa"
                                                                   aria-hidden="true"></i></span>{input}</div>{error}{hint}'
                                ])->textInput(['readonly' => $email_type])->label(false) ?>
				            </div>
			            </div>
		            </div>
	            </div>

                <?php if ($model->isNewRecord) { ?>
		            <div class="row">
			            <div class="col-xs-12 col-sm-6">
                            <div class="cols-sm-10">
					            <?= $form->field($model, 'password', [
						            'template' => '{label}<div class="input-group"><span class="input-group-addon"><i class="fa fa-lock fa-lg"
                                                                       aria-hidden="true"></i></span>{input}</div>{error}{hint}'
					            ])->passwordInput()->label('Mật khẩu') ?>
                            </div>
			            </div>
			            <div class="col-xs-12 col-sm-6">
                            <div class="cols-sm-10">
					            <?= $form->field($model, 'repassword', [
						            'template' => '{label}<div class="input-group"><span class="input-group-addon"><i class="fa fa-lock fa-lg"
                                                                       aria-hidden="true"></i></span>{input}</div>{error}{hint}'
					            ])->passwordInput()->label('Nhập lại mật khẩu') ?>
                            </div>
			            </div>
		            </div>
                <?php } ?>

	            <div class="row">
		            <div class="col-xs-12 col-sm-8">
			            <div class="form-group">
				            <label for="email" class="cols-sm-2 control-label">Địa chỉ</label>
				            <div class="cols-sm-10">
                                <?= $form->field($userDetail, 'address', [
                                    'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-map-marker"
                                                                   aria-hidden="true"></i></span>{input}</div>{error}{hint}'
                                ])->label(false) ?>
				            </div>
			            </div>
		            </div>
		            <div class="col-xs-12 col-sm-4">
			            <div class="form-group">
				            <label for="email" class="cols-sm-2 control-label">Tỉnh / TP</label>
				            <div class="cols-sm-10">
                                <?php
                                $loca = \app\models\Locations::getAll();
                                ?>
                                <?= $form->field($userDetail, 'city_id', [
                                    'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-map-pin"
                                                                   aria-hidden="true"></i></span>{input}</div>{error}{hint}'
                                ])->dropDownList(\yii\helpers\ArrayHelper::map($loca, 'id', 'name'),
                                    [
                                        'prompt' => '-- Chọn --',
                                        'class' => 'job-select2 form-control'
                                    ])->label(false) ?>
				            </div>
			            </div>
		            </div>
	            </div>

	            <div class="row">
		            <div class="col-xs-12 col-sm-4">
			            <div class="form-group">
				            <label for="email" class="cols-sm-2 control-label">Giới tính</label>
				            <div class="cols-sm-10">
                                <?php $gender = \app\library\helper\Dropdowns::$gender; ?>
                                <?= $form->field($userDetail, 'gender', [
                                    'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-transgender"
                                                                   aria-hidden="true"></i></span>{input}</div>{error}{hint}'
                                ])->dropDownList($gender)->label(false) ?>
				            </div>
			            </div>
		            </div>
		            <div class="col-xs-12 col-sm-4">
			            <div class="form-group">
				            <label for="email" class="cols-sm-2 control-label">Sinh nhật</label>
				            <div class="cols-sm-10">
                                <?= $form->field($userDetail, 'birthday', [
                                    'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-birthday-cake"
                                                                   aria-hidden="true"></i></span>{input}</div>{error}{hint}'
                                ])->textInput(['class' => 'datepk form-control'])->label(false) ?>
				            </div>
			            </div>
		            </div>
		            <div class="col-xs-12 col-sm-4">
                        <div class="cols-sm-10">
                            <?= $form->field($userDetail, 'phone', [
                                'template' => '{label}<div class="input-group"><span class="input-group-addon"><i class="fa fa-mobile-alt" aria-hidden="true"></i></span>{input}</div>{error}{hint}'
                            ])->label('Điện thoại liên hệ') ?>
                        </div>
		            </div>
	            </div>
                <?php if($model->isNewRecord){ ?>
	            <div class="form-group ">
		            Các chính sách và quy địn của <?= Yii::$app->params['siteName']; ?> <a
				            href="<?= \app\library\helper\Helper::siteURL() ?>" target="_blank">tại đây</a>
                    <?= $form->field($model, 'iread', [
                        'template' => '{input}'
                    ])->checkbox(['class' => 'iCheck'])->label(false) ?>
	            </div>
                <?php } ?>
	            <div class="form-group ">
                    <?= Html::submitButton('<i class="fas fa-hdd"></i> Lưu thông tin', ['class' => 'btn btn-primary login-button']) ?>
	            </div>

                <?php ActiveForm::end(); ?>
            </div>
        </div>
    </div>
    <div class="col-12 col-sm-4 wrapper-sb">
        <?= (new \app\components\SidebarWidget())->recentJobs(); ?>
    </div>
</div>
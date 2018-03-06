<?php

use yii\helpers\Html;
use \yii\widgets\ActiveForm;
use dosamigos\fileupload\FileUploadUI; // https://github.com/2amigos/yii2-file-upload-widget

/* @var $this yii\web\View */
/* @var $model app\models\Users */

$this->title = 'Đăng kí tài khoản - '. \app\library\helper\Helper::siteURL();
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
                <h5>Vui lòng điền đúng địa chỉ email, hệ thống sẽ gửi link kích hoạt tài khoản vào email.</h5>

                <?php if($errors){
                    echo '<div class="alert alert-danger">';
                    echo '<strong>Có lỗi trong quá trình đăng ký:</strong>';
                    foreach ($errors as $error){
                             echo '<br>- ' . $error;
                    }
                    echo '</div>';
                } ?>

                <?php $form = ActiveForm::begin(); ?>
                <div class="row">
                    <div class="col-xs-12">
                        <h3>Thông tin công ty</h3>
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

                                <?= $form->field($com, 'content')->widget(\yii\redactor\widgets\Redactor::className(), [
                                    'clientOptions' => [
                                        'placeholder' => 'Giới thiệu về công ty',
                                        'observeLinks' => true,
                                        'convertVideoLinks' => true,
                                        'imageUpload' => ['/web/uploads/image'],
                                        'fileUpload' => ['/web/uploads/file'],
                                        'plugins' => ['clips', 'fontcolor', 'imagemanager'],
                                        'toolbar' => true,
                                        'buttons' => [
                                            'html',
                                            'format',
                                            'formatting',
                                            'lists',
                                            'bold',
                                            'italic',
                                            'deleted',
                                            'underline',
                                            'horizontalrule',
                                            'alignment',
                                            'unorderedlist',
                                            'orderedlist',
                                            'outdent',
                                            'indent',
                                            'link',
                                            /*'image',
                                            'file'*/
                                        ],
                                    ]
                                ]) ?>
                            </div>

                        </div>
                    </div>

                    <hr>

                    <div class="col-xs-12">
                        <h3>Người liên hệ</h3>
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
                                if(!$model->isNewRecord){
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

                <?php if($model->isNewRecord){ ?>
                <div class="row">
                    <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                            <label for="email" class="cols-sm-2 control-label">Mật khẩu</label>
                            <div class="cols-sm-10">
                                <?= $form->field($model, 'password', [
                                    'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-lock fa-lg"
                                                                       aria-hidden="true"></i></span>{input}</div>{error}{hint}'
                                ])->passwordInput()->label(false) ?>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                            <label for="email" class="cols-sm-2 control-label">Nhập lại mật khẩu</label>
                            <div class="cols-sm-10">
                                <?= $form->field($model, 'repassword', [
                                    'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-lock fa-lg"
                                                                       aria-hidden="true"></i></span>{input}</div>{error}{hint}'
                                ])->passwordInput()->label(false) ?>
                            </div>
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
                                $loca = \app\models\Locations::getLocations();
                                ?>
                                <?= $form->field($userDetail, 'city_id', [
                                    'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-map-pin"
                                                                   aria-hidden="true"></i></span>{input}</div>{error}{hint}'
                                ])->dropDownList(\yii\helpers\ArrayHelper::map($loca, 'id', 'name'))->label(false) ?>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-4">
                        <div class="form-group">
                            <label for="email" class="cols-sm-2 control-label">Giới tính</label>
                            <div class="cols-sm-10">
                                <?= $form->field($userDetail, 'gender', [
                                    'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-genderless"
                                                                   aria-hidden="true"></i></span>{input}</div>{error}{hint}'
                                ])->dropDownList(\yii\helpers\ArrayHelper::map($gender, 'id', 'name'))->label(false) ?>
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
                                ])->label(false) ?>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4">
                        <div class="form-group">
                            <label for="email" class="cols-sm-2 control-label">Điện thoại liên hệ</label>
                            <div class="cols-sm-10">
                                <?= $form->field($userDetail, 'phone', [
                                    'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-mobile-phone"
                                                                   aria-hidden="true"></i></span>{input}</div>{error}{hint}'
                                ])->label(false) ?>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group ">
                    <?= Html::submitButton('Đăng ký', ['class' => 'btn btn-primary login-button']) ?>
                </div>

                <?php ActiveForm::end(); ?>
            </div>
        </div>
    </div>
    <div class="col-12 col-sm-4">
        <div class="widget-sidebar">
            <h2 class="title-widget-sidebar">RECENT JOBS</h2>
            <div class="content-widget-sidebar">
                <ul>
                    <li class="recent-post">
                        <div class="post-img">
                            <img src="https://lh3.googleusercontent.com/-ndZJOGgvYQ4/WM1ZI8dH86I/AAAAAAAADeo/l67ZqZnRUO8QXIQi38bEXuxqHfVX0TV2gCJoC/w424-h318-n-rw/thumbnail8.jpg"
                                 class="img-responsive">
                        </div>
                        <a href="#"><h5>Excepteur sint occaecat cupi non proident laborum.</h5></a>
                        <p>
                            <small><i class="fa fa-calendar" data-original-title="" title=""></i> 30 Juni 2014</small>
                        </p>
                    </li>
                    <hr>

                    <li class="recent-post">
                        <div class="post-img">
                            <img src="https://lh3.googleusercontent.com/-ojLI116-Mxk/WM1ZIwdnuwI/AAAAAAAADeo/4K6VpwIPSfgsmlXJB5o0N8scuI3iW4OpwCJoC/w424-h318-n-rw/thumbnail6.jpg"
                                 class="img-responsive">
                        </div>
                        <a href="#"><h5>Excepteur sint occaecat cupi non proident laborum.</h5></a>
                        <p>
                            <small><i class="fa fa-calendar" data-original-title="" title=""></i> 30 Juni 2014</small>
                        </p>
                    </li>
                    <hr>

                    <li class="recent-post">
                        <div class="post-img">
                            <img src="https://lh3.googleusercontent.com/-TrK1csbtHRs/WM1ZI1SIUNI/AAAAAAAADeo/OkiUjuad6skWl9ugxbiIA_436OwsWKBNgCJoC/w424-h318-n-rw/thumbnail3.jpg"
                                 class="img-responsive">
                        </div>
                        <a href="#"><h5>Excepteur sint occaecat cupi non proident laborum.</h5></a>
                        <p>
                            <small><i class="fa fa-calendar" data-original-title="" title=""></i> 30 Juni 2014</small>
                        </p>
                    </li>
                    <hr>

                    <li class="recent-post">
                        <div class="post-img">
                            <img src="https://lh3.googleusercontent.com/-UKfIhJSBW9M/WM1ZI8ou34I/AAAAAAAADeo/vlLGY29147AYLaxUW29ZXJlun115BhkhgCJoC/w424-h318-n-rw/thumbnail7.jpg"
                                 class="img-responsive">
                        </div>
                        <a href="#"><h5>Excepteur sint occaecat cupi non proident laborum.</h5></a>
                        <p>
                            <small><i class="fa fa-calendar" data-original-title="" title=""></i> 30 Juni 2014</small>
                        </p>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
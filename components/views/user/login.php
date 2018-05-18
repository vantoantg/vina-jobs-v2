<?php

use yii\bootstrap\ActiveForm;
use app\library\helper\Helper;

?>

<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
     style="display: none;">
    <div class="modal-dialog">
        <div class="loginmodal-container">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close" data-toggle="tooltip" title="Đóng lại" data-placement="left">
                <span aria-hidden="true">&times;</span>
            </button>

            <h1>ĐĂNG NHẬP</h1><br>
            <?php $form = ActiveForm::begin([
                'action' => \app\library\helper\Helper::createUrl(['front/user/login']),
                'method' => "post",
                'options' => [
                    'class' => 'form floating-label',
                    'accept-charset' => "utf-8",
                    'autocomplete' => 'on'
                ]
            ]) ?>
            <input type="hidden" name="r" value="<?= Yii::$app->request->getUrl()?>">
            <?= $form->field($model, 'username')->textInput(['autofocus' => true, 'autocomplete' => 'off', 'placeholder' => 'Tài khoản hoặc email']) ?>
            <?= $form->field($model, 'password')->passwordInput(['placeholder' => 'Mật khẩu']) ?>
            <div class="hide error-login"><p class="text-danger"></p></div>
            <input type="submit" id="login" class="login loginmodal-submit" value="ĐĂNG NHẬP">
            <?php ActiveForm::end(); ?>

            <div class="login-help">
                <a href="#" id="form-register" data-dismiss="modal">Đăng ký</a>
                -
                <a href="<?= Helper::createUrl(['front/user/forgot']) ?>">Quên mật khẩu</a>
            </div>
            <div class="text-center socials">
                <h2>Hoặc</h2><br>
                <?= yii\authclient\widgets\AuthChoice::widget([
                    'baseAuthUrl' => ['/site/auth']
                ]) ?>
            </div>
        </div>
    </div>
</div>

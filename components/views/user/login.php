<?php

use yii\bootstrap\ActiveForm;

?>

<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
     style="display: none;">
    <div class="modal-dialog">
        <div class="loginmodal-container">
            <h1>Login</h1><br>
            <?php $form = ActiveForm::begin([
                'action' => \app\library\helper\Helper::createUrl('front/user/login'),
                'method' => "post",
                'options' => [
                    'class' => 'form floating-label',
                    'accept-charset' => "utf-8",
                    'autocomplete' => 'on'
                ]
            ]) ?>

            <?= $form->field($model, 'username')->textInput(['autofocus' => true, 'autocomplete' => 'off']) ?>
            <?= $form->field($model, 'password')->passwordInput() ?>
            <div class="hide error-login"><p class="text-danger"></p></div>
            <input type="submit" id="login" class="login loginmodal-submit" value="Login">
            <?php ActiveForm::end(); ?>

            <div class="login-help">
                <a href="#">Register</a> - <a href="#">Forgot Password</a>
            </div>
            <div class="text-center socials">
                <h2>or</h2><br>
                <?= yii\authclient\widgets\AuthChoice::widget([
                    'baseAuthUrl' => ['/site/auth']
                ]) ?>
            </div>
        </div>
    </div>
</div>

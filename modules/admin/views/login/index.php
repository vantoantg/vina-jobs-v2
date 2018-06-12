<?php

use yii\bootstrap\ActiveForm;

$this->title = 'Login';
?>
<section class="section-account">
    <div class="img-backdrop" style="background-image: url('../../assets/img/img16.jpg')"></div>
    <div class="spacer"></div>
    <div class="card contain-sm style-transparent">
        <div class="card-body">
            <div class="row">
                <div class="col-sm-6">
                    <br/>
                    <span class="text-lg text-bold text-primary">Administrator</span>
                    <br/><br/>

					<?php $form = \yii\bootstrap\ActiveForm::begin([
                        'method' => 'post',
                        'options' => [
                            'class' => 'form floating-label',
                            'accept-charset' => 'utf-8',
                            'autocomplete' => 'on',
                        ],
                    ]); ?>

                    <div class="error-login form-group mg-bt-0 pd-0 hide">
                        <span class="error text-danger"></span>
                    </div>
                    <div class="form-group">
						<?= $form->field($model, 'username', ['template' => '{input}{label}'])->textInput(['autofocus' => true, 'autocomplete' => 'off']); ?>
                    </div>
                    <div class="form-group">
						<?= $form->field($model, 'password', ['template' => '{input}{label}'])->passwordInput(); ?>
                        <p class="help-block"><a href="#">Forgotten?</a></p>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-xs-6 text-left">
                            <input type="hidden" name="AdminLoginForm[rememberMe]" value="0">
                            <div class="checkbox checkbox-inline checkbox-styled">
                                <label>
                                    <input type="checkbox" id="adminloginform-rememberme"
                                           name="AdminLoginForm[rememberMe]" value="1">
                                    <span>Remember me</span>
                                </label>
                            </div>
                        </div><!--end .col -->
                        <div class="col-xs-6 text-right">
                            <button class="btn btn-primary btn-raised" id="login" type="submit">Login</button>
                        </div><!--end .col -->
                    </div><!--end .row -->
					<?php ActiveForm::end(); ?>
                </div><!--end .col -->
                <div class="col-sm-5 col-sm-offset-1 text-center">
                    <br><br>
                    <h3 class="text-light">
                        No account yet?
                    </h3>
                    <a class="btn btn-block btn-raised btn-primary" href="#">Sign up here</a>
                    <br><br>
                    <h3 class="text-light">
                        or
                    </h3>
                    <?= yii\authclient\widgets\AuthChoice::widget([
                        'baseAuthUrl' => ['/site/auth'],
                    ]); ?>
                </div><!--end .col -->
            </div><!--end .row -->
        </div><!--end .card-body -->
    </div><!--end .card -->
</section>
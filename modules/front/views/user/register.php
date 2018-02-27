<?php

use yii\helpers\Html;
use \yii\widgets\ActiveForm;


/* @var $this yii\web\View */
/* @var $model app\models\Users */

$this->title = 'Create Users';
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
                <h5>Sign up once and watch any of our free demos.</h5>
                <?php $form = ActiveForm::begin(); ?>

                <div class="form-group">
                    <label for="name" class="cols-sm-2 control-label">Your Name</label>
                    <div class="cols-sm-10">
                        <?= $form->field($model, 'name', [
                            'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>{input}</div>{error}{hint}'
                        ])->label(false) ?>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email" class="cols-sm-2 control-label">Your Email</label>
                    <div class="cols-sm-10">
                        <?= $form->field($model, 'email', [
                            'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-envelope fa"
                                                                   aria-hidden="true"></i></span>{input}</div>{error}{hint}'
                        ])->label(false) ?>
                    </div>
                </div>

                <!--<div class="form-group">
                    <label for="username" class="cols-sm-2 control-label">Username</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" name="username" id="username"
                                   placeholder="Enter your Username"/>
                        </div>
                    </div>
                </div>-->

                <div class="form-group">
                    <label for="email" class="cols-sm-2 control-label">Password</label>
                    <div class="cols-sm-10">
                        <?= $form->field($model, 'password', [
                            'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-lock fa-lg"
                                                                       aria-hidden="true"></i></span>{input}</div>{error}{hint}'
                        ])->label(false) ?>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email" class="cols-sm-2 control-label">Confirm Password</label>
                    <div class="cols-sm-10">
                        <?= $form->field($model, 'password', [
                            'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-lock fa-lg"
                                                                       aria-hidden="true"></i></span>{input}</div>{error}{hint}'
                        ])->label(false) ?>
                    </div>
                </div>

                <hr>

                <?= $form->field($model, 'as_employers', [
                    'template' => '{input}{error}{hint}'
                ])->checkbox(['class' => "btn btn-info", 'data-toggle' => "collapse", 'data-target' => "#isCompany"])->label('As employers') ?>

                <div id="isCompany" class="collapse <?= $model->as_employers ? 'in' : ''; ?>">
                    <div class="form-group">
                        <label for="email" class="cols-sm-2 control-label">Company name</label>
                        <div class="cols-sm-10">
                            <div class="form-group">
                                <div class="input-group"><span class="input-group-addon"><i class="fa fa-users fa"
                                                                                            aria-hidden="true"></i></span><input
                                            type="text" id="users-password" class="form-control" name="Company[name]"
                                            aria-required="true"></div>
                                <div class="help-block"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group ">
                    <?= Html::submitButton('Register', ['class' => 'btn btn-primary btn-lg btn-block login-button']) ?>
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
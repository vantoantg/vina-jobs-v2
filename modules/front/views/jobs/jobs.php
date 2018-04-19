<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use \app\library\helper\Helper;

/** @var $page \app\models\Pages title */
$page = \app\models\Pages::get('jobs');
/** @var $this \yii\web\View title */
$this->title = Helper::titleSeo($page);
Helper::generateSeo($page);

/* @var $this yii\web\View */
/* @var $model app\models\Job */
/* @var $form ActiveForm */

?>
<div class="container">
    <div class="col-12 col-sm-8">
        <div class="front-jobs">

            <div class="row page-title text-center <?= \app\library\helper\Helper::wowClass() ?> bounce animated" data-wow-delay="1s" style="visibility: visible; animation-delay: 1s; animation-name: bounce;">
                <h5>ĐĂNG TUYỂN DỤNG</h5>
                <h2><span>54716</span> Available jobs for you</h2>
                <p>Hãy liệt kế tất cả các chính sách đang có, và cơ hội cho hấp dẫn, để có thể thu hút ứng viên apply vào các vị trí mà công ty muốn tuyển.</p>
            </div>

            <?php if (Yii::$app->session->hasFlash('success')): ?>
		        <div class="alert alert-success alert-dismissable">
			        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
			        <i class="icon fa fa-check"></i> <?= Yii::$app->session->getFlash('success') ?>
		        </div>
            <?php endif; ?>

            <?php $form = ActiveForm::begin(); ?>

            <?= $form->field($model, 'title') ?>

            <?php
            $countries = \app\models\JobCategories::find()->all();
            $listData = \yii\helpers\ArrayHelper::map($countries, 'id', 'name');
            echo $form->field($model, 'categories_id')->dropDownList(
                $listData,
                [
                    'prompt' => '-- Chọn --',
                    'class' => 'job-select2 form-control'
                ]
            );
            ?>
            <?= $form->field($model, 'description')->textarea() ?>
            <?= $form->field($model, 'content')->widget(\yii\redactor\widgets\Redactor::className(), [
                'clientOptions' => Helper::redactorOps('Hãy mô tả yêu cầu, kỹ năng, chính sách hấp dẫn cho ứng viên,....')
            ]) ?>
            <div class="row">
                <div class="col-xs-6">
                    <?= $form->field($model, 'salary')->textInput(['placeholder' => '900$ - 200$']) ?>
                </div>
                <div class="col-xs-6">
                    <?php
                    $loca = \app\models\Locations::getAll();
                    ?>
                    <?= $form->field($model, 'address')->dropDownList(\yii\helpers\ArrayHelper::map($loca, 'id', 'name'),
	                    [
		                    'class' => 'job-select2 form-control'
	                    ]) ?>
                </div>
            </div>

            <?= $form->field($model, 'tags') ?>

	        <div class="row">
		        <div class="col-xs-6">
                    <?= $form->field($model, 'client_status')->radioList([\app\models\Job::STATUS_CLIENT_DRAFT => 'Lưu tạm', \app\models\Job::STATUS_CLIENT_PUBLISH => 'Công bố'], ['class' => 'iCheck'])->label('Trạng thái lưu') ?>
		        </div>
	        </div>

	        <?php if($model->isNewRecord){ ?>
            <div class="form-group">
                <?= Html::submitButton('Lưu thông tin tuyển dụng', ['class' => 'btn btn-primary']) ?>
                <?= Html::resetButton('Xóa hết', ['class' => 'btn btn-default']) ?>
            </div>
	        <?php }else{ ?>
	        <div class="form-group">
                <?= Html::submitButton('Cập nhật thông tin tuyển dụng', ['class' => 'btn btn-primary']) ?>
	        </div>
	        <?php } ?>
            <?php ActiveForm::end(); ?>

        </div><!-- front-jobs -->
    </div>
    <div class="col-xs-12 col-sm-4">

        <div class="widget-sidebar">
            <h2 class="title-widget-sidebar">ARCHIVES</h2>
            <div class="last-post">
                <button class="accordion">21/4/2016</button>
                <div class="panel">
                    <li class="recent-post">
                        <div class="post-img">
                            <img src="https://lh3.googleusercontent.com/-13DR8P0-AN4/WM1ZIz1lRNI/AAAAAAAADeo/XMfJ7CM-pQg9qfRuCgSnphzqhaj3SQg6QCJoC/w424-h318-n-rw/thumbnail4.jpg" class="img-responsive">
                        </div>
                        <a href="#"><h5>Excepteur sint occaecat cupi non proident laborum.</h5></a>
                        <p><small><i class="fa fa-calendar" data-original-title="" title=""></i> 30 Juni 2014</small></p>
                    </li>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.   Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                </div>
            </div>
            <hr>
            <div class="last-post">
                <button class="accordion">5/7/2016</button>
                <div class="panel">
                    <li class="recent-post">
                        <div class="post-img">
                            <img src="https://lh3.googleusercontent.com/-QlnwuVgbxus/WM1ZI1FKQiI/AAAAAAAADeo/nGSd1ExnnfIfIBF27xs8-EdBdfglqFPZgCJoC/w424-h318-n-rw/thumbnail2.jpg" class="img-responsive">
                        </div>
                        <a href="#"><h5>Excepteur sint occaecat cupi non proident laborum.</h5></a>
                        <p><small><i class="fa fa-calendar" data-original-title="" title=""></i> 30 Juni 2014</small></p>
                    </li>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.   Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                </div>
            </div>
            <hr>
            <div class="last-post">
                <button class="accordion">15/9/2016</button>
                <div class="panel">
                    <li class="recent-post">
                        <div class="post-img">
                            <img src="https://lh3.googleusercontent.com/-wRHL_FOH1AU/WM1ZIxQZ3DI/AAAAAAAADeo/lwJr8xndbW4MHI-lOB7CQ-14FJB5f5SWACJoC/w424-h318-n-rw/thumbnail5.jpg" class="img-responsive">
                        </div>
                        <a href="#"><h5>Excepteur sint occaecat cupi non proident laborum.</h5></a>
                        <p><small><i class="fa fa-calendar" data-original-title="" title=""></i> 30 Juni 2014</small></p>
                    </li>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.   Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                </div>
            </div>
            <hr>
            <div class="last-post">
                <button class="accordion">2/3/2017</button>
                <div class="panel">
                    <li class="recent-post">
                        <div class="post-img">
                            <img src="https://lh3.googleusercontent.com/-QlnwuVgbxus/WM1ZI1FKQiI/AAAAAAAADeo/nGSd1ExnnfIfIBF27xs8-EdBdfglqFPZgCJoC/w424-h318-n-rw/thumbnail2.jpg" class="img-responsive">
                        </div>
                        <a href="#"><h5>Excepteur sint occaecat cupi non proident laborum.</h5></a>
                        <p><small><i class="fa fa-calendar" data-original-title="" title=""></i> 30 Juni 2014</small></p>
                    </li>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.   Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                </div>
            </div>
        </div>

        <div class="widget-sidebar">
            <h2 class="title-widget-sidebar">RECENT POST</h2>
            <div class="content-widget-sidebar">
                <ul>
                    <li class="recent-post">
                        <div class="post-img">
                            <img src="https://lh3.googleusercontent.com/-ndZJOGgvYQ4/WM1ZI8dH86I/AAAAAAAADeo/l67ZqZnRUO8QXIQi38bEXuxqHfVX0TV2gCJoC/w424-h318-n-rw/thumbnail8.jpg" class="img-responsive">
                        </div>
                        <a href="#"><h5>Excepteur sint occaecat cupi non proident laborum.</h5></a>
                        <p><small><i class="fa fa-calendar" data-original-title="" title=""></i> 30 Juni 2014</small></p>
                    </li>
                    <hr>

                    <li class="recent-post">
                        <div class="post-img">
                            <img src="https://lh3.googleusercontent.com/-ojLI116-Mxk/WM1ZIwdnuwI/AAAAAAAADeo/4K6VpwIPSfgsmlXJB5o0N8scuI3iW4OpwCJoC/w424-h318-n-rw/thumbnail6.jpg" class="img-responsive">
                        </div>
                        <a href="#"><h5>Excepteur sint occaecat cupi non proident laborum.</h5></a>
                        <p><small><i class="fa fa-calendar" data-original-title="" title=""></i> 30 Juni 2014</small></p>
                    </li>
                    <hr>

                    <li class="recent-post">
                        <div class="post-img">
                            <img src="https://lh3.googleusercontent.com/-TrK1csbtHRs/WM1ZI1SIUNI/AAAAAAAADeo/OkiUjuad6skWl9ugxbiIA_436OwsWKBNgCJoC/w424-h318-n-rw/thumbnail3.jpg" class="img-responsive">
                        </div>
                        <a href="#"><h5>Excepteur sint occaecat cupi non proident laborum.</h5></a>
                        <p><small><i class="fa fa-calendar" data-original-title="" title=""></i> 30 Juni 2014</small></p>
                    </li>
                    <hr>

                    <li class="recent-post">
                        <div class="post-img">
                            <img src="https://lh3.googleusercontent.com/-UKfIhJSBW9M/WM1ZI8ou34I/AAAAAAAADeo/vlLGY29147AYLaxUW29ZXJlun115BhkhgCJoC/w424-h318-n-rw/thumbnail7.jpg" class="img-responsive">
                        </div>
                        <a href="#"><h5>Excepteur sint occaecat cupi non proident laborum.</h5></a>
                        <p><small><i class="fa fa-calendar" data-original-title="" title=""></i> 30 Juni 2014</small></p>
                    </li>


                </ul>
            </div>
        </div>

    </div>
</div>
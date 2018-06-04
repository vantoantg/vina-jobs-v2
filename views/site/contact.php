<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */

/* @var $model app\models\ContactForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;

$this->title = 'Liên hệ';
$this->params['breadcrumbs'][] = $this->title;

$this->registerJs(
	'setTimeout(function(){ $("#contactform-verifycode-image").trigger("click"); }, 10);',
	\yii\web\View::POS_READY
);
$this->registerJs(
	'$("#contactform-verifycode-image").click();',
	\yii\web\View::POS_READY,
	'refresh-captcha'
);
?>

<div class="container">
    <div class="col-12 col-sm-8 ovf-y-h">
        <div class="site-contact <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="0.1s">
            <h1><?= Html::encode($this->title) ?></h1>

            <?php if (Yii::$app->session->hasFlash('contactFormSubmitted')): ?>

                <div class="alert alert-success">
	                Cảm ơn bạn đã liên hệ với chúng tôi. Chúng tôi sẽ phản hồi ý kiến của bạn hoặc trả lời ngay khi có thể.
                </div>

            <?php else: ?>
                <div class="alert-message alert-message-info <?= \app\library\helper\Helper::wowClass() ?> zoomInDown animated" data-wow-delay="0.2s">
                    <p>
                        - Nếu bạn có yêu cầu kinh doanh hoặc các câu hỏi khác, vui lòng điền vào mẫu dưới đây để liên hệ với chúng tôi.
                        <br>
                        - Hoặc bạn cũng có thể góp ý để website càng hoàn thiện tốt hơn, có thể phục vụ nhu cầu tuyển dụng và tìm việc. Chúng tôi xin chân thành cảm ơn.
                    </p>
                </div>
                <div class="row">
                    <div class="col-12 col-lg-8">

                        <?php $form = ActiveForm::begin([
                            'id' => 'contact-form',
//                            'enableAjaxValidation' => false,
//                            'enableClientValidation' => true
                        ]); ?>

                        <?= $form->field($model, 'name')->textInput(['autofocus' => true]) ?>

                        <?= $form->field($model, 'email') ?>

                        <?= $form->field($model, 'subject') ?>

                        <?= $form->field($model, 'body')->textarea(['rows' => 6]) ?>

                        <?= $form->field($model, 'verifyCode')->widget(Captcha::className(), [
                            'template' => '<div class="row"><div class="col-lg-6">{input}</div><div class="col-lg-3" title="Click vào ảnh để thay đổi">{image}</div></div>',
                        ]) ?>

                        <div class="form-group">
                            <?= Html::submitButton('<i class="fas fa-location-arrow"></i> Gửi đi',
                                ['class' => 'btn btn-primary', 'name' => 'contact-button']) ?>
                        </div>

                        <?php ActiveForm::end(); ?>

                    </div>
                </div>

            <?php endif; ?>
        </div>
    </div>
    <div class="col-12 col-sm-4 wrapper-sb">
        <?= (new \app\components\SidebarWidget())->recentJobs(); ?>
    </div>
</div>
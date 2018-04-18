<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */

/* @var $model app\models\ContactForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;

$this->title = 'Liên hệ';
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="container">
    <div class="col-12 col-sm-8">
        <div class="site-contact wow fadeInUp" data-wow-delay="0.1s">
            <h1><?= Html::encode($this->title) ?></h1>

            <?php if (Yii::$app->session->hasFlash('contactFormSubmitted')): ?>

                <div class="alert alert-success">
	                Cảm ơn bạn đã liên hệ với chúng tôi. Chúng tôi sẽ trả lời ngay khi có thể.
                </div>

                <p>
                    Note that if you turn on the Yii debugger, you should be able
                    to view the mail message on the mail panel of the debugger.
                    <?php if (Yii::$app->mailer->useFileTransport): ?>
                        Because the application is in development mode, the email is not sent but saved as
                        a file under <code><?= Yii::getAlias(Yii::$app->mailer->fileTransportPath) ?></code>.
                                                                                                            Please configure the
                        <code>useFileTransport</code> property of the <code>mail</code>
                        application component to be false to enable email sending.
                    <?php endif; ?>
                </p>

            <?php else: ?>

                <p>
	                - Nếu bạn có yêu cầu kinh doanh hoặc các câu hỏi khác, vui lòng điền vào mẫu dưới đây để liên hệ với chúng tôi.
                    <br>
                    - Hoặc bạn cũng có thể góp ý để website càng hoàn thiện tốt hơn, có thể phục vụ nhu cầu tuyển dụng và tìm việc. Cảm ơn bạn.
                </p>

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
                            'template' => '<div class="row"><div class="col-lg-3">{image}</div><div class="col-lg-6">{input}</div></div>',
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
    <div class="col-12 col-sm-4">
        <?= (new \app\components\SidebarWidget())->recentJobs(); ?>
    </div>
</div>
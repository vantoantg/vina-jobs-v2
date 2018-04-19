<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */

/* @var $model app\models\Job */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use app\library\helper\Helper;

$this->title = $model->title;
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="container">
    <div class="col-12 col-sm-8">
        <div class="employeers-detail wow fadeInUp" data-wow-delay="0.1s">

            <div class="row content">
                <h1><?= Html::encode($this->title) ?></h1>
				<?= $model->content; ?>
            </div>
            <div class="row ft-jobs-detail" data-href="<?= Helper::createUrl(['front/jobs/actions', 'slug' => $model->slug, 'id' => $model->id])?>">
                <div class="well text-center">
                    <button type="button" data-action="favorite" class="btn btn-sunny text-uppercase btn-lg"><i class="far fa-save"></i> Lưu đã lưu</button>
                    <button type="button" data-action="apply" class="btn btn-sky text-uppercase btn-lg"><i class="fas fa-location-arrow"></i> Apply</button>
                </div>
            </div>
        </div>
    </div>
    <div id="sidebarfx" data-follow-scroll='.employeers-detail' class="col-12 col-sm-4">
		<?= (new \app\components\SidebarWidget())->recentCompanyInfo(); ?>
    </div>
</div>

<div class="modal fade" id="apply-modal" tabindex="-1" role="dialog" aria-labelledby="apply-modal" aria-hidden="true"
     style="display: none;">
	<div class="modal-dialog">
		<div class="loginmodal-container">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close" data-toggle="tooltip" title="Đóng lại" data-placement="left">
				<span aria-hidden="true">&times;</span>
			</button>

			<h1>APPLY</h1><br>
            <?php $form = ActiveForm::begin([
                'action' => \app\library\helper\Helper::createUrl(['front/user/login']),
                'method' => "post",
                'options' => [
                    'class' => 'form floating-label',
                    'accept-charset' => "utf-8",
                    'autocomplete' => 'on'
                ]
            ]) ?>

			<div class="hide error-login"><p class="text-danger"></p></div>
			<input type="submit" class="apply" value="ĐĂNG NHẬP">
            <?php ActiveForm::end(); ?>
		</div>
	</div>
</div>

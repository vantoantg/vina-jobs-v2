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
		<div class="employeers-detail <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="0.1s">

			<div class="row content">
				<h1><?= Html::encode($this->title) ?></h1>
                <?= $model->content; ?>
			</div>
			<div class="row ft-jobs-detail" data-href="<?= Helper::createUrl([
                'front/jobs/actions',
                'slug' => $model->slug,
                'id' => $model->id
            ]) ?>">
				<div class="well text-center">
					<button type="button" data-action="favorite" class="btn btn-sunny text-uppercase btn-lg"><i
								class="far fa-save"></i> Lưu đã lưu
					</button>
					<button type="button" data-action="apply" class="btn btn-sky text-uppercase btn-lg"
					        data-toggle="modal" data-target="#apply-modal"><i class="fas fa-location-arrow"></i> Apply
					</button>
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
			<button type="button" class="close" data-dismiss="modal" aria-label="Close" data-toggle="tooltip"
			        title="Đóng lại" data-placement="left">
				<span aria-hidden="true">&times;</span>
			</button>
            <?php $form = ActiveForm::begin([
                'action' => \app\library\helper\Helper::createUrl(['front/user/login']),
                'method' => "post",
                'options' => [
                    'class' => 'form floating-label',
                    'accept-charset' => "utf-8",
                    'autocomplete' => 'on'
                ]
            ]) ?>
			<div class="row">
				<div class="col-xs-12">
					<div class="form-area">
						<div class="form-group">
							<textarea class="form-control" type="textarea" id="message" placeholder="Message"
							          maxlength="140" rows="7"></textarea>
							<span class="help-block"><p id="characterLeft" class="help-block ">You have reached the limit</p></span>
						</div>

						<button type="button" id="submit" name="submit" class="btn btn-primary pull-right"><i
									class="fas fa-location-arrow"></i> GỬI ĐI
						</button>
					</div>
				</div>
			</div>
            <?php ActiveForm::end(); ?>
		</div>
	</div>
</div>

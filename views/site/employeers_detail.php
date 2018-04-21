<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */

/* @var $model app\models\Job */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use app\library\helper\Helper;
use \app\library\helper\Common;

$this->title = $job['title'];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="container">
    <div class="col-12 col-sm-8">
        <div class="employeers-detail <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="0.1s">

            <div class="row content">
                <h1><?= Html::encode($this->title) ?></h1>
				<?= $job['content']; ?>
            </div>

            <div class="row ft-jobs-detail" data-href="<?= Helper::createUrl([
				'front/jobs/favorite',
				'slug' => $job['slug'],
				'id' => $job['id']
			]) ?>">
				<?php if (Common::isLoginned()) { ?>
					<?php if (Common::currentUsers()->type != \app\models\Users::USER_TYPE_CONTACT_OF_COMPANY) { ?>
                        <div class="well text-center">
                            <button type="button" data-action="favorite"
                                    class="btn btn-sunny text-uppercase btn-lg save-jobs <?php if ($job['saved']) {
								        echo '_saved';
							        } ?>"><i class="fas fa-check"></i><i class="far fa-save"></i>
                                <span><?php if ($job['saved']) {
										echo 'Tin đã lưu';
									} else {
										echo 'Lưu tin này';
									} ?></span>
                            </button>
							<?php if ($job['applied']) { ?>
                                <button type="button" data-action="apply" class="btn btn-sky text-uppercase btn-lg"><i
                                            class="fas fa-check"></i> Đã gửi hồ sơ
                                </button>
							<?php } else { ?>
                                <button type="button" data-action="apply"
                                        class="btn btn-sunny text-uppercase btn-lg apply-job"
                                        data-toggle="modal"
                                        data-target="#apply-modal"
                                        data-href="<?= Helper::createUrl(['front/jobs/preapply']); ?>">
                                    <i class="fas fa-location-arrow"></i> Gửi hồ sơ
                                </button>
							<?php } ?>
                        </div>
					<?php } ?>
				<?php } else { ?>
                    <div class="well text-center">
                        <button type="button" data-action="favorite"
                                class="btn btn-sunny text-uppercase btn-lg" <?= Helper::checkLogin() ?>><i
                                    class="far fa-save"></i> Lưu tin này
                        </button>
                        <button type="button" data-action="apply" class="btn btn-sunny text-uppercase btn-lg"
							<?= Helper::checkLogin() ?>><i class="fas fa-location-arrow"></i> Apply
                        </button>
                    </div>
				<?php } ?>
            </div>
        </div>
    </div>
    <div id="sidebarfx" data-follow-scroll='.employeers-detail' class="col-12 col-sm-4">
		<?= (new \app\components\SidebarWidget())->recentCompanyInfo(); ?>
    </div>
</div>
<!-- line modal -->
<div class="modal fade" id="apply-modal" tabindex="-1" role="dialog" aria-labelledby="apply-modal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
			<?php $form = ActiveForm::begin([
				'method' => "post",
				'options' => [
					'class' => 'form floating-label',
					'accept-charset' => "utf-8",
				]
			]) ?>
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Apply</h3>
            </div>
            <div class="modal-body">
                <div class="form-group">
					<?= $form->field($applyForm, 'message')->textarea(['placeholder' => 'Hãy viết gì đó cho nhà tuyển dụng...', 'rows' => 6]) ?>
                </div>

                <div class="panel with-nav-tabs">
                    <div class="panel-heading">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab1default" data-toggle="tab">Tải hồ sơ (CV) mới</a></li>
                            <li><a href="#tabs-cv-valid" data-toggle="tab">Chọn hồ sơ (CV) có sẵn</a></li>
                        </ul>
                    </div>
                    <div class="panel-body">
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="tab1default">
	                            <?= $form->field($applyForm, 'new_cv')->fileInput()->label(false) ?>
                            </div>
                            <div class="tab-pane fade" id="tabs-cv-valid">
                                <ul>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="btn-group" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fas fa-times"></i> Đóng lại</button>
                        <button type="submit" id="submit" name="apply" class="btn btn-primary pull-right"><i class="fas fa-location-arrow"></i> GỬI ĐI </button>
                    </div>
                </div>
            </div>
			<?php ActiveForm::end(); ?>
        </div>
    </div>
</div>

<script type="text/template" id="cv-list">
    <% _.each(list, function(v, k){ %>
    <li>
        <label><input <% if(k == 0){ %> checked <% } %> type="radio" class="radio-inline" name="radios" value="<%= v.file_path %>">
            <span class="outside"><span class="inside"></span></span><%= v.file_name %></label>
    </li>
    <% }) %>
</script>
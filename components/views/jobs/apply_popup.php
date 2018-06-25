<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 5/18/2018
 * Time: 10:29 PM
 */
use yii\widgets\ActiveForm;

?>

<!-- line modal -->
<div class="modal fade" id="apply-modal" tabindex="-1" role="dialog" aria-labelledby="apply-modal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<?php $form = ActiveForm::begin([
                'method' => 'post',
                'action' => \app\library\helper\Helper::getInstance()->createUrl(['front/jobs/apply-job']),
                'options' => [
                    'class' => 'form floating-label',
                    'accept-charset' => 'utf-8',
                ],
            ]); ?>
			<?= $form->field($applyForm, 'redirect')->hiddenInput()->label(false); ?>
			<?= $form->field($applyForm, 'job_code')->hiddenInput()->label(false); ?>

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
				<h3 class="modal-title" id="lineModalLabel">Apply</h3>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<?= $form->field($applyForm, 'message')->textarea(['placeholder' => 'Hãy viết gì đó cho nhà tuyển dụng...', 'rows' => 6]); ?>
				</div>

				<div class="panel with-nav-tabs">
					<div class="panel-heading">
						<ul class="nav nav-tabs">
							<li class="upload active"><a href="#upload-cv">Đính kèm CV</a></li>
						</ul>
					</div>
					<div class="panel-body">
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-cv-valid">
								<ul class="cv-new">
                                    <li class="radio">
                                        <label>
                                            <input type="radio" class="radio-inline" name="radios" value="upload">
                                            <span class="outside"><span class="inside"></span></span>Tải CV mới</label>
                                    </li>
                                    <li class="file hide">
	                                    <?= $form->field($applyForm, 'new_cv')->fileInput()->label(false); ?>
                                    </li>
								</ul>
                                <ul class="cv-list">
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
                <div class="">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fas fa-times"></i> Đóng lại</button>
                    <button type="submit" id="submit" name="apply" class="btn btn-primary pull-right"><i class="fas fa-location-arrow"></i> GỬI ĐI </button>
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
            <span class="outside"><span class="inside"></span></span><%= v.file_name %> (<%= v.created_at %>)</label>
    </li>
    <% }) %>
</script>
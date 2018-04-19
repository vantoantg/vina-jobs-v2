<?php

use yii\helpers\Html;
use \yii\widgets\ActiveForm;
use \app\models\Dropdown;
use \app\library\helper\Helper;

/* @var $this yii\web\View */
/* @var $model app\models\Users */
/* @var $candidate app\models\Candidate */
/** @var $page \app\models\Pages title */
/** @var $this \yii\web\View title */

$page = \app\models\Pages::get('register-candidate');
$this->title = Helper::titleSeo($page);
Helper::generateSeo($page);

$this->params['breadcrumbs'][] = ['label' => 'Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$dropdowns = new Dropdown();
?>
<div class="container">
	<div class="users-create">
        <h1>CẬP NHẬT HỒ SƠ ỨNG VIÊN</h1>
	</div>
</div>

<div class="modal fade" id="register-avatar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true"
     style="display: none;">
	<div class="vertical-alignment-helper">
		<div class="modal-dialog vertical-align-center">

			<div class="modal-content loginmodal-container switch-register">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close" title="Đóng lại">
					<span aria-hidden="true">&times;</span>
				</button>

				<div class="image-editor"
				     data-default-img="<?= \app\library\helper\Helper::webImgs('no-image-u.jpg'); ?>">
					<input type="file" class="cropit-image-input">
					<div class="cropit-preview text-center"></div>
                    <div class="image-size-label">Phóng to/thu nhỏ</div>
                    <input type="range" class="cropit-image-zoom-input" title="Kéo sang trái/phải để phóng to/thu nhỏ ảnh">
                    <button class="add-img" title="Chọn ảnh"><i class="fas fa-file-alt"></i></button>
                    <button class="rotate-ccw" title="Xoay qua trái"><i class="fas fa-undo"></i></button>
                    <button class="rotate-cw" title="Xoay qua phải"><i class="fas fa-redo"></i></button>
					<button class="save-cropit" data-dismiss="modal"><i class="fa fa fa-save"></i></button>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="container" id="register-candidate">
	<div class="col-12 col-sm-8">
		<div class="row main">
			<div class="main-login main-center">
                <div class="alert-message alert-message-info <?= \app\library\helper\Helper::wowClass() ?> zoomInDown animated" data-wow-delay="0.2s">
                    <h4>Lưu ý:</h4>
                    <p>Vui lòng điền đúng địa chỉ email, hệ thống sẽ gửi link kích hoạt tài khoản hoặc thông báo tuyển dụng vào <strong>email của bạn đăng ký</strong>.</p>
                </div>

                <?php $form = ActiveForm::begin(); ?>
				<div class="row">
					<div class="col-xs-12 col-sm-12 avatar-view">
                        <?= $form->field($model, 'avatar')->hiddenInput(['class' => 'hidden_base64'])->label(false) ?>
						<a href="#" data-toggle="modal" data-target="#register-avatar" data-wow-delay="0.6s" title="Nhấp vào đây để tải ảnh lên">
							<img class="imgs"
                                 src="<?= $model->avatar ? $model->avatar : ($model->avatar_url ? $model->avatar_url : \app\library\helper\Helper::webImgs('no_image_user.png')) ?>">
						</a>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-6">
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Họ & Tên<span class="red"> (*)</span></label>
							<div class="cols-sm-10">
                                <?= $form->field($model, 'name', [
                                    'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>{input}</div>{error}{hint}'
                                ])->label(false) ?>
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-6">
						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Email<span class="red"> (*)</span></label>
							<div class="cols-sm-10">
								<?php
                                $readonly = $model->email ? true : false;
								?>
                                <?= $form->field($model, 'email', [
                                    'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-envelope fa"
                                                                   aria-hidden="true"></i></span>{input}</div>{error}{hint}'
                                ])->textInput(['readonly' => $readonly])->label(false) ?>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-xs-12 col-sm-8">
						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Tỉnh / TP có thể làm việc<span class="red"> (*)</span></label>
							<div class="cols-sm-10">
								<?php
								$loca = \app\models\Locations::getAll();
								?>
								<?= $form->field($userDetail, 'city_id', [
									'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-map-pin"
                                                                   aria-hidden="true"></i></span>{input}</div>{error}{hint}'
								])->dropDownList(\yii\helpers\ArrayHelper::map($loca, 'id', 'name'),
                                    [
                                        'prompt' => '-- Chọn --',
                                        'class' => 'job-select2 form-control',
										'multiple' => 'multiple'
                                    ])->label(false) ?>
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-4">
						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Điện thoại liên hệ<span class="red"> (*)</span></label>
							<div class="cols-sm-10">
								<?= $form->field($userDetail, 'phone', [
									'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-mobile-alt"
                                                                   aria-hidden="true"></i></span>{input}</div>{error}{hint}'
								])->label(false) ?>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-xs-12 col-sm-4">
						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Lĩnh vực<span class="red"> (*)</span></label>
							<div class="cols-sm-10">
								<?php $data = \app\models\JobCategories::getAll(); ?>
								<?= $form->field($candidate, 'job_category_id', [
									'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-genderless"
                                                                   aria-hidden="true"></i></span>{input}</div>{error}{hint}'
								])->dropDownList(\yii\helpers\ArrayHelper::map($data, 'id', 'name'),
									[
										'prompt' => '-- Chọn --',
										'class' => 'job-select2 form-control'
									])->label(false) ?>
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-8">
						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Kĩ năng<span class="red"> (*)</span></label>
							<div class="cols-sm-10">
								<?php $data = \app\models\JobSkill::getAllSkill(); ?>
								<?= $form->field($candidate, 'skill[]', [
									'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-genderless"
                                                                   aria-hidden="true"></i></span>{input}</div>{error}{hint}'
								])->dropDownList(\yii\helpers\ArrayHelper::map($data, 'name', 'name'),
									[
										'prompt' => '-- Chọn --',
										'class' => 'select-tags form-control',
										'multiple' => 'multiple',
										'data-placeholder' => 'Chọn từ khóa có sẵn, hoặc thêm mới'
									])->label(false) ?>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-xs-12 col-sm-8">
						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Địa chỉ</label>
							<div class="cols-sm-10">
								<?= $form->field($userDetail, 'address', [
									'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-map-marker"
                                                                   aria-hidden="true"></i></span>{input}</div>{error}{hint}'
								])->label(false) ?>
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-4">
						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Giới tính</label>
							<div class="cols-sm-10">
								<?php $gender = \app\library\helper\Dropdowns::$gender; ?>
								<?= $form->field($userDetail, 'gender', [
									'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-transgender"
                                                                   aria-hidden="true"></i></span>{input}</div>{error}{hint}'
								])->dropDownList($gender)->label(false) ?>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-xs-12 col-sm-4">
						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Sinh nhật</label>
							<div class="cols-sm-10">
                                <?= $form->field($userDetail, 'birthday', [
                                    'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-birthday-cake"
                                                                   aria-hidden="true"></i></span>{input}</div>{error}{hint}'
                                ])->textInput(['class' => 'datepk form-control'])->label(false) ?>
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-4">
						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Trình độ</label>
							<div class="cols-sm-10">
								<?php $lel = \app\library\helper\Dropdowns::$education; ?>
								<?= $form->field($candidate, 'education', [
									'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-align-center"
                                                                   aria-hidden="true"></i></span>{input}</div>{error}{hint}'
								])->dropDownList($lel,
									[
										'class' => 'job-select2 form-control'
									])->label(false) ?>
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-4">
						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Kinh nghiệm</label>
							<div class="cols-sm-10">
								<?php $experience = \app\library\helper\Dropdowns::$experience; ?>
								<?= $form->field($candidate, 'experience', [
									'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-list-ol"
                                                                   aria-hidden="true"></i></span>{input}</div>{error}{hint}'
								])->dropDownList($experience,
									[
										'class' => 'job-select2 form-control'
									])->label(false) ?>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">
	                    <?= $form->field($userDetail, 'about_me')->widget(\yii\redactor\widgets\Redactor::className(), [
	                        'clientOptions' => Helper::redactorOps('Hãy giới thiệu bản thân mình, điểm mạnh, điểm yếu, tính cách,... tạo sự chú ý cho nhà tuyển dụng nhanh nhất.'),
	                    ])->label('Đôi nét về bản thân') ?>
					</div>
				</div>

                <div class="row">
                    <div class="col-xs-12">
						<?= $form->field($candidate, 'client_status')->radioList([\app\models\Candidate::STATUS_CLIENT_DRAFT => 'Chưa sẵn sàng', \app\models\Candidate::STATUS_CLIENT_PUBLISH => 'Đã sẵn sàng'], ['class' => 'iCheck'])->label('Bạn có muốn hiện thị khi nguời dùng tìm kiếm ?') ?>
                    </div>
                </div>

				<hr>

				<div class="form-group ">
                    <?= Html::submitButton('<i class="fas fa-hdd"></i> Cập nhật hồ sơ', ['class' => 'btn btn-primary login-button']) ?>
				</div>

                <?php ActiveForm::end(); ?>
			</div>
		</div>
	</div>
	<div class="col-12 col-sm-4">
		<?= (new \app\components\SidebarWidget())->recentJobs(); ?>
	</div>
	<script type="text/javascript">
		var keyTest = <?= \yii\helpers\Json::encode($jobSkill); ?>
	</script>

	<script type="text/template" id="skill-template">
		<% _.each(list, function(item) { %>
		<option value="<%= item.name %>"><%= item.name %></option>
		<% }) %>
	</script>
</div>
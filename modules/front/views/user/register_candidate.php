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

		<h1><?= Html::encode($this->title) ?></h1>

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
					<div class="image-size-label">
						Resize image
					</div>
					<input type="range" class="cropit-image-zoom-input">
					<button class="add-img"><i class="fa fa-file-image-o"></i></button>
					<button class="rotate-ccw"><i class="fa fa-rotate-left"></i></button>
					<button class="rotate-cw"><i class="fa fa-rotate-right"></i></button>
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
				<h5>Vui lòng điền đúng địa chỉ email, hệ thống sẽ gửi link kích hoạt tài khoản vào email.</h5>
                <?php $form = ActiveForm::begin(); ?>
				<div class="row">
					<div class="col-xs-12 col-sm-12 avatar-view">
                        <?= $form->field($model, 'avatar')->hiddenInput(['class' => 'hidden_base64'])->label(false) ?>
						<a href="#" data-toggle="modal" data-target="#register-avatar" data-wow-delay="0.6s" title="Nhấp vào đây để tải ảnh lên">
							<img class="imgs" src="<?= \app\library\helper\Helper::webImgs('no_image_user.png'); ?>">
						</a>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-6">
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Họ & Tên<span class="text-danger"> (*)</span></label>
							<div class="cols-sm-10">
                                <?= $form->field($model, 'name', [
                                    'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>{input}</div>{error}{hint}'
                                ])->label(false) ?>
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-6">
						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Email<span class="text-danger"> (*)</span></label>
							<div class="cols-sm-10">
                                <?= $form->field($model, 'email', [
                                    'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-envelope fa"
                                                                   aria-hidden="true"></i></span>{input}</div>{error}{hint}'
                                ])->label(false) ?>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-xs-12 col-sm-6">
						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Mật khẩu<span class="text-danger"> (*)</span></label>
							<div class="cols-sm-10">
                                <?= $form->field($model, 'password', [
                                    'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-lock fa-lg"
                                                                       aria-hidden="true"></i></span>{input}</div>{error}{hint}'
                                ])->passwordInput()->label(false) ?>
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-6">
						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Nhập lại mật khẩu<span class="text-danger"> (*)</span></label>
							<div class="cols-sm-10">
                                <?= $form->field($model, 'repassword', [
                                    'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-lock fa-lg"
                                                                       aria-hidden="true"></i></span>{input}</div>{error}{hint}'
                                ])->passwordInput()->label(false) ?>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-xs-12 col-sm-8">
						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Tỉnh / TP có thể làm việc<span class="text-danger"> (*)</span></label>
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
							<label for="email" class="cols-sm-2 control-label">Điện thoại liên hệ<span class="text-danger"> (*)</span></label>
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
							<label for="email" class="cols-sm-2 control-label">Lĩnh vực<span class="text-danger"> (*)</span></label>
							<div class="cols-sm-10">
								<?php $data = \app\models\JobCategories::categoriesMenus(); ?>
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
							<label for="email" class="cols-sm-2 control-label">Kĩ năng<span class="text-danger"> (*)</span></label>
							<div class="cols-sm-10">
								<?php $data = \app\models\JobSkill::getAllSkill(); ?>
								<?= $form->field($candidate, 'skill[]', [
									'template' => '<div class="input-group"><span class="input-group-addon"><i class="fa fa-genderless"
                                                                   aria-hidden="true"></i></span>{input}</div>{error}{hint}'
								])->dropDownList(\yii\helpers\ArrayHelper::map($data, 'name', 'name'),
									[
										'prompt' => '-- Chọn --',
										'class' => 'job-select2 form-control',
										'multiple' => 'multiple'
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
	                        'clientOptions' => [
	                            'placeholder' => 'Hãy giới thiệu bản thân mình, điểm mạnh, điểm yếu, tính cách,... tạo sự chú ý cho nhà tuyển dụng nhanh nhất.',
	                            'observeLinks' => true,
	                            'convertVideoLinks' => true,
	                            'imageUpload' => ['/web/uploads/image'],
	                            'fileUpload' => ['/web/uploads/file'],
	                            'plugins' => ['clips', 'fontcolor', 'imagemanager'],
	                            'toolbar' => true,
	                            'buttons' => [
	                                'html',
	                                'format',
	                                'formatting',
	                                'lists',
	                                'bold',
	                                'italic',
	                                'deleted',
	                                'underline',
	                                'horizontalrule',
	                                'alignment',
	                                'unorderedlist',
	                                'orderedlist',
	                                'outdent',
	                                'indent',
	                                'link',
	                                /*'image',
	                                'file'*/
	                            ],
	                        ]
	                    ])->label('Đôi nét về bản thân') ?>
					</div>
				</div>

				<hr>

				<div class="form-group ">
                    Tôi đã đọc và đồng ý chính sách của <a href="<?= \app\library\helper\Helper::createUrl(['site/policy'])?>"><?= \app\library\helper\Helper::siteURL()?></a>
                </div>
				<div class="form-group ">
                    <?= Html::submitButton('Đăng ký', ['class' => 'btn btn-primary login-button']) ?>
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
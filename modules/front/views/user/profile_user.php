<?php

use app\library\helper\Common;
use app\library\helper\Helper;
use app\models\Pages;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\User */
/* @var $dataProvider yii\data\ActiveDataProvider */
$page = Pages::get('profile-user');
$this->title = Helper::titleSeo($page);
$this->params['breadcrumbs'][] = $this->title;
Helper::generateSeo($page);

/** @var $userInfo \app\models\UserDetails $userInfo */
$userInfo = \app\models\UserDetails::getInfo();

\app\components\Menu\ActiveMenu::is('job-seekers');
?>

<div class="container">
	<div class="row">
		<div class="col-md-12 toppad pull-right">
			<br>
			<p class=" text-info"><?= \app\library\helper\Datetime::getDateNow(); ?></p>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">

			<div class="card">
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active">
						<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">THÔNG TIN CÁ NHÂN</a>
					</li>
					<li role="presentation"><a href="#jobs" aria-controls="jobs" role="tab" data-toggle="tab">CÁC TIN
							ĐANG THEO DÕI</a></li>
				</ul>

				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active ovf-h" id="profile">
						<div class="row">
							<div class="col-xs-12 toppad <?= \app\library\helper\Helper::wowClass(); ?> fadeInUp" data-wow-delay="0.1s">
								<div class="panel panel-info">
									<div class="panel-heading">
										<h3 class="panel-title"><?= Common::currentUser('name'); ?></h3>
									</div>
									<div class="panel-body">
										<div class="row">
											<div class=" col-md-9 col-lg-9">
												<table class="table table-user-information">
													<tbody>
													<tr>
														<td>Avatar: <?= Common::currentUser('avatar'); ?></td>
														<td>
															<!--<img alt="User Pic"
															     src="<?/*= Helper::imgRender('/'.Common::currentUser('avatar'), 150, 150, 'avatar'); */?>"
															     class="img-responsive">-->
														</td>
													</tr>
													<tr>
														<td>Đăng ký:</td>
														<td><?= $userInfo->registration_date; ?></td>
													</tr>
													<tr>
														<td>Sinh nhật</td>
														<td><?= $userInfo->birthday; ?></td>
													</tr>

													<tr>
													<tr>
														<td>Giới tính</td>
														<td><?= $userInfo->gender; ?></td>
													</tr>
													<tr>
														<td>Địa chỉ</td>
														<td><?= $userInfo->address; ?></td>
													</tr>
													<tr>
														<td>Email</td>
														<td>
															<a href="mailto:<?= $userInfo->email; ?>"><?= $userInfo->email; ?></a>
														</td>
													</tr>
													<tr>
														<td>Điện thoại</td>
														<td><?= $userInfo->phone; ?></td>
													</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div class="panel-footer">
                                        <a href="<?= Helper::createUrl(['front/user/update-candidate']); ?>?r=<?= Helper::encrypt(Yii::$app->request->getUrl().'#jobs'); ?>"class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-edit"></i> Cập nhật thông tin</a>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div role="tabpanel" class="tab-pane ovf-h" id="jobs">
						<div class="col-xs-12 jobs">
							<div class="job-posts table-responsive">
								<table class="table list-jobs">
									<tr class="odd <?= \app\library\helper\Helper::wowClass(); ?> fadeInUp" data-wow-delay="0.1s">
										<td class="tbl-logo">
											<img src="<?= Helper::homeUrl(); ?>web/template/jobs/img/job-logo1.png" alt=""></td>
										<td class="tbl-title"><h4>Web Designer <br><span class="job-type">full time</span></h4>
										</td>
										<td><p>dribbble community</p></td>
										<td><p><i class="icon-location"></i>San Franciso, USA</p></td>
										<td><p>&dollar; 14000</p></td>
									</tr>
									<tr class="even <?= \app\library\helper\Helper::wowClass(); ?> fadeInUp" data-wow-delay="1.1s">
										<td class="tbl-logo"><img
													src="<?= Helper::homeUrl(); ?>web/template/jobs/img/job-logo2.png"
													alt=""></td>
										<td class="tbl-title">
											<h4>Front End Developer <br><span class="job-type">full time</span>
											</h4>
										</td>
										<td><p>Jolil corporation</p></td>
										<td><p><i class="icon-location"></i>San Franciso, USA</p></td>
										<td><p>&dollar; 14000</p></td>
									</tr>
									<tr class="odd <?= \app\library\helper\Helper::wowClass(); ?> fadeInUp" data-wow-delay="1.2s">
										<td class="tbl-logo"><img
													src="<?= Helper::homeUrl(); ?>web/template/jobs/img/job-logo3.png"
													alt="">
										</td>
										<td class="tbl-title">
											<h4>HR Manager <br><span class="job-type">full time</span>
											</h4></td>
										<td><p>Fanta bevarage</p></td>
										<td><p><i class="icon-location"></i>San Franciso, USA</p></td>
										<td><p>&dollar; 14000</p></td>
									</tr>
									<tr class="even <?= \app\library\helper\Helper::wowClass(); ?> fadeInUp" data-wow-delay="1.3s">
										<td class="tbl-logo">
											<img src="<?= Helper::homeUrl(); ?>web/template/jobs/img/job-logo4.png"
											     alt="">
										</td>
										<td class="tbl-title">
											<h4>Internship Designer <br><span class="job-type">full time</span>
											</h4>
										</td>
										<td><p>Google</p></td>
										<td><p><i class="icon-location"></i>San Franciso, USA</p></td>
										<td><p>&dollar; 14000</p></td>
									</tr>
									<tr class="odd <?= \app\library\helper\Helper::wowClass(); ?> fadeInUp" data-wow-delay="1.4s">
										<td class="tbl-logo">
											<img src="<?= Helper::homeUrl(); ?>web/template/jobs/img/job-logo5.png"
											     alt="">
										</td>
										<td class="tbl-title">
											<h4>Software Designer <br><span
														class="job-type">full time</span></h4></td>
										<td><p>Microsoft</p></td>
										<td><p><i class="icon-location"></i>San Franciso, USA</p></td>
										<td><p>&dollar; 14000</p></td>
									</tr>
									<tr class="odd <?= \app\library\helper\Helper::wowClass(); ?> fadeInUp" data-wow-delay="1.5s">
										<td class="tbl-logo"><img
													src="<?= Helper::homeUrl(); ?>web/template/jobs/img/job-logo4.png"
													alt=""></td>
										<td class="tbl-title"><h4>Internship Designer <br><span class="job-type">full time</span>
											</h4></td>
										<td><p>Google</p></td>
										<td><p><i class="icon-location"></i>San Franciso, USA</p></td>
										<td><p>&dollar; 14000</p></td>
									</tr>
									<tr class="odd <?= \app\library\helper\Helper::wowClass(); ?> fadeInUp" data-wow-delay="1.6s">
										<td class="tbl-logo"><img
													src="<?= Helper::homeUrl(); ?>web/template/jobs/img/job-logo4.png"
													alt=""></td>
										<td class="tbl-title"><h4>Internship Designer <br><span class="job-type">full time</span>
											</h4></td>
										<td><p>Google</p></td>
										<td><p><i class="icon-location"></i>San Franciso, USA</p></td>
										<td><p>&dollar; 14000</p></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
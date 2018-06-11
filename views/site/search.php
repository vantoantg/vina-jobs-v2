<?php

/* @var $this yii\web\View */

use yii\helpers\Html;
use app\library\helper\Helper;

$page = \app\models\Pages::get('search');
/** @var $page \app\models\Pages title */

/** @var $this \yii\web\View title */
$this->title = \app\library\helper\Helper::titleSeo($page);
\app\library\helper\Helper::generateSeo($page);
$this->params['breadcrumbs'][] = $this->title;
$this->registerJsFile(Yii::$app->getHomeUrl().'vendor/bower-asset/select2/dist/js/select2.min.js');
?>

<div class="container <?= $page->slug; ?>">
	<div class="col-12 col-sm-3">
		<div class="row">
            <?= (new \app\components\SidebarWidget())->searchResultJobs($_url, $queryParams); ?>
		</div>
	</div>

	<div class="col-12 col-sm-9 search-results">
		<div class="row">
			<div class="jobs">
				<div class="pd-lr-0 col-xs-12">
					<h2>CÓ 365 KẾT QUẢ</h2>

					<div class="job-posts table-responsive">
						<table class="table list-jobs">
							<tr class="odd <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="1s">
								<td class="tbl-logo"><img
											src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo1.png" alt="">
								</td>
								<td class="tbl-title"><h4>Web Designer <br><span class="job-type">full time</span></h4>
								</td>
								<td><p>dribbble community</p></td>
								<td><p>&dollar; 14000</p></td>
								<td class="tbl-apply"><a href="#">Apply now</a></td>
							</tr>
							<tr class="even <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="1.1s">
								<td class="tbl-logo"><img
											src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo2.png" alt="">
								</td>
								<td class="tbl-title"><h4>Front End Developer <br><span
												class="job-type">full time</span></h4></td>
								<td><p>Jolil corporation</p></td>
								<td><p>&dollar; 14000</p></td>
								<td class="tbl-apply"><a href="#">Apply now</a></td>
							</tr>
							<tr class="odd <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="1.2s">
								<td class="tbl-logo"><img
											src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo3.png" alt="">
								</td>
								<td class="tbl-title"><h4>HR Manager <br><span class="job-type">full time</span></h4>
								</td>
								<td><p>Fanta bevarage</p></td>
								<td><p>&dollar; 14000</p></td>
								<td class="tbl-apply"><a href="#">Apply now</a></td>
							</tr>
							<tr class="even <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="1.3s">
								<td class="tbl-logo"><img
											src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo4.png" alt="">
								</td>
								<td class="tbl-title"><h4>Internship Designer <br><span
												class="job-type">full time</span></h4></td>
								<td><p>Google</p></td>
								<td><p>&dollar; 14000</p></td>
								<td class="tbl-apply"><a href="#">Apply now</a></td>
							</tr>
							<tr class="odd <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="1.4s">
								<td class="tbl-logo"><img
											src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo5.png" alt="">
								</td>
								<td class="tbl-title"><h4>Software Designer <br><span class="job-type">full time</span>
									</h4></td>
								<td><p>Microsoft</p></td>
								<td><p>&dollar; 14000</p></td>
								<td class="tbl-apply"><a href="#">Apply now</a></td>
							</tr>
							<tr class="even hide-jobs">
								<td class="tbl-logo"><img
											src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo4.png" alt="">
								</td>
								<td class="tbl-title"><h4>Internship Designer <br><span
												class="job-type">full time</span></h4></td>
								<td><p>Google</p></td>
								<td><p>&dollar; 14000</p></td>
								<td class="tbl-apply"><a href="#">Apply now</a></td>
							</tr>
							<tr class="odd hide-jobs">
								<td class="tbl-logo"><img
											src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo5.png" alt="">
								</td>
								<td class="tbl-title"><h4>Software Designer <br><span class="job-type">full time</span>
									</h4></td>
								<td><p>Microsoft</p></td>
								<td><p>&dollar; 14000</p></td>
								<td class="tbl-apply"><a href="#">Apply now</a></td>
							</tr>
							<tr class="even hide-jobs">
								<td class="tbl-logo"><img
											src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo4.png" alt="">
								</td>
								<td class="tbl-title"><h4>Internship Designer <br><span
												class="job-type">full time</span></h4></td>
								<td><p>Google</p></td>
								<td><p>&dollar; 14000</p></td>
								<td class="tbl-apply"><a href="#">Apply now</a></td>
							</tr>
							<tr class="odd hide-jobs">
								<td class="tbl-logo"><img
											src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo5.png" alt="">
								</td>
								<td class="tbl-title"><h4>Software Designer <br><span class="job-type">full time</span>
									</h4></td>
								<td><p>Microsoft</p></td>
								<td><p>&dollar; 14000</p></td>
								<td class="tbl-apply"><a href="#">Apply now</a></td>
							</tr>
						</table>
					</div>
					<div class="more-jobs">
						<a href=""> <i class="fa fa-refresh"></i>View more jobs</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */

/* @var $model app\models\Job */

use yii\helpers\Html;

$this->title = $company['name'];
$this->params['breadcrumbs'][] = $this->title;
\app\components\Menu\ActiveMenu::is('employeers');
?>

	<div class="container">
		<div class="col-12 col-sm-9">
			<div class="employeers-detail <?= \app\library\helper\Helper::getInstance()->wowClass(); ?> fadeInUp"
			     data-wow-delay="0.1s">

				<div class="row">
					<h1 class="text-center"><?= Html::encode($this->title); ?></h1>
				</div>
				<div class="row content">
                    <?php if ($galleries) {
    ?>
						<div class="gallery col-xs-12">
							<div class="row">
                                <?php foreach ($galleries as $k => $gallery) {
        ?>
									<div class="col-xs-4 item">
										<a href="#" data-toggle="modal" data-target="#viewGallery">
											<img src="<?= $gallery['thum']; ?>" class="img-thumbnail" alt="Los Angeles">
										</a>
									</div>
                                    <?php
    } ?>
							</div>
						</div>
						<div class="clearfix"></div>
                        <?php
} ?>
					<div class="pd-t-30">
                        <?= $company['content']; ?>
					</div>
				</div>
			</div>

			<div class="row">
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#home">TIN ĐÃ ĐĂNG (<?= count($company_jobs); ?>)</a></li>
					<li><a data-toggle="tab" href="#menu1">ĐÁNH GIÁ CÔNG TY</a></li>
				</ul>

				<div class="tab-content">
					<div id="home" class="tab-pane fade in active">
						<div class="col-md-12 pd-lr-0">
                            <?php
                            if ($company_jobs) {
                                ?>
								<div class="job-posts table-responsive">
									<table class="table list-jobs">
                                        <?php foreach ($company_jobs as $i => $job) {
                                    ?>
											<tr class="odd <?= \app\library\helper\Helper::getInstance()->wowClass(); ?> fadeInUp"
											    data-wow-delay="0.<?= $i; ?>s">
												<td class="tbl-title"><h4><a
																href="<?= $job['url_view']; ?>"><?= $job['job_name']; ?></a>
														<br><span class="job-type"><?= $job['working_time']; ?></span>
													</h4></td>
												<td><p><?= $job['cat_name']; ?></p></td>
												<td><p>Salary: <?= $job['salary']; ?></p></td>
												<td><p><i class="icon-location"></i><?= $job['loca_name']; ?></p></td>
											</tr>
                                            <?php
                                } ?>
									</table>
								</div>
                                <?php
                            } else {
                                ?>
								<p class="text-center nodata"><i class="far fa-file"></i><br>
									Không có tin nào!
								</p>
                            <?php
                            } ?>

						</div>
					</div>
					<div id="menu1" class="tab-pane fade">
						<p class="text-center nodata"><i class="fas fa-paint-brush"></i> <br>
							Tính năng đang cập nhật!
						</p>
					</div>
				</div>
			</div>
		</div>

		<div id="sidebarfx" data-follow-scroll='.employeers-detail' class="col-12 col-sm-3 pd-t-30">
			<div class="job-add <?= \app\library\helper\Helper::getInstance()->wowClass(); ?> fadeInRight" data-wow-delay="0.1s">
				<h2>Tìm việc ?</h2>
				<a href="#" data-toggle="modal" data-target="#register-modal">TẠO TÀI KHOẢN</a>
			</div>
		</div>
	</div>

<?php if ($galleries) {
                                ?>
	<!-- Modal -->
	<div id="viewGallery" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<div class="modal-body">
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
                            <?php foreach ($galleries as $k => $gallery) {
                                    ?>
								<li data-target="#myCarousel" data-slide-to="<?= $k; ?>" class="<?php if ($k == 0) {
                                        echo 'active';
                                    } ?>"></li>
                                <?php
                                } ?>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner">
                            <?php foreach ($galleries as $k => $gallery) {
                                    ?>
								<div class="item <?php if ($k == 0) {
                                        echo 'active';
                                    } ?>">
									<img src="<?= $gallery['view']; ?>" alt="Los Angeles">
								</div>
                                <?php
                                } ?>
						</div>

						<!-- Left and right controls -->
						<a class="left carousel-control" href="#myCarousel" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left"></span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="right carousel-control" href="#myCarousel" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
    <?php
                            } ?>
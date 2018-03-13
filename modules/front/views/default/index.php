<?php

use app\library\helper\Helper;
use \yii\widgets\ActiveForm;

$page = \app\models\Pages::get();
/** @var $page \app\models\Pages title */
/** @var $this \yii\web\View title */
$this->title = $page->seo_title . ' | ' . Helper::siteURL();

Helper::generateSeo($page);
?>
<div class="slider-area">
	<div class="slider">
		<div id="bg-slider" class="owl-carousel owl-theme">

			<div class="item"><img src="<?= Helper::homeUrl() ?>web/template/jobs/img/slider-image-3.jpg"
			                       alt="Mirror Edge"></div>
			<div class="item"><img src="<?= Helper::homeUrl() ?>web/template/jobs/img/slider-image-2.jpg"
			                       alt="The Last of us"></div>
			<div class="item"><img src="<?= Helper::homeUrl() ?>web/template/jobs/img/slider-image-1.jpg" alt="GTA V">
			</div>

		</div>
	</div>
	<div class="container slider-content">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-sm-12">
				<h2>TÌM KIẾM CÔNG VIỆC TRỞ NÊN <br> DỄ DÀNG HƠN</h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi deserunt deleniti, ullam commodi
					sit ipsam laboriosam velit adipisci quibusdam aliquam teneturo!</p>
				<div class="search-form wow pulse" data-wow-delay="0.8s">
                    <?php $form = ActiveForm::begin(['options' => ['class' => 'form-inline']]); ?>
                    <?= $form->field($search, 'keys', [
                        'template' => '{input}'
                    ])->textInput(['placeholder' => 'Nhập từ khóa...'])->label(false) ?>

                    <?php
                    $loca = \app\models\Locations::getLocations();
                    ?>
                    <?= $form->field($search, 'location', [
                        'template' => '{input}'
                    ])->dropDownList(\yii\helpers\ArrayHelper::map($loca, 'id', 'name'))->label(false) ?>

                    <?php
                    $data = \app\models\JobCategories::categoriesMenus();
                    ?>

                    <?= $form->field($search, 'categories', [
                        'template' => '{input}'
                    ])->dropDownList(\yii\helpers\ArrayHelper::map($data, 'id', 'name'))->label(false) ?>
					<input type="submit" class="btn" value="TÌM">


                    <?php $form = ActiveForm::end(); ?>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="content-area">
	<div class="container">
		<div class="row page-title text-center wow zoomInDown" data-wow-delay="1s">
			<h5>Our Process</h5>
			<h2>Cách làm việc của bạn ?</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae illum dolorem, rem officia, id explicabo
				sapiente</p>
		</div>
		<div class="row how-it-work text-center">
			<div class="col-md-4">
				<div class="single-work wow fadeInUp" data-wow-delay="0.8s">
					<img src="<?= Helper::homeUrl() ?>web/template/jobs/img/how-work1.png" alt="">
					<h3>Tìm kiếm công việc tốt nhất</h3>
					<p>Sử dụng các kết quả từ công việc, chúng tôi sẽ đưa ra một kế hoạch cho chiến lược tiếp thị hiệu
						quả nhất để có được kết quả tốt nhất.</p>
				</div>
			</div>
			<div class="col-md-4">
				<div class="single-work  wow fadeInUp" data-wow-delay="0.9s">
					<img src="<?= Helper::homeUrl() ?>web/template/jobs/img/how-work2.png" alt="">
					<h3>Searching for the best job</h3>
					<p>Using the outcomes from the job, we will put together a plan for the most effective marketing
						strategy to get the best results.</p>
				</div>
			</div>
			<div class="col-md-4">
				<div class="single-work wow fadeInUp" data-wow-delay="1s">
					<img src="<?= Helper::homeUrl() ?>web/template/jobs/img/how-work3.png" alt="">
					<h3>Searching for the best job</h3>
					<p>Using the outcomes from the job, we will put together a plan for the most effective marketing
						strategy to get the best results.</p>
				</div>
			</div>
		</div>
	</div>
	<hr>

	<div class="container">
		<div class="row job-posting wow fadeInUp" data-wow-delay="1s">
			<div role="tabpanel">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#job-seekers" aria-controls="home" role="tab"
					                                          data-toggle="tab">Người tìm việc</a></li>
					<li role="presentation"><a href="#employeers" aria-controls="profile" role="tab" data-toggle="tab">Nhà
							tuyển dụng</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane fade in active" id="job-seekers">
						<ul class="list-inline job-seeker">
							<li>
								<a href="">
									<img src="<?= Helper::homeUrl() ?>web/template/jobs/img/team-small-5.jpg" alt="">
									<div class="overlay"><h3>Ohidul Islam</h3>
										<p>Web Designer</p></div>
								</a>
							</li>
							<li>
								<a href="">
									<img src="<?= Helper::homeUrl() ?>web/template/jobs/img/team-small-6.jpg" alt="">
									<div class="overlay"><h3>Mohidul Islam</h3>
										<p>CEO</p></div>
								</a>
							</li>
							<li>
								<a href="">
									<img src="<?= Helper::homeUrl() ?>web/template/jobs/img/team-small-3.jpg" alt="">
									<div class="overlay"><h3>Unknown girl</h3>
										<p>Graphic Designer</p></div>
								</a>
							</li>
							<li>
								<a href="">
									<img src="<?= Helper::homeUrl() ?>web/template/jobs/img/team-small-4.jpg" alt="">
									<div class="overlay"><h3>Eftakher Alam</h3>
										<p>Graphic Designer</p></div>
								</a>
							</li>
							<li>
								<a href="">
									<img src="<?= Helper::homeUrl() ?>web/template/jobs/img/team-small-2.jpg" alt="">
									<div class="overlay"><h3>Mark Otto</h3>
										<p>Founder</p></div>
								</a>
							</li>
							<li>
								<a href="">
									<img src="<?= Helper::homeUrl() ?>web/template/jobs/img/team-small-1.jpg" alt="">
									<div class="overlay"><h3>Rasel Ahmed</h3>
										<p>Web Developer</p></div>
								</a>
							</li>
						</ul>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="employeers">
						<ul class="list-inline">
							<li>
								<a href="">
									<img src="<?= Helper::homeUrl() ?>web/template/jobs/img/employee4.png" alt="">
									<div class="overlay"><h3>Instagram</h3></div>
								</a>
							</li>
							<li>
								<a href="">
									<img src="<?= Helper::homeUrl() ?>web/template/jobs/img/employee5.png" alt="">
									<div class="overlay"><h3>Microsoft</h3></div>
								</a>
							</li>
							<li>
								<a href="">
									<img src="<?= Helper::homeUrl() ?>web/template/jobs/img/employee6.png" alt="">
									<div class="overlay"><h3>Dribbble</h3></div>
								</a>
							</li>
							<li>
								<a href="">
									<img src="<?= Helper::homeUrl() ?>web/template/jobs/img/employee1.png" alt="">
									<div class="overlay"><h3>Beats Music</h3></div>
								</a>
							</li>
							<li>
								<a href="">
									<img src="<?= Helper::homeUrl() ?>web/template/jobs/img/employee2.png" alt="">
									<div class="overlay"><h3>Facebook</h3></div>
								</a>
							</li>
							<li>
								<a href="">
									<img src="<?= Helper::homeUrl() ?>web/template/jobs/img/employee3.png" alt="">
									<div class="overlay"><h3>Twitter</h3></div>
								</a>
							</li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</div>
	<hr>

	<div class="container">
		<div class="row page-title text-center wow bounce" data-wow-delay="1s">
			<h5>Công việc mới nhất</h5>
			<h2><span>54716</span> công việc sẵn có cho bạn</h2>
		</div>
		<div class="row jobs">
			<div class="col-md-9">
				<div class="job-posts table-responsive">
					<table class="table">
						<tr class="odd wow fadeInUp" data-wow-delay="1s">
							<td class="tbl-logo"><img src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo1.png"
							                          alt=""></td>
							<td class="tbl-title"><h4>Web Designer <br><span class="job-type">full time</span></h4></td>
							<td><p>dribbble community</p></td>
							<td><p><i class="icon-location"></i>San Franciso, USA</p></td>
							<td><p>&dollar; 14000</p></td>
							<td class="tbl-apply"><a href="#">Apply now</a></td>
						</tr>
						<tr class="even wow fadeInUp" data-wow-delay="1.1s">
							<td class="tbl-logo"><img src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo2.png"
							                          alt=""></td>
							<td class="tbl-title"><h4>Front End Developer <br><span class="job-type">full time</span>
								</h4></td>
							<td><p>Jolil corporation</p></td>
							<td><p><i class="icon-location"></i>San Franciso, USA</p></td>
							<td><p>&dollar; 14000</p></td>
							<td class="tbl-apply"><a href="#">Apply now</a></td>
						</tr>
						<tr class="odd wow fadeInUp" data-wow-delay="1.2s">
							<td class="tbl-logo"><img src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo3.png"
							                          alt=""></td>
							<td class="tbl-title"><h4>HR Manager <br><span class="job-type">full time</span></h4></td>
							<td><p>Fanta bevarage</p></td>
							<td><p><i class="icon-location"></i>San Franciso, USA</p></td>
							<td><p>&dollar; 14000</p></td>
							<td class="tbl-apply"><a href="#">Apply now</a></td>
						</tr>
						<tr class="even wow fadeInUp" data-wow-delay="1.3s">
							<td class="tbl-logo"><img src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo4.png"
							                          alt=""></td>
							<td class="tbl-title"><h4>Internship Designer <br><span class="job-type">full time</span>
								</h4></td>
							<td><p>Google</p></td>
							<td><p><i class="icon-location"></i>San Franciso, USA</p></td>
							<td><p>&dollar; 14000</p></td>
							<td class="tbl-apply"><a href="#">Apply now</a></td>
						</tr>
						<tr class="odd wow fadeInUp" data-wow-delay="1.4s">
							<td class="tbl-logo"><img src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo5.png"
							                          alt=""></td>
							<td class="tbl-title"><h4>Software Designer <br><span class="job-type">full time</span></h4>
							</td>
							<td><p>Microsoft</p></td>
							<td><p><i class="icon-location"></i>San Franciso, USA</p></td>
							<td><p>&dollar; 14000</p></td>
							<td class="tbl-apply"><a href="#">Apply now</a></td>
						</tr>
						<tr class="even hide-jobs">
							<td class="tbl-logo"><img src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo4.png"
							                          alt=""></td>
							<td class="tbl-title"><h4>Internship Designer <br><span class="job-type">full time</span>
								</h4></td>
							<td><p>Google</p></td>
							<td><p><i class="icon-location"></i>San Franciso, USA</p></td>
							<td><p>&dollar; 14000</p></td>
							<td class="tbl-apply"><a href="#">Apply now</a></td>
						</tr>
						<tr class="odd hide-jobs">
							<td class="tbl-logo"><img src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo5.png"
							                          alt=""></td>
							<td class="tbl-title"><h4>Software Designer <br><span class="job-type">full time</span></h4>
							</td>
							<td><p>Microsoft</p></td>
							<td><p><i class="icon-location"></i>San Franciso, USA</p></td>
							<td><p>&dollar; 14000</p></td>
							<td class="tbl-apply"><a href="#">Apply now</a></td>
						</tr>
						<tr class="even hide-jobs">
							<td class="tbl-logo"><img src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo4.png"
							                          alt=""></td>
							<td class="tbl-title"><h4>Internship Designer <br><span class="job-type">full time</span>
								</h4></td>
							<td><p>Google</p></td>
							<td><p><i class="icon-location"></i>San Franciso, USA</p></td>
							<td><p>&dollar; 14000</p></td>
							<td class="tbl-apply"><a href="#">Apply now</a></td>
						</tr>
						<tr class="odd hide-jobs">
							<td class="tbl-logo"><img src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo5.png"
							                          alt=""></td>
							<td class="tbl-title"><h4>Software Designer <br><span class="job-type">full time</span></h4>
							</td>
							<td><p>Microsoft</p></td>
							<td><p><i class="icon-location"></i>San Franciso, USA</p></td>
							<td><p>&dollar; 14000</p></td>
							<td class="tbl-apply"><a href="#">Apply now</a></td>
						</tr>
					</table>
				</div>
				<div class="more-jobs">
					<a href=""> <i class="fa fa-refresh"></i>View more jobs</a>
				</div>
			</div>
			<div class="col-md-3 hidden-sm">
				<div class="job-add wow fadeInRight" data-wow-delay="1.5s">
					<h2>Seeking a job?</h2>
					<a href="#">Create a Account</a>
				</div>
			</div>
		</div>
	</div>
	<hr>

	<div class="container">
		<div class="row page-title text-center  wow bounce" data-wow-delay=".7s">
			<h5>TESTIMONIALS</h5>
			<h2>WHAT PEOPLES ARE SAYING</h2>
		</div>
		<div class="row testimonial">
			<div class="col-md-12">
				<div id="testimonial-slider">
					<div class="item">
						<div class="client-text">
							<p>Jobify offer an amazing service and I couldn’t be happier! They
								are dedicated to helping recruiters find great candidates, wonderful service!</p>
							<h4><strong>Ohidul Islam, </strong><i>Web Designer</i></h4>
						</div>
						<div class="client-face wow fadeInRight" data-wow-delay=".9s">
							<img src="<?= Helper::homeUrl() ?>web/template/jobs/img/client-face1.png" alt="">
						</div>
					</div>
					<div class="item">
						<div class="client-text">
							<p>Jobify offer an amazing service and I couldn’t be happier! They
								are dedicated to helping recruiters find great candidates, wonderful service!</p>
							<h4><strong>Ohidul Islam, </strong><i>Web Designer</i></h4>
						</div>
						<div class="client-face">
							<img src="<?= Helper::homeUrl() ?>web/template/jobs/img/client-face2.png" alt="">
						</div>
					</div>
					<div class="item">
						<div class="client-text">
							<p>Jobify offer an amazing service and I couldn’t be happier! They
								are dedicated to helping recruiters find great candidates, wonderful service!</p>
							<h4><strong>Ohidul Islam, </strong><i>Web Designer</i></h4>
						</div>
						<div class="client-face">
							<img src="<?= Helper::homeUrl() ?>web/template/jobs/img/client-face1.png" alt="">
						</div>
					</div>
					<div class="item">
						<div class="client-text">
							<p>Jobify offer an amazing service and I couldn’t be happier! They
								are dedicated to helping recruiters find great candidates, wonderful service!</p>
							<h4><strong>Ohidul Islam, </strong><i>Web Designer</i></h4>
						</div>
						<div class="client-face">
							<img src="<?= Helper::homeUrl() ?>web/template/jobs/img/client-face2.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
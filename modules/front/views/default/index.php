<?php
use app\library\helper\Helper;
use \yii\widgets\ActiveForm;

$page = \app\models\Pages::get();
/** @var $page \app\models\Pages title */
/** @var $this \yii\web\View title */
$this->title = Helper::titleSeo($page);
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
				<p>Đăng kí tìm việc và tạo công việc đơn giản. Nhận email phù hợp với mục đích đăng kí.</p>
				<div class="search-form wow pulse" data-wow-delay="0.8s">
                    <form id="top-search" class="form-inline" action="<?= Helper::createUrl(['site/search']) ?>" method="get">
                        <div class="form-group field-searchform-keywords">
                            <input type="text" name="keywords" id="searchform-keys" class="form-control"
                                   placeholder="Nhập từ khóa..." aria-invalid="false">
                        </div>

                        <div class="form-group field-searchform-jobs">
							<?php
							$data = \app\models\JobCategories::categoriesMenus();
							?>
                            <select class="job-select2 form-control" name="jobs">
                                <option value="0">-- Chọn --</option>
								<?php
								foreach ($data as $datum) {
									echo '<option value="' . $datum['id'] . '">' . $datum['name'] . '</option>';
								}
								?>
                            </select>
                        </div>

                        <div class="form-group field-searchform-loca">
							<?php
							$data = \app\models\Locations::getAll();
							?>
                            <select class="job-select2 form-control" name="loca">
                                <option value="0">-- Chọn --</option>
								<?php
								foreach ($data as $datum) {
									echo '<option value="' . $datum['id'] . '">' . $datum['name'] . '</option>';
								}
								?>
                            </select>
                        </div>

                        <input type="submit" class="btn search" value="TÌM">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="content-area">
	<div class="container">
		<div class="row page-title text-center wow zoomInDown" data-wow-delay="1s">
			<h5>Niềm vui của chúng tôi</h5>
			<h2>Là sự hài lòng của bạn</h2>
            <p> Nếu bạn muốn phát triển, hãy tìm kiếm một cơ hội thật tốt. Nếu bạn muốn có một công ty lớn, bạn hãy nghĩ đến những vấn đề mà bạn phải đối mặt trước khi nghĩ đến thành công – Jack Ma</p>
		</div>
		<div class="row how-it-work text-center">
			<div class="col-md-4">
				<div class="single-work wow fadeInUp" data-wow-delay="0.8s">
					<img src="<?= Helper::homeUrl() ?>web/template/jobs/img/how-work1.png" alt="">
					<h3>Hướng đến sự đơn giản</h3>
					<p>Trang web không đòi hỏi đăng kí phức tạp. Các tính năng rõ ràng thuận tiện thao tác cho cả những ai không nắm nhiều kiến thức về máy tính.</p>
				</div>
			</div>
			<div class="col-md-4">
				<div class="single-work  wow fadeInUp" data-wow-delay="0.9s">
					<img src="<?= Helper::homeUrl() ?>web/template/jobs/img/how-work2.png" alt="">
					<h3>Tạo sự thỏa mãn</h3>
					<p>Luôn chọn lọc công việc và ứng viên phù hợp nhất để gửi đến bạn. Không spam mail với những tin nhắn quảng cáo
					và những tin tức không liên quan.</p>
				</div>
			</div>
			<div class="col-md-4">
				<div class="single-work wow fadeInUp" data-wow-delay="1s">
					<img src="<?= Helper::homeUrl() ?>web/template/jobs/img/how-work3.png" alt="">
					<h3>Luôn luôn tức thời</h3>
					<p>Thông tin sẽ cập nhật tức thời khi có một công việc hoặc ứng viên phù hợp với nhu cầu của bạn. Bạn có thể trao đổi
					trực tuyến với đối tác khi họ online.</p>
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
                    <table class="table list-jobs">
                        <tr class="odd wow fadeInUp" data-wow-delay="1s">
                            <td class="tbl-logo">
                                <a href="#"><img src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo1.png"
                                                 alt=""></a>
                            </td>
                            <td class="tbl-title">
                                <h4><a href="#">Web Designer</a> <br><span class="job-type">full time</span></h4>
                            </td>
                            <td>
                                <p>dribbble community</p>
                            </td>
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
			<h5>Hãy nghe</h5>
			<h2>Người thành công</h2>
		</div>
		<div class="row testimonial">
			<div class="col-md-12">
				<div id="testimonial-slider">
					<div class="item">
						<div class="client-text">
							<p>"Công việc chiếm một phần lớn cuộc sống mỗi người và cách duy nhất để hài lòng
								là làm những gì mà mình nghĩ là to lớn. Và cách duy nhất để làm những công việc tuyệt vời
								đó là yêu những gì mình làm. Nếu bạn không tìm thấy lý tưởng này, hãy tiếp tục tìm kiếm,
								đừng nản lòng. Trái tim sẽ chỉ lối cho bạn và mọi chuyện sẽ tốt dần theo thời gian. Vì thế
								hãy quyết tâm đến cùng. Đừng bỏ cuộc.."</p>
							<h4><strong>Steve Jobs, </strong><i>CEO của Apple</i></h4>
						</div>
						<div class="client-face wow fadeInRight" data-wow-delay=".9s" style="top: 123px; right: 149px">
							<img src="<?= Helper::homeUrl() ?>web/template/jobs/img/client-face1.png" alt="">
						</div>
					</div>
					<div class="item">
						<div class="client-text">
							<p>"Điều quan trọng mà tôi sớm học được đó là bạn luôn phải đặt ra một mục tiêu cụ thể trong cuộc sống,
								cả ngắn hạn và dài hạn, cũng giống như bạn làm với công việc của mình vậy. Đặt ra những mục tiêu
								như thế giúp bạn có những kế hoạch rõ ràng để hoàn thành và thực hiện nó. Chúng tôi áp dụng điều này
								trong công việc, dù hiếm khi dùng chúng trong cuộc sống của mình."</p>
							<h4><strong>Denise Morrison, </strong><i>CEO của Campbell Soup</i></h4>
						</div>
						<div class="client-face" style="top: 123px; right: 149px">
							<img src="<?= Helper::homeUrl() ?>web/template/jobs/img/client-face2.png" alt="">
						</div>
					</div>
					<div class="item">
						<div class="client-text">
							<p>"Câu hỏi luôn xuất hiện trong đầu tôi mỗi ngày là: Liệu có phải tôi đang làm điều quan trọng nhất mà tôi
								có thể làm được? Trừ khi tôi cảm thấy tôi đang xử lý điều quan trọng nhất mà mình có thể giúp,
								còn lại tôi sẽ cảm thấy không thoải mái với cách mình sử dụng thời gian."</p>
							<h4><strong>Mark Zuckerberg, </strong><i>CEO của Facebook</i></h4>
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
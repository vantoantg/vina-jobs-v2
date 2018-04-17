<!--footer start from here-->
<footer>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-sm-6 footerleft ">
				<div class="logofooter">
                    <a href="<?= \app\library\helper\Helper::siteURL()?>"><img src="<?= \app\library\helper\Helper::homeUrl()?>web/template/jobs/img/logo-ft.png" alt="<?= Yii::$app->params['siteName'] ?>" class="wow pulse" style="max-height: 60px" data-wow-delay="1s"></a>
                </div>
				<p>Vina - Jobs được xây dựng dựa trên nhu cầu tìm kiếm việc làm của các bạn trẻ và nhu cầu tìm kiếm nguồn nhân lực của các công ty. Với mong muốn là cầu nối giữa các doanh nghiệp và nguồn lao động chúng tôi sẽ nỗ lực hết sức để làm hài lòng.</p>
				<p><i class="fa fa-map-pin"></i> 143/70 Gò Dầu, Phường Tân Quý, Quận Tân Phú, <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Hồ Chí Minh</p>
				<p><i class="fa fa-phone"></i> Hotline: 0932 252 414</p>
				<p><i class="fa fa-envelope"></i> E-mail: info@vina-jobs.com</p>

			</div>
			<div class="col-md-3 col-sm-6 paddingtop-bottom">
				<h6 class="heading7">BẠN MUỐN LÀM GÌ ?</h6>
				<ul class="footer-ul">
					<li><a href="#"> Đăng tin tìm việc</a></li>
					<li><a href="#"> Đăng tin tuyển dụng</a></li>
					<li><a href="#"> Tìm ứng viên tốt</a></li>
					<li><a href="#"> Tìm một công việc tốt</a></li>
					<li><a href="#"> Đăng ký thành thành viên</a></li>
					<li><a href="#"> Đóng góp ý kiến của bạn</a></li>
					<li><a href="#"> Xem các điều khoản của <?= Yii::$app->params['siteName']; ?></a></li>
				</ul>
			</div>
			<div class="col-md-3 col-sm-6 paddingtop-bottom">
				<h6 class="heading7">CÁC VIỆC LÀM MỚI</h6>
				<div class="post">
					<p>
                        <a href="<?= \app\library\helper\Helper::createUrl(['site/employeers/detail', 'id' => 1])?>" title="Click để xem tin: Tuyển lập trình backend - 3 năm kinh nghiệm">Tuyển lập trình backend - 3 năm kinh nghiệm</a><br>
                        <a href="#" title="Click để xem thông tin Công Ty LOCKON-VN">Công ty LOCKON VN</a>
                        <span>Hạn nộp HS: 01/06</span>
                    </p>
                    <p>
                        <a href="#" title="Click để xem tin: Tuyển lập trình backend - 3 năm kinh nghiệm">Tuyển lập trình backend - 3 năm kinh nghiệm</a><br>
                        <a href="#" title="Click để xem thông tin Công Ty LOCKON-VN">Công ty LOCKON VN</a>
                        <span>Hạn nộp HS: 01/06</span>
                    </p>
                    <p>
                        <a href="#" title="Click để xem tin: Tuyển lập trình backend - 3 năm kinh nghiệm">Tuyển lập trình backend - 3 năm kinh nghiệm</a><br>
                        <a href="#" title="Click để xem thông tin Công Ty LOCKON-VN">Công ty LOCKON VN</a>
                        <span>Hạn nộp HS: 01/06</span>
                    </p>
				</div>
			</div>
			<div class="col-md-2 col-sm-6 paddingtop-bottom">
				<div class="fb-page" data-href="https://www.facebook.com/facebook" data-tabs="timeline" data-height="300" data-small-header="false" style="margin-bottom:15px;" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true">
					<div class="fb-xfbml-parse-ignore">
						<blockquote cite="https://www.facebook.com/facebook">
                            <a href="https://www.facebook.com/facebook"><i class="fab fa-facebook"></i> Facebook</a>
                        </blockquote>
                        <blockquote cite="https://www.facebook.com/facebook">
                            <a href="https://www.facebook.com/facebook"><i class="fab fa-twitter-square"></i> Twitter</a>
                        </blockquote>
                        <blockquote cite="https://www.facebook.com/facebook">
                            <a href="https://www.facebook.com/facebook"><i class="fab fa-linkedin"></i> Linkedin</a>
                        </blockquote>
                        <blockquote cite="https://www.facebook.com/facebook">
                            <a href="https://www.facebook.com/facebook"><i class="fab fa-google-plus-square"></i> Google+</a>
                        </blockquote>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
<!--footer start from here-->

<div class="copyright">
	<div class="container">
		<div class="col-md-6">
			<p>© <?= Yii::$app->params['siteName']; ?> 2018, All rights reserved.</p>
		</div>
		<div class="col-md-6">
			<ul class="bottom_ul">
				<li><a href="<?= \app\library\helper\Helper::siteURL()?>"><?= \app\library\helper\Helper::siteURL()?></a></li>
				<li><a href="#">Giới thiệu</a></li>
				<li><a href="#">Blog</a></li>
				<li><a href="#">Hỏi - đáp</a></li>
				<li><a href="#">Liên hệ</a></li>
				<li><a href="#">Site Map</a></li>
			</ul>
		</div>
	</div>
</div>

<a href="#" id="back-to-top" title="Back to top">&uarr;</a>
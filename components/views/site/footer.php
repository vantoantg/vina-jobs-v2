<?php
use app\library\helper\Helper;

?>
<footer>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-sm-6 footerleft <?= Helper::wowClass(true) ?> fadeInLeft" data-wow-delay="0.4s">
				<div class="logofooter">
                    <a href="<?= Helper::siteURL()?>"><img src="<?= Helper::homeUrl()?>web/template/jobs/img/logo-ft.png" alt="<?= Yii::$app->params['siteName'] ?>" class="wow pulse" style="max-height: 60px" data-wow-delay="1s"></a>
                </div>
				<p><?= Helper::params(); ?> được xây dựng dựa trên nhu cầu tìm kiếm việc làm của các bạn trẻ và nhu cầu tìm kiếm nguồn nhân lực của các công ty. Với mong muốn là cầu nối giữa các doanh nghiệp và nguồn lao động chúng tôi sẽ nỗ lực hết sức để làm hài lòng.</p>
				<p><i class="fa fa-map-pin"></i> 143/70 Gò Dầu, Phường Tân Quý, Quận Tân Phú, <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Hồ Chí Minh</p>
				<p><i class="fa fa-phone"></i> Hotline: <?= Yii::$app->params['hotline'] ?></p>
				<p><i class="fa fa-envelope"></i> E-mail: <?= Yii::$app->params['mail']['options']['mailInfo']; ?></p>
			</div>
			<div class="col-md-3 col-sm-6 paddingtop-bottom <?= Helper::wowClass(true) ?> fadeInLeft" data-wow-delay="0.3s">
				<h6 class="heading7">BẠN MUỐN LÀM GÌ ?</h6>
				<ul class="footer-ul">
					<li><a href="#"> Đăng tin tìm việc</a></li>
					<?php if (\app\library\helper\Common::isLoginned()) {
    ?>
					<li><a href="<?= Helper::createUrl(['front/jobs/post-jobs']) ?>"> Đăng tin tuyển dụng</a></li>
                    <?php
} else {
        ?>
					<li><a href="#" data-toggle="modal" data-target="#login-modal"> Đăng tin tuyển dụng</a></li>
                    <?php
    } ?>
					<li><a href="<?= Helper::createUrl('site/job-seekers')?>"> Tìm ứng viên tốt</a></li>
					<li><a href="<?= Helper::createUrl('site/employeers')?>"> Tìm một công việc tốt</a></li>
                    <?php if (\app\library\helper\Common::isGuest()) {
        ?>
					<li><a href="#" data-toggle="modal" data-target="#register-modal"> Đăng ký thành thành viên</a></li>
                    <?php
    } ?>
					<li><a href="<?= Helper::createUrl(['site/contact'])?>"> Đóng góp ý kiến của bạn</a></li>
					<li><a href="<?= Helper::createUrl(['site/policy'])?>"> Xem các điều khoản của <?= Yii::$app->params['siteName']; ?></a></li>
				</ul>
			</div>
			<div class="col-md-3 col-sm-6 paddingtop-bottom <?= Helper::wowClass(true) ?> fadeInRight" data-wow-delay="0.3s">
				<h6 class="heading7">CÁC VIỆC LÀM MỚI</h6>
				<div class="post">
                    <?php
                   if ($data) {
                       foreach ($data as $item) {
                           ?>
                           <p>
                               <a href="<?= $item['url_view']; ?>" title="Click để xem tin: <?= $item['job_name']; ?>"><?= $item['job_name']; ?></a><br>
                               <a href="<?= $item['url_company_detail']; ?>" title="Click để xem thông tin <?= $item['com_name']; ?>"><?= $item['com_name']; ?></a>
                               <span>Hạn nộp HS: <?= $item['cv_end_date']; ?></span>
                           </p>
                       <?php
                       }
                   }
                    ?>
				</div>
			</div>
			<div class="col-md-2 col-sm-6 paddingtop-bottom <?= Helper::wowClass(true) ?> fadeInRight" data-wow-delay="0.4s">
				<h6 class="heading7">MẠNG XÃ HỘI</h6>
				<div class="social-page" data-href="https://www.facebook.com" data-tabs="timeline" data-height="300" data-small-header="false" style="margin-bottom:15px;" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true">
					<div class="fb-xfbml-parse-ignore">
						<blockquote cite="https://www.facebook.com">
                            <a href="https://www.facebook.com"><i class="fab fa-facebook"></i> Facebook</a>
                        </blockquote>
                        <blockquote cite="https://www.facebook.com">
                            <a href="https://www.facebook.com"><i class="fab fa-twitter-square"></i> Twitter</a>
                        </blockquote>
                        <blockquote cite="https://www.facebook.com">
                            <a href="https://www.facebook.com"><i class="fab fa-linkedin"></i> Linkedin</a>
                        </blockquote>
                        <blockquote cite="https://www.facebook.com">
                            <a href="https://www.facebook.com"><i class="fab fa-google-plus-square"></i> Google+</a>
                        </blockquote>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
<!--footer start from here-->

<div class="copyright ovf-y-h">
	<div class="container <?= Helper::wowClass(true) ?> fadeInUp" data-wow-delay="0.1s">
		<div class="row">
			<div class="col-md-6">
				<p>© <?= Yii::$app->params['siteName']; ?> 2018, All rights reserved.</p>
			</div>
			<div class="col-md-6">
				<ul class="bottom_ul">
					<li><a href="<?= Helper::siteURL()?>"><?= Helper::params() ?></a></li>
					<li><a href="<?= Helper::createUrl(['site/blog']) ?>">Blog</a></li>
					<li><a href="#">Q&A</a></li>
					<li><a href="<?= Helper::createUrl(['site/contact']) ?>">Contact</a></li>
					<li><a href="<?= Helper::siteURL()?>/sitemap.xml" target="_blankQ&A">Site Map</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

<a href="#" id="back-to-top" title="Back to top">&uarr;</a>
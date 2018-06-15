<?php

use app\library\helper\Helper;

/* @var $this yii\web\View */
/* @var $model app\models\Users */
/* @var $page app\models\Pages */
$page = \app\models\Pages::get('user-dang-ky-thanh-cong');

$this->title = Helper::titleSeo($page);
Helper::generateSeo($page);
$this->params['breadcrumbs'][] = ['label' => 'Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\app\components\Menu\ActiveMenu::is('job-seekers');
?>
<div class="container">
	<div class="col-12 col-sm-8">
        <div class="users-create">
            <h1 class="text-center">ĐĂNG KÝ ỨNG VIÊN</h1>
        </div>
		<div class="row main">
			<div class="main-login main-center">
                <div class="content-page">
                    <div class="alert-message alert-message-info <?= Helper::wowClass(); ?> zoomInDown animated"
                         data-wow-delay="0.2s">
                        <h4>Đăng ký ứng viên thành công</h4>
                        <p>Lưu ý: Bạn vui lòng cập nhật đúng địa chỉ email, số điện thoại và các thông tin hệ thống sẽ gửi thông báo tuyển dụng vào <strong>email của bạn đăng ký</strong>.</p>
                    </div>
                </div>
                <div class="col-xs-12 text-center">
                    <button class="navbar-btn nav-button <?= Helper::wowClass(); ?> bounceInRight login animated" data-toggle="modal" data-target="#login-modal" data-wow-delay="0.8s" style="visibility: visible; animation-delay: 0.8s; animation-name: bounceInRight;"><i class="fas fa-sign-in-alt"></i> Đăng nhập
                    </button>
                    <br>
                </div>

                <div class="clearfix"></div>
                <div class="<?= Helper::wowClass(); ?> zoomInDown animated" data-wow-delay="0.5s">
					<?= $page->content; ?>
                </div>
			</div>
		</div>
	</div>

	<div class="col-12 col-sm-4 wrapper-sb">
		<div class="widget-sidebar">
			<h2 class="title-widget-sidebar">RECENT JOBS</h2>
			<div class="content-widget-sidebar">
				<ul>
					<li class="recent-post">
						<div class="post-img">
							<img src="https://lh3.googleusercontent.com/-ndZJOGgvYQ4/WM1ZI8dH86I/AAAAAAAADeo/l67ZqZnRUO8QXIQi38bEXuxqHfVX0TV2gCJoC/w424-h318-n-rw/thumbnail8.jpg"
							     class="img-responsive">
						</div>
						<a href="#"><h5>Excepteur sint occaecat cupi non proident laborum.</h5></a>
						<p>
							<small><i class="fa fa-calendar" data-original-title="" title=""></i> 30 Juni 2014</small>
						</p>
					</li>
					<hr>

					<li class="recent-post">
						<div class="post-img">
							<img src="https://lh3.googleusercontent.com/-ojLI116-Mxk/WM1ZIwdnuwI/AAAAAAAADeo/4K6VpwIPSfgsmlXJB5o0N8scuI3iW4OpwCJoC/w424-h318-n-rw/thumbnail6.jpg"
							     class="img-responsive">
						</div>
						<a href="#"><h5>Excepteur sint occaecat cupi non proident laborum.</h5></a>
						<p>
							<small><i class="fa fa-calendar" data-original-title="" title=""></i> 30 Juni 2014</small>
						</p>
					</li>
					<hr>

					<li class="recent-post">
						<div class="post-img">
							<img src="https://lh3.googleusercontent.com/-TrK1csbtHRs/WM1ZI1SIUNI/AAAAAAAADeo/OkiUjuad6skWl9ugxbiIA_436OwsWKBNgCJoC/w424-h318-n-rw/thumbnail3.jpg"
							     class="img-responsive">
						</div>
						<a href="#"><h5>Excepteur sint occaecat cupi non proident laborum.</h5></a>
						<p>
							<small><i class="fa fa-calendar" data-original-title="" title=""></i> 30 Juni 2014</small>
						</p>
					</li>
					<hr>

					<li class="recent-post">
						<div class="post-img">
							<img src="https://lh3.googleusercontent.com/-UKfIhJSBW9M/WM1ZI8ou34I/AAAAAAAADeo/vlLGY29147AYLaxUW29ZXJlun115BhkhgCJoC/w424-h318-n-rw/thumbnail7.jpg"
							     class="img-responsive">
						</div>
						<a href="#"><h5>Excepteur sint occaecat cupi non proident laborum.</h5></a>
						<p>
							<small><i class="fa fa-calendar" data-original-title="" title=""></i> 30 Juni 2014</small>
						</p>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
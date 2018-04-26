<?php

use yii\helpers\Html;
use \yii\widgets\ActiveForm;
use \app\models\Dropdown;
use app\library\helper\Helper;


/* @var $this yii\web\View */
/* @var $model app\models\Users */
/* @var $page app\models\Pages */
$page = \app\models\Pages::get('user-dang-ky-thanh-cong');

$this->title = Helper::titleSeo($page);
Helper::generateSeo($page);
$this->params['breadcrumbs'][] = ['label' => 'Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container">
	<div class="users-create">
		<h1><?= Html::encode($this->title) ?></h1>
	</div>
</div>

<div class="container">
	<div class="col-12 col-sm-8">
		<div class="row main">
			<div class="main-login main-center">
                <div class="content-page">
                    <div class="alert-message alert-message-info <?= Helper::wowClass() ?> zoomInDown animated" data-wow-delay="0.2s">
                        <h4>Cập nhật thành công:</h4>
                        <?= $page->content; ?>
                    </div>
                </div>
                <div class="col-xs-12 text-center">
                    <a role="menuitem" tabindex="-1" href="<?= Helper::createUrl(['front/user/update-candidate']) ?>"><i class="far fa-edit"></i> Tiếp tục cập nhật thông tin</a></li>
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
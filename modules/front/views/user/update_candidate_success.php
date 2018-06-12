<?php

use app\library\helper\Helper;

/* @var $this yii\web\View */
/* @var $model app\models\Users */
/* @var $page app\models\Pages */
$page = \app\models\Pages::get('user-cap-nhat-thanh-cong');

$this->title = Helper::titleSeo($page);
Helper::generateSeo($page);
$this->params['breadcrumbs'][] = ['label' => 'Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\app\components\Menu\ActiveMenu::is('job-seekers');
?>

<div class="container">
    <div class="col-12 col-sm-8">
        <div class="users-create">
            <h1 class="text-center">CẬP NHẬT THÔNG TIN</h1>
        </div>

        <div class="row main">
            <div class="main-login main-center">
                <div class="content-page">
                    <div class="alert-message alert-message-info <?= Helper::wowClass(); ?> zoomInDown animated"
                         data-wow-delay="0.2s">
                        <h4>Cập nhật thành công:</h4>
                        <p>Vui lòng cập nhật đúng địa chỉ email, số điện thoại và các thông tin hệ thống sẽ gửi thông báo tuyển dụng vào <strong>email của bạn đăng ký</strong>.</p>
                    </div>

                    <div class="col-xs-12 text-center <?= Helper::wowClass(); ?> zoomInDown animated"
                         data-wow-delay="0.3s">
                        <a role="menuitem" tabindex="-1"
                           href="<?= Helper::createUrl(['front/user/update-candidate']); ?>"><i class="far fa-edit"></i>
                            Tiếp tục cập nhật thông tin</a>
                    </div>
                    <div class="clearfix"></div>
                    <div class="<?= Helper::wowClass(); ?> zoomInDown animated" data-wow-delay="0.5s">
						<?= $page->content; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-12 col-sm-4 wrapper-sb">
		<?= (new \app\components\SidebarWidget())->recentJobs(); ?>
    </div>
</div>
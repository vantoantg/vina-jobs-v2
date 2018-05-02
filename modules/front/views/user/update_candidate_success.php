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
                    <div class="alert-message alert-message-info <?= Helper::wowClass() ?> zoomInDown animated"
                         data-wow-delay="0.2s">
                        <h4>Cập nhật thành công:</h4>
                        <p>Vui lòng điền đúng địa chỉ email, hệ thống sẽ gửi link kích hoạt tài khoản hoặc thông báo
                            tuyển dụng vào <strong>email của bạn đăng ký</strong>.</p>
                    </div>

                    <div class="col-xs-12 text-center <?= Helper::wowClass() ?> zoomInDown animated"
                         data-wow-delay="0.3s">
                        <a role="menuitem" tabindex="-1"
                           href="<?= Helper::createUrl(['front/user/update-candidate']) ?>"><i class="far fa-edit"></i>
                            Tiếp tục cập nhật thông tin</a>
                    </div>
                    <div class="clearfix"></div>
                    <div class="<?= Helper::wowClass() ?> zoomInDown animated" data-wow-delay="0.5s">
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
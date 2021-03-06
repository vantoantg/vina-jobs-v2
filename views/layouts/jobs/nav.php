<?php
use app\library\helper\Helper;

?>
<div class="button navbar-right">
    <?php
    if (\app\library\helper\Common::isLoginned()) {
        ?>
		<div class="dropdown">
			<button class="navbar-btn nav-button login dropdown-toggle" type="button"
			        id="dropdownMenuButton" data-wow-delay="0.8s" data-toggle="dropdown"
			        aria-haspopup="true" aria-expanded="false">
                <?= \app\library\helper\Common::currentUser('name'); ?> <span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu"
			    aria-labelledby="menu1">
                <?php if (\app\library\helper\Common::currentUser('type') == \app\models\Users::USER_TYPE_CONTACT_OF_COMPANY) {
            ?>
                    <li role="presentation"><a
                                href="<?= Helper::getInstance()->createUrl(['front/user/client-profile']); ?>"><i class="far fa-user"></i> Trang cá nhân</a></li>
					<li role="presentation">
						<a role="menuitem" tabindex="-1"
						   href="<?= Helper::getInstance()->createUrl(['front/jobs/post-jobs']); ?>"><i class="fas fa-plus"></i> Đăng tin tuyển dụng</a>
					</li>
	                <li role="presentation">
		                <a role="menuitem" tabindex="-1"
		                   href="<?= Helper::getInstance()->createUrl(['front/user/profile-change-password']); ?>"><i class="fas fa-unlock-alt"></i> Thay đổi mật khẩu</a></li>
	                <li role="presentation">
		                <a role="menuitem" tabindex="-1" href="<?= Helper::getInstance()->createUrl(['front/user/update-company']); ?>"><i class="far fa-edit"></i> Cập nhật thông tin</a></li>
                <?php
        } else {
            ?>
                    <li role="presentation"><a href="<?= Helper::getInstance()->createUrl(['front/user/user-profile']); ?>"><i class="far fa-user"></i> Trang cá nhân</a></li>
					<li role="presentation">
						<a role="menuitem" tabindex="-1"
						   href="<?= Helper::getInstance()->createUrl(['front/user/update-candidate']); ?>"><i class="far fa-edit"></i> Cập nhật hồ sơ</a>
					</li>
	                <li role="presentation">
		                <a role="menuitem" tabindex="-1"
		                   href="<?= Helper::getInstance()->createUrl(['front/user/profile-change-password']); ?>"><i class="fas fa-unlock-alt"></i> Thay đổi mật khẩu</a></li>
                <?php
        } ?>

				<li role="presentation" class="divider"></li>
				<li role="presentation"><a href="<?= Helper::getInstance()->createUrl(['front/user/logout']); ?>?r=<?= Helper::getInstance()->encrypt(Yii::$app->request->getUrl()); ?>"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
				</li>
			</ul>
		</div>

    <?php
    } else {
        ?>
		<button class="navbar-btn nav-button" data-toggle="modal"
		        data-target="#register-modal"><i class="fas fa-plus"></i> Đăng ký
		</button>
		<button class="navbar-btn nav-button login" data-toggle="modal"
		        data-target="#login-modal"><i class="fas fa-sign-in-alt"></i> Đăng nhập
		</button>
    <?php
    } ?>
</div>
<ul class="main-nav nav navbar-nav navbar-right">
	<li>
		<a id="m-index" class="<?= Helper::getInstance()->active('front/default/index'); ?>"
		   href="<?= Helper::getInstance()->createUrl(['front/default/index']); ?>">Trang chủ</a></li>
    <li>
        <a id="m-employeers" class="<?= Helper::getInstance()->active('site/employeers'); ?>"
           href="<?= Helper::getInstance()->createUrl(['site/search']); ?>?keywords=&mode=search-jobs">Tin tuyển dụng</a></li>
	<li>
		<a id="m-job-seekers" class="<?= Helper::getInstance()->active('site/policy'); ?>"
		   href="<?= Helper::getInstance()->createUrl(['site/policy']); ?>">Chính sách</a></li>
	<!--<li>
		<a id="m-job-seekers" class="<?/*= Helper::getInstance()->active('site/job-seekers'); */?>"
		   href="<?/*= Helper::getInstance()->createUrl(['site/job-seekers']); */?>">Người tìm việc</a></li>-->
	<!--<li>
		<a id="m-about-us" class="<?/*= Helper::getInstance()->active('site/about-us') */?>"
		   href="<?/*= Helper::getInstance()->createUrl(['site/about-us']) */?>">Giới thiệu</a></li>-->
	<li>
		<a id="m-blogs" class="<?= Helper::getInstance()->active('site/blog'); ?>"
		   href="<?= Helper::getInstance()->createUrl(['site/blog']); ?>">Blog</a>
	</li>
	<li>
		<a id="m-contact" class="<?= Helper::getInstance()->active('site/contact'); ?>"
		   href="<?= Helper::getInstance()->createUrl(['site/contact']); ?>">Liên hệ</a>
	</li>
</ul>
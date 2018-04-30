<?php

/* @var $this yii\web\View */

use yii\helpers\Html;
use \yii\widgets\Breadcrumbs;
$page = \app\models\Pages::get('blog');

/** @var var $sidebarWidget SidebarWidget $sidebarWidget */
$sidebarWidget = new app\components\SidebarWidget();

$this->title = 'Blog';
$this->params['breadcrumbs'][] = $this->title;
?>

<section id="blog-section">
    <div class="container">
	    <?=
	    Breadcrumbs::widget([
		    'homeLink' => [
			    'label' => 'Trang chủ',
			    'url' => Yii::$app->homeUrl,
		    ],
		    'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
	    ])
	    ?>
        <div class="row">
            <div class="col-12 col-md-8">
                <div class="row list">
					<?php
                    $i = 0;
					foreach ($blogs as $k => $blog) {
					    $i++;
						?>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6 <?= \app\library\helper\Helper::wowClass() ?> fadeInUp"
                             data-wow-delay="0.<?= $i ?>s">
                            <aside>
                                <img src="<?= \app\library\helper\Helper::imgRender($blog->img, 230,200) ?>"
                                     class="img-responsive">
                                <div class="content-title">
                                    <div class="text-center">
                                        <h3><a href="<?= \app\library\helper\Helper::createUrl(['site/blog-detail', 'slug' => $blog->slug, 'id' => $blog->id ])?>"><?= $blog->name ?></a></h3>
                                    </div>
                                </div>
                                <div class="content-footer">
                                    <img class="user-small-img"
                                         src="https://lh3.googleusercontent.com/-uwagl9sPHag/WM7WQa00ynI/AAAAAAAADtA/hio87ZnTpakcchDXNrKc_wlkHEcpH6vMwCJoC/w140-h148-p-rw/profile-pic.jpg">
                                    <span>Sumit Kumar Kumar</span>
                                    <span class="pull-right">
				<a href="#" data-toggle="tooltip" data-placement="left" title="Comments"><i class="fa fa-comments"></i> 30</a>
				<a href="#" data-toggle="tooltip" data-placement="right" title="Thích"><i
                            class="fa fa-heart"></i> 20</a>
				</span>
                                    <div class="user-ditels">
                                        <div class="user-img"><img
                                                    src="https://lh3.googleusercontent.com/-uwagl9sPHag/WM7WQa00ynI/AAAAAAAADtA/hio87ZnTpakcchDXNrKc_wlkHEcpH6vMwCJoC/w140-h148-p-rw/profile-pic.jpg"
                                                    class="img-responsive"></div>
                                        <span class="user-full-ditels">
                        <h3>Sumit Kumar</h3>
                        <p>Web & Graphics Disigner</p>
                        </span>
                                        <div class="social-icon">
                                            <a href="#"><i class="fab fa-facebook-f" data-toggle="tooltip"
                                                           data-placement="bottom" title="Facebook"></i></a>
                                            <a href="#"><i class="fab fa-twitter" data-toggle="tooltip"
                                                           data-placement="bottom" title="Twitter"></i></a>
                                            <a href="#"><i class="fab fa-google-plus" data-toggle="tooltip"
                                                           data-placement="bottom" title="Google Plus"></i></a>
                                            <a href="#"><i class="fab fa-youtube" data-toggle="tooltip"
                                                           data-placement="bottom" title="Youtube"></i></a>
                                            <a href="#"><i class="fab fa-github" data-toggle="tooltip"
                                                           data-placement="bottom" title="Github"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </aside>
                        </div>
					<?php } ?>
                </div>
            </div>
            <!--           // RECENT POST===========-->
            <div class="col-12 col-md-4 wrapper-sb">
				<?= $sidebarWidget->recentJobs(); ?>

				<?= $sidebarWidget->archives(); ?>

                <!--=====================
					   CATEGORIES
				  ======================-->
				<?= $sidebarWidget->categories(); ?>


                <!--=====================
					  NEWSLATTER
			   ======================-->
				<?= $sidebarWidget->newsLatter(); ?>
            </div>
        </div>
    </div>

</section>

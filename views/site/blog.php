<?php

/* @var $this yii\web\View */

use app\library\helper\Helper;
use yii\widgets\Breadcrumbs;

$page = \app\models\Pages::get('blog');

/** @var var $sidebarWidget SidebarWidget $sidebarWidget */
$sidebarWidget = new app\components\SidebarWidget();

$this->title = 'Blogs';
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
        ]);
        ?>

	    <div class="col-12 col-md-8 pd-lr-0">
		    <div class="row list">
                <?php
                $i = 0;
                //                    Helper::imgRender($blogs[0]->img, 230,200);
                //                    die;
                foreach ($blogs as $k => $blog) {
                    $i++; ?>
				    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6 <?= Helper::wowClass(); ?> fadeInUp"
				         data-wow-delay="0.<?= $i; ?>s">
					    <aside>
						    <img src="<?= Helper::imgRender($blog->img, 230, 200); ?>"
						         class="img-responsive">
						    <div class="content-title">
							    <div class="text-center">
								    <h3><a href="<?= Helper::createUrl(['site/blog-detail', 'slug' => $blog->slug, 'id' => $blog->id]); ?>"><?= $blog->name; ?></a></h3>
							    </div>
						    </div>
						    <div class="content-footer">
							    <img class="user-small-img"
							         src="<?= Helper::imgRender(null, 33, 33); ?>">
							    <span>Sumit Kumar Kumar</span>
							    <span class="pull-right">
									<a href="#" data-toggle="tooltip" data-placement="top" title="Comments"><i class="fa fa-comments"></i> 30</a>
									<a href="#" data-toggle="tooltip" data-placement="top" title="Thích"><i class="fa fa-heart"></i> 20</a>
									</span>
						    </div>
					    </aside>
				    </div>
                <?php
                } ?>
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
</section>

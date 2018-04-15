<?php

/* @var $this yii\web\View */

use yii\helpers\Html;
/** @var var $sidebarWidget SidebarWidget $sidebarWidget */
$sidebarWidget = new app\components\SidebarWidget();

$this->title = 'Blog';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container">
    <section id="blog-section" >
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-8">
                    <div class="row">
                        <?php
                        for ($i=1; $i<=10; $i++){
                        ?>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <aside>
                                <img src="https://lh3.googleusercontent.com/-ndZJOGgvYQ4/WM1ZI8dH86I/AAAAAAAADeo/l67ZqZnRUO8QXIQi38bEXuxqHfVX0TV2gCJoC/w424-h318-n-rw/thumbnail8.jpg" class="img-responsive">
                                <div class="content-title">
                                    <div class="text-center">
                                        <h3><a href="#">Niki Postingan Sing Kepisan Njeh, Perdana Ngoten</a></h3>
                                    </div>
                                </div>
                                <div class="content-footer">
                                    <img class="user-small-img" src="https://lh3.googleusercontent.com/-uwagl9sPHag/WM7WQa00ynI/AAAAAAAADtA/hio87ZnTpakcchDXNrKc_wlkHEcpH6vMwCJoC/w140-h148-p-rw/profile-pic.jpg">
                                    <span>Sumit Kumar Kumar</span>
                                    <span class="pull-right">
				<a href="#" data-toggle="tooltip" data-placement="left" title="Comments"><i class="fa fa-comments" ></i> 30</a>
				<a href="#" data-toggle="tooltip" data-placement="right" title="Loved"><i class="fa fa-heart"></i> 20</a>
				</span>
                                    <div class="user-ditels">
                                        <div class="user-img"><img src="https://lh3.googleusercontent.com/-uwagl9sPHag/WM7WQa00ynI/AAAAAAAADtA/hio87ZnTpakcchDXNrKc_wlkHEcpH6vMwCJoC/w140-h148-p-rw/profile-pic.jpg" class="img-responsive"></div>
                                        <span class="user-full-ditels">
                        <h3>Sumit Kumar</h3>
                        <p>Web & Graphics Disigner</p>
                        </span>
                                        <div class="social-icon">
                                            <a href="#"><i class="fa fa-facebook" data-toggle="tooltip" data-placement="bottom" title="Facebook"></i></a>
                                            <a href="#"><i class="fa fa-twitter" data-toggle="tooltip" data-placement="bottom" title="Twitter"></i></a>
                                            <a href="#"><i class="fa fa-google-plus" data-toggle="tooltip" data-placement="bottom" title="Google Plus"></i></a>
                                            <a href="#"><i class="fa fa-youtube" data-toggle="tooltip" data-placement="bottom" title="Youtube"></i></a>
                                            <a href="#"><i class="fa fa-github" data-toggle="tooltip" data-placement="bottom" title="Github"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </aside>
                        </div>
                        <?php } ?>
                    </div>
                </div>

                <!--           // RECENT POST===========-->
                <div class="col-12 col-md-4">
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
</div>

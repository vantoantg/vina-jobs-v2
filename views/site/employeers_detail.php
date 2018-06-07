<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */

/* @var $model app\models\Job */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use app\library\helper\Helper;
use \app\library\helper\Common;

$this->title = $job['title'];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="container">
    <div class="col-12 col-sm-8">
        <div class="employeers-detail <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="0.1s">

            <div class="row content">
	            <?php if($galleries){ ?>
                <div class="gallery col-xs-12">
                    <div class="row">
	                    <?php foreach ($galleries as $k => $gallery){ ?>
                            <div class="col-xs-4 item">
                                <a href="#" data-num="<?=$k?>" data-toggle="modal" data-target="#viewGallery">
                                    <img src="<?= $gallery['thum'] ?>" class="img-thumbnail" alt="Los Angeles">
                                </a>
                            </div>
	                    <?php } ?>
                    </div>
                </div>
                <?php } ?>
                <h1><?= Html::encode($this->title) ?></h1>
				<?= $job['content']; ?>
            </div>

            <div class="row ft-jobs-detail" data-href="<?= Helper::createUrl([
				'front/jobs/favorite',
				'slug' => $job['slug'],
				'id' => $job['id']
			]) ?>">
				<?php if (Common::isLoginned()) { ?>
					<?php if (Common::currentUsers()->type != \app\models\Users::USER_TYPE_CONTACT_OF_COMPANY) { ?>
                        <div class="well text-center">
                            <button type="button" data-action="favorite"
                                    class="btn btn-sunny text-uppercase btn-lg save-jobs <?php if ($job['saved']) {
								        echo '_saved';
							        } ?>"><i class="fas fa-check"></i><i class="far fa-save"></i>
                                <span><?php if ($job['saved']) {
										echo 'Tin đã lưu';
									} else {
										echo 'Lưu tin này';
									} ?></span>
                            </button>
							<?php if ($job['applied']) { ?>
                                <button type="button" data-action="apply" class="btn btn-sky text-uppercase btn-lg"><i
                                            class="fas fa-check"></i> Đã gửi hồ sơ
                                </button>
							<?php } else { ?>
                                <button type="button" data-action="apply"
                                        class="btn btn-sunny text-uppercase btn-lg apply-job"
                                        data-toggle="modal"
                                        data-target="#apply-modal"
                                        data-href="<?= Helper::createUrl(['front/jobs/preapply']); ?>">
                                    <i class="fas fa-location-arrow"></i> Gửi hồ sơ
                                </button>
							<?php } ?>
                        </div>
					<?php } ?>
				<?php } else { ?>
                    <div class="well text-center">
                        <button type="button" data-action="favorite"
                                class="btn btn-sunny text-uppercase btn-lg" <?= Helper::checkLogin() ?>><i
                                    class="far fa-save"></i> Lưu tin này
                        </button>
                        <button type="button" data-action="apply" class="btn btn-sunny text-uppercase btn-lg"
							<?= Helper::checkLogin() ?>><i class="fas fa-location-arrow"></i> Apply
                        </button>
                    </div>
				<?php } ?>
            </div>
        </div>
    </div>
    <div id="sidebarfx" data-follow-scroll='.employeers-detail' class="col-12 col-sm-4">
		<?= (new \app\components\SidebarWidget())->recentCompanyInfo($job['company_id']); ?>
    </div>
</div>

<?= (new \app\components\JobsWidget())->applyPopup(); ?>

<?php if($galleries){ ?>
<!-- Modal -->
<div id="viewGallery" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <div class="modal-body">
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
	                    <?php foreach ($galleries as $k => $gallery){ ?>
                        <li data-target="#myCarousel" data-slide-to="<?= $k ?>" class="<?php if ($k == 0){ echo 'active'; } ?>"></li>
	                    <?php } ?>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <?php foreach ($galleries as $k => $gallery){ ?>
                        <div data-num="<?=$k?>" class="item <?php if ($k == 0){ echo 'active'; } ?>">
                            <img src="<?= $gallery['view'] ?>" alt="Los Angeles">
                        </div>
                        <?php } ?>
                    </div>

                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<?php } ?>
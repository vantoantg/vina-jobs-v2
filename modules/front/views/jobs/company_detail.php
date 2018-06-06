<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */

/* @var $model app\models\Job */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use app\library\helper\Helper;
use \app\library\helper\Common;

$this->title = $company['name'];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="container">
    <div class="col-12 col-sm-8">
        <div class="employeers-detail <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="0.1s">

            <div class="row">
                <h1 class="text-center"><?= Html::encode($this->title) ?></h1>
            </div>
            <div class="row content">
	            <?php if($galleries){ ?>
                <div class="gallery col-xs-12">
                    <div class="row">
	                    <?php foreach ($galleries as $k => $gallery){ ?>
                            <div class="col-xs-4 item">
                                <a href="#" data-toggle="modal" data-target="#viewGallery">
                                    <img src="<?= $gallery['thum'] ?>" class="img-thumbnail" alt="Los Angeles">
                                </a>
                            </div>
	                    <?php } ?>
                    </div>
                </div>
                <div class="clearfix"></div>
                <?php } ?>
				<?= $company['content']; ?>
            </div>
        </div>
        <div>
            //TODO: Tin of company
        </div>
    </div>
    <div id="sidebarfx" data-follow-scroll='.employeers-detail' class="col-12 col-sm-4">
		<?= (new \app\components\SidebarWidget())->recentCompanyInfo(); ?>
    </div>
</div>

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
                        <div class="item <?php if ($k == 0){ echo 'active'; } ?>">
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
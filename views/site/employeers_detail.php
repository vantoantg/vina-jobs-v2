<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */

/* @var $model app\models\Job */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;

$this->title = $model->title;
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="container">
    <div class="col-12 col-sm-8">
        <div class="employeers-detail wow fadeInUp" data-wow-delay="0.1s">

            <div class="row content">
                <h1><?= Html::encode($this->title) ?></h1>
				<?= $model->content; ?>
            </div>
            <div class="row ft-jobs-detail">
                <div class="well text-center">
                    <button type="button" class="btn btn-sunny text-uppercase btn-lg"><i class="far fa-save"></i> Lưu tin</button>
                    <button type="button" class="btn btn-sky text-uppercase btn-lg"><i class="fas fa-location-arrow"></i> Apply</button>
                </div>
            </div>
        </div>
    </div>
    <div id="sidebarfx" data-follow-scroll='.employeers-detail' class="col-12 col-sm-4">
		<?= (new \app\components\SidebarWidget())->recentCompanyInfo(); ?>
    </div>
</div>
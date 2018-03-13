<?php

/* @var $this yii\web\View */

use yii\helpers\Html;

/** @var $page \app\models\Pages $page */
$page = \app\models\Pages::get('policy');

$this->title = $page->seo_title;
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container">
    <div class="col-12 col-sm-8">
        <h1>&nbsp;</h1>
        <div class="content-page">
            <?= $page->content?>
        </div>
    </div>
    <div class="col-12 col-sm-4">
        <?= (new \app\components\SidebarWidget())->recentJobs(); ?>
    </div>
</div>
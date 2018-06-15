<?php

/* @var $this yii\web\View */

/** @var $page \app\models\Pages $page */
$page = \app\models\Pages::get('policy');

$this->title = \app\library\helper\Helper::titleSeo($page);
$this->params['breadcrumbs'][] = $this->title;
\app\library\helper\Helper::generateSeo($page);
?>
<div class="container">
    <div class="col-12 col-sm-8">
        <h1 class="text-center">CÁC QUY ĐỊNH TẠI JOBS VINA</h1>
        <div class="content-page">
            <?= $page->content; ?>
        </div>
    </div>
    <div id="sidebarfx" data-follow-scroll=".content-page" class="col-12 col-sm-4">
        <?= (new \app\components\SidebarWidget())->recentJobs(); ?>
    </div>
</div>
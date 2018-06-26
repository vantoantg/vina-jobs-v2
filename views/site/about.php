<?php

/* @var $this yii\web\View */

use yii\helpers\Html;

$page = \app\models\Pages::get('gioi-thieu');
/* @var $page \app\models\Pages title */

/* @var $this \yii\web\View title */
$this->title = \app\library\helper\Helper::getInstance()->titleSeo($page);
$this->params['breadcrumbs'][] = $this->title;
\app\library\helper\Helper::getInstance()->generateSeo($page);
?>

<div class="container <?= $page->slug; ?>">
	<div class="col-12 col-sm-8 ovf-y-h">
		<div class="site-contact <?= \app\library\helper\Helper::getInstance()->wowClass(); ?> fadeInUp" data-wow-delay="0.1s">
			<h1><?= Html::encode($this->title); ?></h1>

            <div class="content-page">
                <?= $page->content; ?>
            </div>
		</div>
	</div>
	<div class="col-12 col-sm-4">
        <?= (new \app\components\SidebarWidget())->recentJobs(); ?>
	</div>
</div>
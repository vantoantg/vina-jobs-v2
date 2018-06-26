<?php

/* @var $this yii\web\View */

use yii\helpers\Html;
use app\library\helper\Helper;

$page = \app\models\Pages::get('blog-detail');
/** @var var $sidebarWidget SidebarWidget $sidebarWidget */
$sidebarWidget = new app\components\SidebarWidget();

$this->title = $blog->name;
$this->params['breadcrumbs'][] = ['label' => 'Blogs', 'url' => Helper::getInstance()->createUrl(['site/blog'])];
$this->params['breadcrumbs'][] = $this->title;

\app\library\helper\Helper::getInstance()->generateSeo($page);
\app\components\Menu\ActiveMenu::is('blogs');
?>

<section id="blog-section">
    <div class="container">
	    <?=
        \yii\widgets\Breadcrumbs::widget([
            'homeLink' => [
                'label' => 'Trang chủ',
                'url' => Yii::$app->homeUrl,
            ],
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]);
        ?>

	    <div class="col-12 col-md-8 pd-lr-0">
		    <h1><?= Html::encode($this->title); ?></h1>
		    <div class="content-editor">
                <?= $blog->content; ?>
		    </div>

		    <div class="cms">
                <?= ( new \app\components\CommentWidget())->commentFB(false); ?>
		    </div>
	    </div>
	    <!-- // RECENT POST===========-->
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

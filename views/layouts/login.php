<?php

/* @var $this \yii\web\View */
/* @var $content string */

use app\widgets\Alert;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAssetAdminLogin;

AppAssetAdminLogin::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="your,keywords">
    <meta name="description" content="Short explanation about this website">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="web/template/admin/assets/js/libs/utils/html5shiv.js"></script>
    <script type="text/javascript" src="web/template/admin/assets/js/libs/utils/respond.min.js"></script>
    <![endif]-->
</head>
<body class="menubar-hoverable header-fixed login-page">
<?php $this->beginBody() ?>

<!-- BEGIN LOGIN SECTION -->
<?= $content; ?>
<!-- END LOGIN SECTION -->

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>

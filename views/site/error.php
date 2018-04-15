<?php

/* @var $this yii\web\View */
/* @var $name string */
/* @var $message string */

/* @var $exception Exception */

use yii\helpers\Html;

$this->title = $name;

?>
<div class="container">
    <div class="site-error">

        <h1></h1>



        <p>
<!--            The above error occurred while the Web server was processing your request.-->

        </p>
        <p>
<!--            Please contact us if you think this is a server error. Thank you.-->

        </p>

    </div>
</div>

<div class="container">
    <div class="jumbotron">
        <div class="text-center"><i class="fa fa-5x fa-frown-o" style="color:#d9534f;"></i></div>
        <h1 class="text-center"><?= Html::encode($this->title) ?></h1>

        <p class="text-center red"><?= $message; ?></p>
        <p class="text-center">
            <small style="font-size: 13px">
                Đã xảy ra lỗi trên trong khi các máy chủ Web được chế biến theo yêu cầu của bạn.<br>
                Vui lòng liên hệ với chúng tôi nếu bạn nghĩ rằng đây là một lỗi máy chủ. Cảm ơn bạn.
            </small>
        </p>

        <p class="text-center"><a class="btn btn-primary" href="<?= \app\library\helper\Helper::siteURL()?>"><i class="fa fa-home"></i> Quay lại trang chủ</a></p>
    </div>
</div>
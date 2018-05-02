<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use \app\library\helper\Common;
use \app\library\helper\Helper;
use app\models\Pages;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\User */
/* @var $dataProvider yii\data\ActiveDataProvider */
$page = Pages::get('profile-contact');
$this->title = Helper::titleSeo($page);
$this->params['breadcrumbs'][] = $this->title;
Helper::generateSeo($page);

/** @var $userInfo \app\models\UserDetails $userInfo */
$userInfo = \app\models\UserDetails::getInfo();
?>

<div id="profile_contact" class="container">
    <div class="row">
        <div class="col-md-12 toppad pull-right">
            <br>
            <p class=" text-info"><?= \app\library\helper\Datetime::getDateNow() ?></p>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">

            <div class="card">
                <ul id="contact_infos" class="nav nav-tabs" role="tablist" data-url="<?= Helper::createUrl(['front/user/client-infos'])?>">
                    <li role="presentation" class="active">
	                    <a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Thông tin nguời liên hệ</a></li>
                    <li role="presentation"><a href="#company" aria-controls="company" role="tab" data-toggle="tab">Thông tin công ty</a></li>
                    <li role="presentation"><a href="#jobs" aria-controls="jobs" role="tab" data-toggle="tab">Tin đã đăng</a></li>
                    <li role="presentation"><a href="#candidate" aria-controls="candidate" role="tab" data-toggle="tab">Ứng viên đang theo dõi</a></li>
                </ul>

                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="profile">
                        <div class="row">
                            <div class="col-xs-12 toppad <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="0.5s">
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><?= Common::currentUser('name') ?></h3>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class=" col-md-9 col-lg-9">
                                                <table class="table table-user-information">
                                                    <tbody>
                                                    <tr>
                                                        <td>Avatar:</td>
                                                        <td>
                                                            <img alt="User Pic" src="<?= Helper::webImgs(Common::currentUser('avatar')); ?>" class="img-circle img-responsive"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Đăng ký</td>
                                                        <td><?= $userInfo->registration_date; ?></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Sinh nhật</td>
                                                        <td><?= $userInfo->birthday; ?></td>
                                                    </tr>

                                                    <tr>
                                                    <tr>
                                                        <td>Giới tính</td>
                                                        <td><?= $userInfo->gender; ?></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Địa chỉ</td>
                                                        <td><?= $userInfo->address; ?></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Email</td>
                                                        <td>
                                                            <a href="mailto:<?= Common::currentUsers()->email ?>"><?= Common::currentUsers()->email ?></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Điện thoại</td>
                                                        <td><?= $userInfo->phone; ?></td>
                                                    </tr>
                                                    </tbody>
                                                </table>

                                                <a href="<?= Helper::createUrl(['front/jobs/post-jobs']) ?>" class="btn btn-primary"><i class="fas fa-plus"></i> Đăng tin tuyển dụng</a>
                                                <a href="<?= Helper::createUrl(['front/user/update-company']) ?>" class="btn btn-primary"><i class="far fa-edit"></i> Câp nhật thông tin</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>
                                        <span class="pull-right">
                                            <a href="<?= Helper::createUrl(['company/update.html']) ?>"
                               data-original-title="Edit this user" data-toggle="tooltip" type="button"
                               class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                            <a href="<?= Helper::createUrl(['front/user/logout']) ?>" data-original-title="Logout"
                               data-toggle="tooltip" type="button"
                               class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="company">
                        <div class="row">
                            <div class="col-xs-12 toppad <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="0.5s">
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><?= Common::currentUser('name') ?></h3>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class=" col-md-9 col-lg-9">
                                                <table class="table table-user-information">
                                                    <tbody>
                                                    <tr>
                                                        <td>Logo:</td>
                                                        <td>
                                                            <img alt="User Pic" src="<?= Helper::webImgs(Common::currentUser('avatar')); ?>" class="img-circle img-responsive">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Website:</td>
                                                        <td><a href="https://www.google.com.vn" target="_blank">https://www.google.com.vn</a></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Giới thiệu về công ty:</td>
                                                        <td>
                                                            <p>asdasdasda sa
                                                            </p>
                                                            <p>asd
                                                            </p>
                                                            <p>asd
                                                            </p>
                                                            <p>sa
                                                            </p>
                                                            <p>d
                                                            </p>
                                                            <p>sad
                                                            </p>
                                                            <p>sa
                                                            </p>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>

                                                <a href="#" class="btn btn-primary">My Sales Performance</a>
                                                <a href="#" class="btn btn-primary">Team Sales Performance</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>
                                        <span class="pull-right">
                                            <a href="<?= Helper::createUrl(['company/update.html']) ?>"
                               data-original-title="Edit this user" data-toggle="tooltip" type="button"
                               class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                            <a href="<?= Helper::createUrl(['front/user/logout']) ?>" data-original-title="Logout"
                               data-toggle="tooltip" type="button"
                               class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="jobs">
                        <div class="col-xs-12 jobs">
                            <div class="job-posts table-responsive">
                                <table class="table list-jobs">
                                    <tr class="odd <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="0.5s">
                                        <td class="tbl-logo">
                                            <img src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo1.png" alt=""></td>
                                        <td class="tbl-title"><h4>Web Designer <br><span
                                                        class="job-type">full time</span></h4>
                                        </td>
                                        <td><p>dribbble community</p></td>
                                        <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                        <td><p>&dollar; 14000</p></td>
                                    </tr>
                                    <tr class="even <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="1.1s">
                                        <td class="tbl-logo"><img src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo2.png" alt=""></td>
                                        <td class="tbl-title">
                                            <h4>Front End Developer <br><span class="job-type">full time</span>
                                            </h4>
                                        </td>
                                        <td><p>Jolil corporation</p></td>
                                        <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                        <td><p>&dollar; 14000</p></td>
                                    </tr>
                                    <tr class="odd <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="1.2s">
                                        <td class="tbl-logo"><img src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo3.png" alt="">
                                        </td>
                                        <td class="tbl-title">
                                            <h4>HR Manager <br><span class="job-type">full time</span>
                                            </h4></td>
                                        <td><p>Fanta bevarage</p></td>
                                        <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                        <td><p>&dollar; 14000</p></td>
                                    </tr>
                                    <tr class="even <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="1.3s">
                                        <td class="tbl-logo">
                                            <img src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo4.png" alt="">
                                        </td>
                                        <td class="tbl-title">
                                            <h4>Internship Designer <br><span class="job-type">full time</span>
                                            </h4>
                                        </td>
                                        <td><p>Google</p></td>
                                        <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                        <td><p>&dollar; 14000</p></td>
                                    </tr>
                                    <tr class="odd <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="1.4s">
                                        <td class="tbl-logo">
                                            <img src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo5.png" alt="">
                                        </td>
                                        <td class="tbl-title">
                                            <h4>Software Designer <br><span
                                                        class="job-type">full time</span></h4></td>
                                        <td><p>Microsoft</p></td>
                                        <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                        <td><p>&dollar; 14000</p></td>
                                    </tr>
                                    <tr class="odd <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="1.5s">
                                        <td class="tbl-logo"><img
                                                    src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo4.png"
                                                    alt=""></td>
                                        <td class="tbl-title"><h4>Internship Designer <br><span class="job-type">full time</span>
                                            </h4></td>
                                        <td><p>Google</p></td>
                                        <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                        <td><p>&dollar; 14000</p></td>
                                    </tr>
                                    <tr class="odd <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="1.6s">
                                        <td class="tbl-logo"><img
                                                    src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo4.png"
                                                    alt=""></td>
                                        <td class="tbl-title"><h4>Internship Designer <br><span class="job-type">full time</span>
                                            </h4></td>
                                        <td><p>Google</p></td>
                                        <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                        <td><p>&dollar; 14000</p></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="candidate">
                        <div class="col-xs-12 jobs">
                            <div class="job-posts table-responsive">
                                <table class="table list-jobs">
                                    <tr class="odd <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="1s">
                                        <td class="tbl-logo"><img
                                                    src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo1.png"
                                                    alt=""></td>
                                        <td class="tbl-title"><h4>Web Designer <br><span
                                                        class="job-type">full time</span></h4></td>
                                        <td><p>dribbble community</p></td>
                                        <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                        <td><p>&dollar; 14000</p></td>
                                    </tr>
                                    <tr class="even <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="1.1s">
                                        <td class="tbl-logo"><img
                                                    src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo2.png"
                                                    alt=""></td>
                                        <td class="tbl-title"><h4>Front End Developer <br><span class="job-type">full time</span>
                                            </h4></td>
                                        <td><p>Jolil corporation</p></td>
                                        <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                        <td><p>&dollar; 14000</p></td>
                                    </tr>
                                    <tr class="odd <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="1.2s">
                                        <td class="tbl-logo"><img
                                                    src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo3.png"
                                                    alt=""></td>
                                        <td class="tbl-title"><h4>HR Manager <br><span class="job-type">full time</span>
                                            </h4></td>
                                        <td><p>Fanta bevarage</p></td>
                                        <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                        <td><p>&dollar; 14000</p></td>
                                    </tr>
                                    <tr class="even <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="1.3s">
                                        <td class="tbl-logo"><img
                                                    src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo4.png"
                                                    alt=""></td>
                                        <td class="tbl-title"><h4>Internship Designer <br><span class="job-type">full time</span>
                                            </h4></td>
                                        <td><p>Google</p></td>
                                        <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                        <td><p>&dollar; 14000</p></td>
                                    </tr>
                                    <tr class="odd <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="1.4s">
                                        <td class="tbl-logo"><img
                                                    src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo5.png"
                                                    alt=""></td>
                                        <td class="tbl-title"><h4>Software Designer <br><span
                                                        class="job-type">full time</span></h4></td>
                                        <td><p>Microsoft</p></td>
                                        <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                        <td><p>&dollar; 14000</p></td>
                                    </tr>
                                    <tr class="odd <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="1.5s">
                                        <td class="tbl-logo"><img
                                                    src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo4.png"
                                                    alt=""></td>
                                        <td class="tbl-title"><h4>Internship Designer <br><span class="job-type">full time</span>
                                            </h4></td>
                                        <td><p>Google</p></td>
                                        <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                        <td><p>&dollar; 14000</p></td>
                                    </tr>
                                    <tr class="odd <?= \app\library\helper\Helper::wowClass() ?> fadeInUp" data-wow-delay="1.6s">
                                        <td class="tbl-logo"><img
                                                    src="<?= Helper::homeUrl() ?>web/template/jobs/img/job-logo4.png"
                                                    alt=""></td>
                                        <td class="tbl-title"><h4>Internship Designer <br><span class="job-type">full time</span>
                                            </h4></td>
                                        <td><p>Google</p></td>
                                        <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                        <td><p>&dollar; 14000</p></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
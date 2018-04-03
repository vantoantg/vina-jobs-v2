<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use \app\library\helper\Common;
use \app\library\helper\Helper;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\User */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Common::currentUser('name');
$this->params['breadcrumbs'][] = $this->title;

/** @var $userInfo \app\models\UserDetails $userInfo */
$userInfo = \app\models\UserDetails::getInfo();
?>

<div class="container">
    <div class="row">
        <div class="col-md-12 toppad pull-right">
            <br>
            <p class=" text-info"><?= \app\library\helper\Datetime::getDateNow() ?></p>
        </div>
    </div>
	<div class="row">
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 toppad">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title"><?= Common::currentUser('name')?></h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class=" col-md-9 col-lg-9">
                            <table class="table table-user-information">
                                <tbody>
                                <tr>
                                    <td>Department:</td>
                                    <td><img alt="User Pic" src="<?= Helper::webImgs(Common::currentUser('avatar')); ?>" class="img-circle img-responsive"></td>
                                </tr>
                                <tr>
                                    <td>Department:</td>
                                    <td>Programming</td>
                                </tr>
                                <tr>
                                    <td>Đăng ký:</td>
                                    <td><?= $userInfo->registration_date; ?></td>
                                </tr>
                                <tr>
                                    <td>Sinh nhật</td>
                                    <td><?= $userInfo->birthday; ?></td>
                                </tr>

                                <tr>
                                <tr>
                                    <td>Giới tính</td>
                                    <td>Female</td>
                                </tr>
                                <tr>
                                    <td>Địa chỉ</td>
                                    <td><?= $userInfo->address; ?></td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td><a href="mailto:<?= $userInfo->email ?>"><?= $userInfo->email ?></a></td>
                                </tr>
                                <td>Điện thoại</td>
                                <td><?= $userInfo->phone; ?></td>

                                </tr>

                                </tbody>
                            </table>

                            <a href="#" class="btn btn-primary">My Sales Performance</a>
                            <a href="#" class="btn btn-primary">Team Sales Performance</a>
                        </div>
                    </div>
                </div>
	            <div class="panel-footer">
		            <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button"
		               class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>
		            <span class="pull-right">
                            <a href="<?= Helper::createUrl(['company/update.html']) ?>" data-original-title="Edit this user" data-toggle="tooltip" type="button"
                               class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                            <a href="<?= Helper::createUrl(['front/user/logout']) ?>" data-original-title="Logout" data-toggle="tooltip" type="button"
                               class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                        </span>
                </div>
            </div>
        </div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 jobs">
			<div class="job-posts table-responsive">
				<table class="table list-jobs">
					<tr class="odd wow fadeInUp" data-wow-delay="1s">
						<td class="tbl-logo"><img src="<?= Helper::homeUrl()?>web/template/jobs/img/job-logo1.png" alt=""></td>
						<td class="tbl-title"><h4>Web Designer <br><span class="job-type">full time</span></h4></td>
						<td><p>dribbble community</p></td>
						<td><p><i class="icon-location"></i>San Franciso, USA</p></td>
						<td><p>&dollar; 14000</p></td>
					</tr>
					<tr class="even wow fadeInUp" data-wow-delay="1.1s">
						<td class="tbl-logo"><img src="<?= Helper::homeUrl()?>web/template/jobs/img/job-logo2.png" alt=""></td>
						<td class="tbl-title"><h4>Front End Developer <br><span class="job-type">full time</span></h4></td>
						<td><p>Jolil corporation</p></td>
						<td><p><i class="icon-location"></i>San Franciso, USA</p></td>
						<td><p>&dollar; 14000</p></td>
					</tr>
					<tr class="odd wow fadeInUp" data-wow-delay="1.2s">
						<td class="tbl-logo"><img src="<?= Helper::homeUrl()?>web/template/jobs/img/job-logo3.png" alt=""></td>
						<td class="tbl-title"><h4>HR Manager <br><span class="job-type">full time</span></h4></td>
						<td><p>Fanta bevarage</p></td>
						<td><p><i class="icon-location"></i>San Franciso, USA</p></td>
						<td><p>&dollar; 14000</p></td>
					</tr>
					<tr class="even wow fadeInUp" data-wow-delay="1.3s">
						<td class="tbl-logo"><img src="<?= Helper::homeUrl()?>web/template/jobs/img/job-logo4.png" alt=""></td>
						<td class="tbl-title"><h4>Internship Designer <br><span class="job-type">full time</span></h4></td>
						<td><p>Google</p></td>
						<td><p><i class="icon-location"></i>San Franciso, USA</p></td>
						<td><p>&dollar; 14000</p></td>
					</tr>
					<tr class="odd wow fadeInUp" data-wow-delay="1.4s">
						<td class="tbl-logo"><img src="<?= Helper::homeUrl()?>web/template/jobs/img/job-logo5.png" alt=""></td>
						<td class="tbl-title"><h4>Software Designer <br><span class="job-type">full time</span></h4></td>
						<td><p>Microsoft</p></td>
						<td><p><i class="icon-location"></i>San Franciso, USA</p></td>
						<td><p>&dollar; 14000</p></td>
					</tr>
					<tr class="odd wow fadeInUp" data-wow-delay="1.5s">
						<td class="tbl-logo"><img src="<?= Helper::homeUrl()?>web/template/jobs/img/job-logo4.png" alt=""></td>
						<td class="tbl-title"><h4>Internship Designer <br><span class="job-type">full time</span></h4></td>
						<td><p>Google</p></td>
						<td><p><i class="icon-location"></i>San Franciso, USA</p></td>
						<td><p>&dollar; 14000</p></td>
					</tr>
					<tr class="odd wow fadeInUp" data-wow-delay="1.6s">
						<td class="tbl-logo"><img src="<?= Helper::homeUrl()?>web/template/jobs/img/job-logo4.png" alt=""></td>
						<td class="tbl-title"><h4>Internship Designer <br><span class="job-type">full time</span></h4></td>
						<td><p>Google</p></td>
						<td><p><i class="icon-location"></i>San Franciso, USA</p></td>
						<td><p>&dollar; 14000</p></td>
					</tr>
				</table>
			</div>
        </div>
    </div>
</div>
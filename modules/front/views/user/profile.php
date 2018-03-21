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
$userInfo = \app\models\UserDetails::getInfo(Common::currentUser());
?>

<div class="container">
    <div class="row">
        <div class="col-md-5  toppad  pull-right col-md-offset-3 ">
            <br>
            <p class=" text-info">May 05,2014,03:00 pm </p>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title"><?= Common::currentUser('name')?></h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-3 col-lg-3 " align="center">
	                        <img alt="User Pic" src="<?= Helper::webImgs(Common::currentUser('avatar')); ?>" class="img-circle img-responsive">
                        </div>

                        <!--<div class="col-xs-10 col-sm-10 hidden-md hidden-lg"> <br>
                          <dl>
                            <dt>DEPARTMENT:</dt>
                            <dd>Administrator</dd>
                            <dt>HIRE DATE</dt>
                            <dd>11/12/2013</dd>
                            <dt>DATE OF BIRTH</dt>
                               <dd>11/12/2013</dd>
                            <dt>GENDER</dt>
                            <dd>Male</dd>
                          </dl>
                        </div>-->
                        <div class=" col-md-9 col-lg-9 ">
                            <table class="table table-user-information">
                                <tbody>
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
                                    <td><a href="mailto:<?= Common::currentUser('email')?>"><?= Common::currentUser('email')?></a></td>
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
    </div>
</div>
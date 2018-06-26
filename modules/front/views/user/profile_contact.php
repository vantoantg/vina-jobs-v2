<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\library\helper\Common;
use app\library\helper\Helper;
use app\models\Pages;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\User */
/* @var $dataProvider yii\data\ActiveDataProvider */
$page = Pages::get('profile-contact');
$this->title = Helper::getInstance()->titleSeo($page);
$this->params['breadcrumbs'][] = $this->title;
Helper::getInstance()->generateSeo($page);

/** @var $userInfo \app\models\UserDetails $userInfo */
$userInfo = \app\models\UserDetails::instance()->getInfo();
\app\components\Menu\ActiveMenu::is('employeers');
?>

<div id="profile_contact" class="container">
    <div class="row">
        <div class="col-md-12 toppad pull-right">
            <br>
            <p class=" text-info"><?= \app\library\helper\Datetime::getInstance()->getDateNow(); ?></p>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">

            <div class="card">
                <ul id="contact_infos" class="nav nav-tabs" role="tablist"
                    data-url="<?= Helper::getInstance()->createUrl(['front/user/client-infos']); ?>"
                    data-url-del-gallery="<?= Helper::getInstance()->createUrl(['front/user/ajax-delete-img']); ?>"
                >
                    <li role="presentation" class="active">
                        <a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Thông tin nguời liên hệ</a></li>
                    <li role="presentation"><a href="#company" aria-controls="company" role="tab" data-toggle="tab">Thông tin công ty</a></li>
                    <li role="presentation"><a href="#jobs" aria-controls="jobs" role="tab" data-toggle="tab">Tin đã đăng</a></li>
                    <li role="presentation"><a href="#candidate" aria-controls="candidate" role="tab" data-toggle="tab">Ứng  viên đang theo dõi</a></li>
                </ul>

                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="profile">
                        <div class="row">
                            <div class="col-xs-12 toppad <?= \app\library\helper\Helper::getInstance()->wowClass(); ?> fadeInUp"
                                 data-wow-delay="0.5s">
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><?= Common::currentUser('name'); ?></h3>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class=" col-md-9 col-lg-9">
                                                <table class="table table-user-information">
                                                    <tbody>
                                                    <tr>
                                                        <td>Avatar:</td>
                                                        <td>
                                                            <img alt="User Pic"
                                                                 src="<?= Helper::getInstance()->webImgs(Common::currentUser('avatar')); ?>"
                                                                 class="img-circle img-responsive"></td>
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
                                                            <a href="mailto:<?= Common::currentUsers()->email; ?>"><?= Common::currentUsers()->email; ?></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Điện thoại</td>
                                                        <td><?= $userInfo->phone; ?></td>
                                                    </tr>
                                                    </tbody>
                                                </table>


                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <a href="<?= Helper::getInstance()->createUrl(['front/user/update-company']); ?>?r=<?= Helper::getInstance()->encrypt(Yii::$app->request->getUrl().'#profile'); ?>" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-edit"></i> Cập nhật thông tin</a>

                                        <a href="<?= Helper::getInstance()->createUrl(['front/jobs/post-jobs']); ?>?r=<?= Helper::getInstance()->encrypt(Yii::$app->request->getUrl().'#profile'); ?>"
                                           class="btn btn-sm btn-primary"><i class="fas fa-plus"></i> Đăng tin tuyển dụng</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="company">
                        <div class="row ovf-y-h">
                            <div class="col-xs-12 toppad <?= \app\library\helper\Helper::getInstance()->wowClass(); ?> fadeInUp"
                                 data-wow-delay="0.5s">
                                <div id="container-company" class="panel panel-info">
                                    <div class="text-center" style="min-height: 500px; padding-top: 30px">
                                        <img src="<?= \app\library\helper\Cons::getLoadingImg(); ?>">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="jobs">
                        <div class="row ovf-y-h">
                            <div class="col-xs-12 toppad <?= \app\library\helper\Helper::getInstance()->wowClass(); ?> fadeInUp"
                                 data-wow-delay="0.5s">
                                <div id="container-jobs" class="panel panel-info">
                                    <div class="text-center" style="min-height: 500px; padding-top: 30px">
                                        <img src="<?= \app\library\helper\Cons::getLoadingImg(); ?>">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="candidate">
                        <div class="row ovf-y-h">
                            <div class="col-xs-12 toppad <?= \app\library\helper\Helper::getInstance()->wowClass(); ?> fadeInUp"
                                 data-wow-delay="0.5s">
                                <div id="container-candidate" class="panel panel-info">
                                    <div class="text-center" style="min-height: 500px; padding-top: 30px">
                                        <img src="<?= \app\library\helper\Cons::getLoadingImg(); ?>">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/template" id="template-candidate">
    <p class="text-center nodata"><i class="fas fa-paint-brush"></i> <br>
        Tính năng đang cập nhật!
    </p>
    <!--<div class="job-posts table-responsive">
        <table class="table list-jobs">
            <tr class="odd <?/*= \app\library\helper\Helper::getInstance()->wowClass() */?> fadeInUp"
                data-wow-delay="1s">
                <td class="tbl-logo"><img
                            src="<?/*= Helper::getInstance()->homeUrl() */?>web/template/jobs/img/job-logo1.png"
                            alt=""></td>
                <td class="tbl-title"><h4>Web Designer <br><span
                                class="job-type">full time</span></h4></td>
                <td><p>dribbble community</p></td>
                <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                <td><p>&dollar; 14000</p></td>
            </tr>
            <tr class="even <?/*= \app\library\helper\Helper::getInstance()->wowClass() */?> fadeInUp"
                data-wow-delay="1.1s">
                <td class="tbl-logo"><img
                            src="<?/*= Helper::getInstance()->homeUrl() */?>web/template/jobs/img/job-logo2.png"
                            alt=""></td>
                <td class="tbl-title"><h4>Front End Developer <br><span class="job-type">full time</span>
                    </h4></td>
                <td><p>Jolil corporation</p></td>
                <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                <td><p>&dollar; 14000</p></td>
            </tr>
            <tr class="odd <?/*= \app\library\helper\Helper::getInstance()->wowClass() */?> fadeInUp"
                data-wow-delay="1.2s">
                <td class="tbl-logo"><img
                            src="<?/*= Helper::getInstance()->homeUrl() */?>web/template/jobs/img/job-logo3.png"
                            alt=""></td>
                <td class="tbl-title"><h4>HR Manager <br><span class="job-type">full time</span>
                    </h4></td>
                <td><p>Fanta bevarage</p></td>
                <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                <td><p>&dollar; 14000</p></td>
            </tr>
            <tr class="even <?/*= \app\library\helper\Helper::getInstance()->wowClass() */?> fadeInUp"
                data-wow-delay="1.3s">
                <td class="tbl-logo"><img
                            src="<?/*= Helper::getInstance()->homeUrl() */?>web/template/jobs/img/job-logo4.png"
                            alt=""></td>
                <td class="tbl-title"><h4>Internship Designer <br><span class="job-type">full time</span>
                    </h4></td>
                <td><p>Google</p></td>
                <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                <td><p>&dollar; 14000</p></td>
            </tr>
            <tr class="odd <?/*= \app\library\helper\Helper::getInstance()->wowClass() */?> fadeInUp"
                data-wow-delay="1.4s">
                <td class="tbl-logo"><img
                            src="<?/*= Helper::getInstance()->homeUrl() */?>web/template/jobs/img/job-logo5.png"
                            alt=""></td>
                <td class="tbl-title"><h4>Software Designer <br><span
                                class="job-type">full time</span></h4></td>
                <td><p>Microsoft</p></td>
                <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                <td><p>&dollar; 14000</p></td>
            </tr>
            <tr class="odd <?/*= \app\library\helper\Helper::getInstance()->wowClass() */?> fadeInUp"
                data-wow-delay="1.5s">
                <td class="tbl-logo"><img
                            src="<?/*= Helper::getInstance()->homeUrl() */?>web/template/jobs/img/job-logo4.png"
                            alt=""></td>
                <td class="tbl-title"><h4>Internship Designer <br><span class="job-type">full time</span>
                    </h4></td>
                <td><p>Google</p></td>
                <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                <td><p>&dollar; 14000</p></td>
            </tr>
            <tr class="odd <?/*= \app\library\helper\Helper::getInstance()->wowClass() */?> fadeInUp"
                data-wow-delay="1.6s">
                <td class="tbl-logo"><img
                            src="<?/*= Helper::getInstance()->homeUrl() */?>web/template/jobs/img/job-logo4.png"
                            alt=""></td>
                <td class="tbl-title"><h4>Internship Designer <br><span class="job-type">full time</span>
                    </h4></td>
                <td><p>Google</p></td>
                <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                <td><p>&dollar; 14000</p></td>
            </tr>
        </table>
    </div>-->
</script>
<script type="text/template" id="template-jobs">
    <% if(data.length){ %>
    <div class="panel-heading">
        <h3 class="panel-title">Có tất cả <%= data.length %> tin</h3>
    </div>
    <div class="job-posts table-responsive">
        <div class="col-xs-12">
	        <?php if (Yii::$app->session->hasFlash('success')): ?>
                <br>
                <div class="alert alert-success alert-dismissable">
                    <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                    <i class="icon fa fa-check"></i> <?= Yii::$app->session->getFlash('success'); ?>
                </div>
	        <?php endif; ?>
        </div>

        <table class="table list-jobs">
            <% _.each(data, function(k,v){ %>
            <tr class="odd <?= \app\library\helper\Helper::getInstance()->wowClass(); ?> fadeInUp"
                data-wow-delay="0.5s">
                <td class="tbl-logo"><b><%= (v + 1) %>.</b></td>
                <td class="tbl-title">
                    <h4><%= k.job_name %><br>
                        <span class="job-type">
                            <a href="<%= k.url_edit %>?r=<?= Helper::getInstance()->encrypt(Yii::$app->request->getUrl().'#jobs'); ?>"><i class="fas fa-edit"></i></a> |
                            <a href="<%= k.url_view %>" target="_blank"><i class="fas fa-eye"></i></a>
                        </span></h4>
                </td>
                <td><p class="lh-18"><%= k.cat_name %><br><span class="job-type"><%= k.working_time %></span></p></td>
                <td><p><i class="icon-location"></i><%= k.loca_name %></p></td>
                <td><p><%= k.salary %></p></td>
                <td><p><%= k.created_at %></p></td>
                <td><p>
                        <%= k.client_status %>
                    </p></td>
            </tr>
            <% }); %>
        </table>
    </div>
    <% } else { %>
        <p class="text-center nodata"><i class="far fa-file-alt"></i> <br> Chưa có tin nào được đăng!</p>
    <% } %>
    <div class="panel-footer">
    <a href="<?= Helper::getInstance()->createUrl(['front/jobs/post-jobs']); ?>?r=<?= Helper::getInstance()->encrypt(Yii::$app->request->getUrl().'#jobs'); ?>"
       class="btn btn-sm btn-primary"><i class="fas fa-plus"></i> Đăng tin tuyển dụng</a>
    </div>
</script>

<script type="text/template" id="template-company">
    <div class="panel-heading">
        <h3 class="panel-title"><%= data.name %></h3>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class=" col-xs-9">
                <table class="table table-user-information">
                    <tbody>
                    <tr>
                        <td colspan="100%">
	                        <?php if (Yii::$app->session->hasFlash('updateSuccess')): ?>
                                <div class="alert alert-success alert-dismissable <?= \app\library\helper\Helper::getInstance()->wowClass(); ?> zoomInDown animated" data-wow-delay="0.5s">
                                    <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                                    <i class="icon fa fa-check"></i> <?= Yii::$app->session->getFlash('updateSuccess'); ?>
                                </div>
	                        <?php endif; ?>
                        </td>
                    <tr>
	                    <td colspan="100%">
		                    <ul class="com-gallery" data-url-sort="<?= Helper::getInstance()->createUrl(['front/user/ajax-sortable']); ?>">
			                    <% if (data.gallery.length){ %>
			                    <% _.each(data.gallery, function(k,v){ %>
			                    <li class="item" data-id="<%= k.id %>" title="Nhấp chuột giữ và di chuyển để sắp xếp thứ tự cho các bức ảnh">
				                    <a href="#" data-id="<%= k.id %>" title="Xóa"><i class="far fa-trash-alt"></i></a>
				                    <img src="<%= k.img %>">
			                    </li>
			                    <% }); %>
			                    <% } %>

			                    <% if (data.isUpload){ %>
			                    <li class="add">
				                    <a href="#" data-toggle="modal" data-target="#uploadGallery" title="Thêm ảnh vào thư viện"><i class="far fa-plus-square"></i></a>
			                    </li>
			                    <% } %>
		                    </ul>

	                    </td>
                    </tr>
                    <tr>
                        <td style="width: 30%">Tên công ty:</td>
                        <td><%= data.name %></td>
                    </tr>
                    <tr>
                        <td>Logo:</td>
                        <td>
                            <img src="<%= data.logo %>"
                                 class="img-responsive" style="max-width: 100px">
                        </td>
                    </tr>
                    <tr>
                        <td>Website:</td>
                        <td><a href="<%= data.website %>" target="_blank"><%= data.website %></a></td>
                    </tr>
                    <tr>
                        <td>Giới thiệu về công ty:</td>
                        <td>
                            <%= data.content %>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-xs-3">
                &nbsp;
            </div>
        </div>
    </div>
    <div class="panel-footer">
        <a href="<?= Helper::getInstance()->createUrl(['front/user/update-company']); ?>?r=<?= Helper::getInstance()->encrypt(Yii::$app->request->getUrl().'#company'); ?>" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-edit"></i> Cập nhật thông tin</a>
    </div>
</script>

<!-- Modal -->
<div id="uploadGallery" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">CẬP NHẬT THÔNG TIN CÔNG TY</h4>
            </div>
            <div class="modal-body">
                <?php $form = ActiveForm::begin(['action' => Helper::getInstance()->createUrl(['front/user/ajax-upload-img'])]); ?>
                <?= $form->field($imgForm, 'image')->fileInput(['accept' => 'image/*'])->label('Tải ảnh lên Gallery'); ?>
                <?= Html::button('<i class="fas fa-upload"></i> Tải lên', ['class' => 'btn btn-primary upload-img', 'disabled' => true]); ?>
                <?php ActiveForm::end(); ?>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">ĐÓNG LẠI</button>
            </div>
        </div>
    </div>
</div>
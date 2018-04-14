<?php

/* @var $this yii\web\View */

use yii\helpers\Html;
use app\library\helper\Helper;

$page = \app\models\Pages::get(\app\library\helper\Cons::PAGE_JOB_SEEKERS);

$this->title = Helper::titleSeo($page);
Helper::generateSeo($page);

$this->params['breadcrumbs'][] = $this->title;
?>


<div class="container">
    <div class="row page-title text-center wow bounce"  data-wow-delay="1s">
        <h5>Tất cả các ứng viên</h5>
        <h2><span>54.716</span> ứng viên đã đăng hồ sơ tìm việc</h2>
    </div>
    <div class="row text-center">
        <div class="search-form wow pulse" data-wow-delay="0.8s">
            <form id="employeers-search" class="form-inline" action="<?= Helper::createUrl(['site/search']) ?>"
                  method="get">
                <div class="form-group field-searchform-keywords">
                    <input type="text" name="keywords" id="searchform-keys" class="form-control"
                           placeholder="Nhập từ khóa..." aria-invalid="false">
                </div>

                <div class="form-group field-searchform-jobs">
				    <?php
				    $data = \app\models\JobCategories::getAll();
				    ?>
                    <select class="job-select2 form-control" name="jobs">
                        <option value="0">-- Chọn --</option>
					    <?php
					    foreach ($data as $datum) {
						    echo '<option value="' . $datum['id'] . '">' . $datum['name'] . '</option>';
					    }
					    ?>
                    </select>
                </div>

                <div class="form-group field-searchform-loca">
				    <?php
				    $data = \app\models\Locations::getAll();
				    ?>
                    <select class="job-select2 form-control" name="loca">
                        <option value="0">-- Chọn --</option>
					    <?php
					    foreach ($data as $datum) {
						    echo '<option value="' . $datum['id'] . '">' . $datum['name'] . '</option>';
					    }
					    ?>
                    </select>
                </div>

                <input type="submit" class="btn search" value="TÌM">
            </form>
        </div>
    </div>
    <div class="row jobs">
        <div class="col-md-9">
            <div class="job-posts table-responsive">
                <table class="table list-jobs">
                    <tr class="odd wow fadeInUp" data-wow-delay="1s">
                        <td class="tbl-logo"><img src="<?= Helper::homeUrl()?>web/template/jobs/img/job-logo1.png" alt=""></td>
                        <td class="tbl-title"><h4>Web Designer <br><span class="job-type">full time</span></h4></td>
                        <td><p>dribbble community</p></td>
                        <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                        <td><p>&dollar; 14000</p></td>
                        <td class="tbl-apply"><a href="#">Apply now</a></td>
                    </tr>
                    <tr class="even wow fadeInUp" data-wow-delay="1.1s">
                        <td class="tbl-logo"><img src="<?= Helper::homeUrl()?>web/template/jobs/img/job-logo2.png" alt=""></td>
                        <td class="tbl-title"><h4>Front End Developer <br><span class="job-type">full time</span></h4></td>
                        <td><p>Jolil corporation</p></td>
                        <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                        <td><p>&dollar; 14000</p></td>
                        <td class="tbl-apply"><a href="#">Apply now</a></td>
                    </tr>
                    <tr class="odd wow fadeInUp" data-wow-delay="1.2s">
                        <td class="tbl-logo"><img src="<?= Helper::homeUrl()?>web/template/jobs/img/job-logo3.png" alt=""></td>
                        <td class="tbl-title"><h4>HR Manager <br><span class="job-type">full time</span></h4></td>
                        <td><p>Fanta bevarage</p></td>
                        <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                        <td><p>&dollar; 14000</p></td>
                        <td class="tbl-apply"><a href="#">Apply now</a></td>
                    </tr>
                    <tr class="even wow fadeInUp" data-wow-delay="1.3s">
                        <td class="tbl-logo"><img src="<?= Helper::homeUrl()?>web/template/jobs/img/job-logo4.png" alt=""></td>
                        <td class="tbl-title"><h4>Internship Designer <br><span class="job-type">full time</span></h4></td>
                        <td><p>Google</p></td>
                        <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                        <td><p>&dollar; 14000</p></td>
                        <td class="tbl-apply"><a href="#">Apply now</a></td>
                    </tr>
                    <tr class="odd wow fadeInUp" data-wow-delay="1.4s">
                        <td class="tbl-logo"><img src="<?= Helper::homeUrl()?>web/template/jobs/img/job-logo5.png" alt=""></td>
                        <td class="tbl-title"><h4>Software Designer <br><span class="job-type">full time</span></h4></td>
                        <td><p>Microsoft</p></td>
                        <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                        <td><p>&dollar; 14000</p></td>
                        <td class="tbl-apply"><a href="#">Apply now</a></td>
                    </tr>
                    <tr class="even hide-jobs">
                        <td class="tbl-logo"><img src="<?= Helper::homeUrl()?>web/template/jobs/img/job-logo4.png" alt=""></td>
                        <td class="tbl-title"><h4>Internship Designer <br><span class="job-type">full time</span></h4></td>
                        <td><p>Google</p></td>
                        <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                        <td><p>&dollar; 14000</p></td>
                        <td class="tbl-apply"><a href="#">Apply now</a></td>
                    </tr>
                    <tr class="odd hide-jobs">
                        <td class="tbl-logo"><img src="<?= Helper::homeUrl()?>web/template/jobs/img/job-logo5.png" alt=""></td>
                        <td class="tbl-title"><h4>Software Designer <br><span class="job-type">full time</span></h4></td>
                        <td><p>Microsoft</p></td>
                        <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                        <td><p>&dollar; 14000</p></td>
                        <td class="tbl-apply"><a href="#">Apply now</a></td>
                    </tr>
                    <tr class="even hide-jobs">
                        <td class="tbl-logo"><img src="<?= Helper::homeUrl()?>web/template/jobs/img/job-logo4.png" alt=""></td>
                        <td class="tbl-title"><h4>Internship Designer <br><span class="job-type">full time</span></h4></td>
                        <td><p>Google</p></td>
                        <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                        <td><p>&dollar; 14000</p></td>
                        <td class="tbl-apply"><a href="#">Apply now</a></td>
                    </tr>
                    <tr class="odd hide-jobs">
                        <td class="tbl-logo"><img src="<?= Helper::homeUrl()?>web/template/jobs/img/job-logo5.png" alt=""></td>
                        <td class="tbl-title"><h4>Software Designer <br><span class="job-type">full time</span></h4></td>
                        <td><p>Microsoft</p></td>
                        <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                        <td><p>&dollar; 14000</p></td>
                        <td class="tbl-apply"><a href="#">Apply now</a></td>
                    </tr>
                </table>
            </div>
            <div class="more-jobs">
                <a href=""> <i class="fa fa-refresh"></i>View more jobs</a>
            </div>
        </div>
        <div class="col-md-3 hidden-sm">
            <div class="job-add wow fadeInRight" data-wow-delay="1.5s">
                <h2>Seeking a job?</h2>
                <a href="#">Create a Account</a>
            </div>
        </div>
    </div>
</div>

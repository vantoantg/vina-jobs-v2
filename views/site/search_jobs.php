<?php

/* @var $this yii\web\View */

use app\library\helper\Helper;

$page = \app\models\Pages::get('search');
/* @var $page \app\models\Pages title */

/* @var $this \yii\web\View title */
$this->title = \app\library\helper\Helper::titleSeo($page);
\app\library\helper\Helper::generateSeo($page);
$this->params['breadcrumbs'][] = $this->title;
$this->registerJsFile(Yii::$app->getHomeUrl().'vendor/bower-asset/select2/dist/js/select2.min.js');

\app\components\Menu\ActiveMenu::is('employeers');
?>

<div class="container <?= $page->slug; ?>">
	<div class="col-12 col-sm-3">
		<div class="row">
            <?= (new \app\components\SidebarWidget())->searchResultJobs($_url, $queryParams); ?>
		</div>
	</div>

	<div class="col-12 col-sm-9 search-results">
		<div class="row">
			<div class="jobs">
				<div id="jobs-search" class="col-xs-12">
                    <h2 class="text-center">CÓ <span>0</span> KẾT QUẢ TÌM ĐƯỢC</h2>

					<div class="job-posts table-responsive">
						<table class="table list-jobs">

						</table>
					</div>
					<div class="paginator-jobs text-center">
					</div>
				</div>
                <div class="clearfix"></div>
			</div>
		</div>
	</div>
</div>

<script id="jobs-search-template" type="text/template">
    <%
    var i;
    _.each(data, function(k,v){
        i++;
    %>
    <tr class="<% if(v%2){ %> even <% }else{ %> odd <% } %>wow fadeInUp" data-wow-delay="0.<%= i %>s">
        <td class="tbl-logo"><a href="<%= k.url_company_detail %>"><img src="<%= k.com_logo %>" alt="" width="70"></a>
        </td>
        <td class="tbl-title"><h4><a href="<%= k.url_view %>"><%= k.job_name %> </a> <br><span class="job-type"><%= k.working_time %></span></h4>
    </td>
    <td><%= k.cat_name %><br>
        Lương: <%= k.salary %>
    </td>
    <td class="text-center"><p title="Nơi làm việc"><i class="icon-location"></i>
                <br><%= k.loca_name %></p></td>
	    <?php if (\app\library\helper\Common::isGuest() || \app\library\helper\Common::currentUsers()->type != \app\models\Users::USER_TYPE_CONTACT_OF_COMPANY) {
    ?>
    <td class="tbl-apply">
        <% if (k.isGuest){ %>
        <a href="#"
           data-toggle="modal" data-target="#login-modal"
        >Apply</a>
        <% } else { %>

        <a href="#"
           class="apply-job"
           data-action="apply"
           data-toggle="modal"
           data-target="#apply-modal"
           data-job-code="<%= k.job_code %>"
           data-href="<?= Helper::createUrl(['front/jobs/preapply']); ?>"
        >Apply</a>
        <% } %>
    </td>
	    <?php
} ?>
    </tr>
    <% }); %>
</script>
<?php
/*
 * This file is part of EC-CUBE
 *
 * Copyright(c) 2000-2015 LOCKON CO.,LTD. All Rights Reserved.
 *
 * http://www.lockon.co.jp/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */

use \yii\helpers\Url;
use app\library\helper\Helper;
?>

<ul id="main-menu" class="gui-controls">

    <!-- BEGIN DASHBOARD -->
    <li>
        <a href="<?= \app\library\helper\Helper::homeUrl().\app\library\helper\Cons::ROUTE_ADMIN_ROOT ?>" class="active">
            <div class="gui-icon"><i class="md md-home"></i></div>
            <span class="title">Dashboard</span>
        </a>
    </li><!--end /menu-li -->
    <!-- END DASHBOARD -->

    <!-- BEGIN LEVELS -->
    <li class="gui-folder">
        <a>
            <div class="gui-icon"><i class="fa fa-folder-open fa-fw"></i></div>
            <span class="title">Admin</span>
        </a>
        <!--start submenu -->
        <ul>
            <!--<li><a href="#"><span class="title">Item 1</span></a></li>
            <li><a href="#"><span class="title">Item 1</span></a></li>-->
            <li class="gui-folder">
                <a href="javascript:void(0);">
                    <span class="title">Auth</span>
                </a>
                <!--start submenu -->
                <ul>
                    <li><a href="<?= Url::toRoute('/auth/auth-rule') ?>"><span class="title">Auth rule</span></a></li>
                    <li><a href="<?= Url::toRoute('/auth/auth-assignment') ?>"><span class="title">Auth Assignment</span></a></li>
                    <li><a href="<?= Url::toRoute('/auth/auth-item') ?>"><span class="title">Auth item</span></a></li>
                    <li><a href="<?= Url::toRoute('/auth/auth-item-child') ?>"><span class="title">Auth item child</span></a></li>
                </ul><!--end /submenu -->
            </li><!--end /submenu-li -->

            <li class="gui-folder">
                <a href="javascript:void(0);">
                    <span class="title">Users</span>
                </a>
                <!--start submenu -->
                <ul>
                    <li><a href="<?= Url::toRoute('/user') ?>"><span class="title">User</span></a></li>
                </ul><!--end /submenu -->
            </li><!--end /submenu-li -->
        </ul><!--end /submenu -->
    </li><!--end /menu-li -->
    <!-- END LEVELS -->

    <!-- BEGIN Products -->
    <li class="gui-folder <?= Helper::activeMenu(['product/index', 'product/create', '/product-category/index', 'product-category/create'])?>">
        <a>
            <div class="gui-icon"><i class="md md-computer"></i></div>
            <span class="title">Products</span>
        </a>
        <!--start submenu -->
        <ul>
            <li><a href="<?= Url::toRoute('/product/product') ?>" ><span class="title">Product</span></a></li>
            <li><a href="<?= Url::toRoute('/product/product/create') ?>" ><span class="title">Create product</span></a></li>
            <li><a href="<?= Url::toRoute('/product/product-category') ?>" ><span class="title">Product category</span></a></li>
            <li><a href="<?= Url::toRoute('/product/product-category/create') ?>" ><span class="title">Create product category</span></a></li>
        </ul><!--end /submenu -->
    </li><!--end /menu-li -->
    <!-- END Products -->

    <!-- BEGIN Pages -->
    <li class="gui-folder <?= Helper::activeMenu(['pages/index', 'pages/create', 'pages/update', 'post/index', 'post/create', 'post/update', 'post-category/index', 'post-category/create', 'post-category/update'])?>">
        <a>
            <div class="gui-icon"><i class="md md-computer"></i></div>
            <span class="title">Content</span>
        </a>
        <!--start submenu -->
        <ul>
            <li><a href="<?= Url::toRoute('/contents/pages') ?>" ><span class="title">Page</span></a></li>
            <li><a href="<?= Url::toRoute('/contents/post') ?>" ><span class="title">Blog</span></a></li>
            <li><a href="<?= Url::toRoute('/contents/post-category') ?>" ><span class="title">Blog - category</span></a></li>
        </ul><!--end /submenu -->
    </li><!--end /menu-li -->
    <!-- END Pages -->

    <!-- BEGIN SYSTEM -->
    <li class="gui-folder <?= Helper::activeMenu(['migration/index', 'log-system/index', 'system/index', 'setting/index', 'system/backup-db'])?>">
        <a>
            <div class="gui-icon"><i class="fa fa-folder-open fa-fw"></i></div>
            <span class="title">System</span>
        </a>
        <!--start submenu -->
        <ul>
            <li><a href="<?= Url::toRoute('/system/migration') ?>" ><span class="title">Migrations</span></a></li>
            <li><a href="<?= Url::toRoute('/system/log-system') ?>" ><span class="title">Log system</span></a></li>
            <li><a href="<?= Url::toRoute('/system/system') ?>" ><span class="title">System</span></a></li>
            <li><a href="<?= Url::toRoute('/system/setting') ?>" ><span class="title">Setting</span></a></li>
            <li><a href="<?= Url::toRoute('/system/system/backup-db') ?>" ><span class="title">Backup Database</span></a></li>
        </ul><!--end /submenu -->
    </li><!--end /menu-li -->
    <!-- END SYSTEM -->

	<!-- BEGIN CAROUSEL -->
	<li class="gui-folder">
		<a>
			<div class="gui-icon"><i class="fa fa-folder-open fa-fw"></i></div>
			<span class="title">Carousel</span>
		</a>
		<!--start submenu -->
		<ul>
			<li><a href="<?= Url::toRoute('/contents/carousel') ?>" ><span class="title">Carousel</span></a></li>
			<li><a href="<?= Url::toRoute('/contents/carousel-items') ?>" ><span class="title">Carousel images</span></a></li>
		</ul><!--end /submenu -->
	</li><!--end /menu-li -->
	<!-- END CAROUSEL -->

	<!-- BEGIN TAGS -->
	<li class="gui-folder">
		<a>
			<div class="gui-icon"><i class="fa fa-folder-open fa-fw"></i></div>
			<span class="title">Tags</span>
		</a>
		<!--start submenu -->
		<ul>
			<li><a href="<?= Url::toRoute('/contents/tags') ?>" ><span class="title">Tags</span></a></li>
			<li><a href="<?= Url::toRoute('/contents/tags/create') ?>" ><span class="title">Create tag</span></a></li>
		</ul><!--end /submenu -->
	</li><!--end /menu-li -->
	<!-- END TAGS -->

	<!-- BEGIN EMAIL -->
	<li class="gui-folder <?= Helper::activeMenu(['layout/page', 'layout/style'])?>">
		<a>
			<div class="gui-icon"><i class="md md-web"></i></div>
			<span class="title">Layouts</span>
		</a>
		<!--start submenu -->
		<ul>
			<li><a href="<?= Url::toRoute('/contents/layout/page') ?>"><span class="title">Page</span></a></li>
			<li><a href="<?= Url::toRoute('/contents/layout/style') ?>"><span class="title">Stylesheet</span></a></li>
		</ul><!--end /submenu -->
	</li><!--end /menu-li -->
	<!-- END EMAIL -->

    <!-- BEGIN EMAIL -->
    <li class="gui-folder">
        <a>
            <div class="gui-icon"><i class="md md-email"></i></div>
            <span class="title">Email</span>
        </a>
        <!--start submenu -->
        <ul>
            <li><a href="../../html/mail/inbox.html" ><span class="title">Inbox</span></a></li>
            <li><a href="../../html/mail/compose.html" ><span class="title">Compose</span></a></li>
            <li><a href="../../html/mail/reply.html" ><span class="title">Reply</span></a></li>
            <li><a href="../../html/mail/message.html" ><span class="title">View message</span></a></li>
        </ul><!--end /submenu -->
    </li><!--end /menu-li -->
    <!-- END EMAIL -->

    <!-- BEGIN DASHBOARD -->
    <li class="">
        <a href="../../html/layouts/builder.html" >
            <div class="gui-icon"><i class="md md-web"></i></div>
            <span class="title">Layouts</span>
        </a>
    </li><!--end /menu-li -->
    <!-- END DASHBOARD -->

    <!-- BEGIN UI -->
    <li class="gui-folder">
        <a>
            <div class="gui-icon"><i class="fa fa-puzzle-piece fa-fw"></i></div>
            <span class="title">UI elements</span>
        </a>
        <!--start submenu -->
        <ul>
            <li><a href="../../html/ui/colors.html" ><span class="title">Colors</span></a></li>
            <li><a href="../../html/ui/typography.html" ><span class="title">Typography</span></a></li>
            <li><a href="../../html/ui/cards.html" ><span class="title">Cards</span></a></li>
            <li><a href="../../html/ui/buttons.html" ><span class="title">Buttons</span></a></li>
            <li><a href="../../html/ui/lists.html" ><span class="title">Lists</span></a></li>
            <li><a href="../../html/ui/tabs.html" ><span class="title">Tabs</span></a></li>
            <li><a href="../../html/ui/accordions.html" ><span class="title">Accordions</span></a></li>
            <li><a href="../../html/ui/messages.html" ><span class="title">Messages</span></a></li>
            <li><a href="../../html/ui/offcanvas.html" ><span class="title">Off-canvas</span></a></li>
            <li><a href="../../html/ui/grid.html" ><span class="title">Grid</span></a></li>
            <li class="gui-folder">
                <a href="javascript:void(0);">
                    <span class="title">Icons</span>
                </a>
                <!--start submenu -->
                <ul>
                    <li><a href="../../html/ui/icons/materialicons.html" ><span class="title">Material Design Icons</span></a></li>
                    <li><a href="../../html/ui/icons/fontawesome.html" ><span class="title">Font Awesome</span></a></li>
                    <li><a href="../../html/ui/icons/glyphicons.html" ><span class="title">Glyphicons</span></a></li>
                    <li><a href="../../html/ui/icons/skycons.html" ><span class="title">Skycons</span></a></li>
                </ul><!--end /submenu -->
            </li><!--end /menu-li -->
        </ul><!--end /submenu -->
    </li><!--end /menu-li -->
    <!-- END UI -->

    <!-- BEGIN TABLES -->
    <li class="gui-folder">
        <a>
            <div class="gui-icon"><i class="fa fa-table"></i></div>
            <span class="title">Tables</span>
        </a>
        <!--start submenu -->
        <ul>
            <li><a href="../../html/tables/static.html" ><span class="title">Static Tables</span></a></li>
            <li><a href="../../html/tables/dynamic.html" ><span class="title">Dynamic Tables</span></a></li>
            <li><a href="../../html/tables/responsive.html" ><span class="title">Responsive Table</span></a></li>
        </ul><!--end /submenu -->
    </li><!--end /menu-li -->
    <!-- END TABLES -->

    <!-- BEGIN FORMS -->
    <li class="gui-folder">
        <a>
            <div class="gui-icon"><span class="glyphicon glyphicon-list-alt"></span></div>
            <span class="title">Forms</span>
        </a>
        <!--start submenu -->
        <ul>
            <li><a href="../../html/forms/basic.html" ><span class="title">Form basic</span></a></li>
            <li><a href="../../html/forms/advanced.html" ><span class="title">Form advanced</span></a></li>
            <li><a href="../../html/forms/layouts.html" ><span class="title">Form layouts</span></a></li>
            <li><a href="../../html/forms/editors.html" ><span class="title">Editors</span></a></li>
            <li><a href="../../html/forms/validation.html" ><span class="title">Form validation</span></a></li>
            <li><a href="../../html/forms/wizard.html" ><span class="title">Form wizard</span></a></li>
        </ul><!--end /submenu -->
    </li><!--end /menu-li -->
    <!-- END FORMS -->

    <!-- BEGIN PAGES -->
    <li class="gui-folder">
        <a>
            <div class="gui-icon"><i class="md md-computer"></i></div>
            <span class="title">Pages</span>
        </a>
        <!--start submenu -->
        <ul>
            <li class="gui-folder">
                <a href="javascript:void(0);">
                    <span class="title">Contacts</span>
                </a>
                <!--start submenu -->
                <ul>
                    <li><a href="../../html/pages/contacts/search.html" ><span class="title">Search</span></a></li>
                    <li><a href="../../html/pages/contacts/details.html" ><span class="title">Contact card</span></a></li>
                    <li><a href="../../html/pages/contacts/add.html" ><span class="title">Insert contact</span></a></li>
                </ul><!--end /submenu -->
            </li><!--end /menu-li -->
            <li class="gui-folder">
                <a href="javascript:void(0);">
                    <span class="title">Search</span>
                </a>
                <!--start submenu -->
                <ul>
                    <li><a href="../../html/pages/search/results-text.html" ><span class="title">Results - Text</span></a></li>
                    <li><a href="../../html/pages/search/results-text-image.html" ><span class="title">Results - Text and Image</span></a></li>
                </ul><!--end /submenu -->
            </li><!--end /menu-li -->
            <li class="gui-folder">
                <a href="javascript:void(0);">
                    <span class="title">Blog</span>
                </a>
                <!--start submenu -->
                <ul>
                    <li><a href="../../html/pages/blog/masonry.html" ><span class="title">Blog masonry</span></a></li>
                    <li><a href="../../html/pages/blog/list.html" ><span class="title">Blog list</span></a></li>
                    <li><a href="../../html/pages/blog/post.html" ><span class="title">Blog post</span></a></li>
                </ul><!--end /submenu -->
            </li><!--end /menu-li -->
            <li class="gui-folder">
                <a href="javascript:void(0);">
                    <span class="title">Error pages</span>
                </a>
                <!--start submenu -->
                <ul>
                    <li><a href="../../html/pages/404.html" ><span class="title">404 page</span></a></li>
                    <li><a href="../../html/pages/500.html" ><span class="title">500 page</span></a></li>
                </ul><!--end /submenu -->
            </li><!--end /menu-li -->
            <li><a href="../../html/pages/profile.html" ><span class="title">User profile<span class="badge style-accent">42</span></span></a></li>
            <li><a href="../../html/pages/invoice.html" ><span class="title">Invoice</span></a></li>
            <li><a href="../../html/pages/calendar.html" ><span class="title">Calendar</span></a></li>
            <li><a href="../../html/pages/pricing.html" ><span class="title">Pricing</span></a></li>
            <li><a href="../../html/pages/timeline.html" ><span class="title">Timeline</span></a></li>
            <li><a href="../../html/pages/maps.html" ><span class="title">Maps</span></a></li>
            <li><a href="../../html/pages/locked.html" ><span class="title">Lock screen</span></a></li>
            <li><a href="../../html/pages/login.html" ><span class="title">Login</span></a></li>
            <li><a href="../../html/pages/blank.html" ><span class="title">Blank page</span></a></li>
        </ul><!--end /submenu -->
    </li><!--end /menu-li -->
    <!-- END FORMS -->

    <!-- BEGIN CHARTS -->
    <li>
        <a href="../../html/charts/charts.html" >
            <div class="gui-icon"><i class="md md-assessment"></i></div>
            <span class="title">Charts</span>
        </a>
    </li><!--end /menu-li -->
    <!-- END CHARTS -->

    <!-- BEGIN LEVELS -->
    <li class="gui-folder">
        <a>
            <div class="gui-icon"><i class="fa fa-folder-open fa-fw"></i></div>
            <span class="title">Menu levels demo</span>
        </a>
        <!--start submenu -->
        <ul>
            <li><a href="#"><span class="title">Item 1</span></a></li>
            <li><a href="#"><span class="title">Item 1</span></a></li>
            <li class="gui-folder">
                <a href="javascript:void(0);">
                    <span class="title">Open level 2</span>
                </a>
                <!--start submenu -->
                <ul>
                    <li><a href="#"><span class="title">Item 2</span></a></li>
                    <li class="gui-folder">
                        <a href="javascript:void(0);">
                            <span class="title">Open level 3</span>
                        </a>
                        <!--start submenu -->
                        <ul>
                            <li><a href="#"><span class="title">Item 3</span></a></li>
                            <li><a href="#"><span class="title">Item 3</span></a></li>
                            <li class="gui-folder">
                                <a href="javascript:void(0);">
                                    <span class="title">Open level 4</span>
                                </a>
                                <!--start submenu -->
                                <ul>
                                    <li><a href="#"><span class="title">Item 4</span></a></li>
                                    <li class="gui-folder">
                                        <a href="javascript:void(0);">
                                            <span class="title">Open level 5</span>
                                        </a>
                                        <!--start submenu -->
                                        <ul>
                                            <li><a href="#"><span class="title">Item 5</span></a></li>
                                            <li><a href="#"><span class="title">Item 5</span></a></li>
                                        </ul><!--end /submenu -->
                                    </li><!--end /submenu-li -->
                                </ul><!--end /submenu -->
                            </li><!--end /submenu-li -->
                        </ul><!--end /submenu -->
                    </li><!--end /submenu-li -->
                </ul><!--end /submenu -->
            </li><!--end /submenu-li -->
        </ul><!--end /submenu -->
    </li><!--end /menu-li -->
    <!-- END LEVELS -->

</ul><!--end .main-menu -->

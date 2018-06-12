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

?>

<div class="widget-sidebar <?= \app\library\helper\Helper::wowClass() ?> fadeInRight" data-wow-delay="0.2s">
    <h2 class="title-widget-sidebar">CÁC VIỆC LÀM MỚI</h2>
    <div class="content-widget-sidebar">
        <ul>
            <?php foreach ($data as $item) {
    ?>
            <li class="recent-post">
                <div class="post-img">
                    <a href="<?= $item['url_company_detail']; ?>"><img src="<?= $item['com_logo']; ?>"
                                    class="img-responsive"></a>
                </div>
                <a href="<?= $item['url_view']; ?>"><h5><?= $item['job_name']; ?></h5></a>
                <p>
                    <small><i class="fa fa-calendar" data-original-title="" title=""></i>
                        <?= $item['created_at']; ?></small>
                </p>
            </li>
            <hr>
            <?php
} ?>
        </ul>
    </div>
</div>

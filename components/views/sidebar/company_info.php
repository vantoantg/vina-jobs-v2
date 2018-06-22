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

<div class="row">
	<div class="widget-sidebar pd-t-30 md-pdl-30 <?= \app\library\helper\Helper::wowClass(); ?> fadeInRight" data-wow-delay="0.2s">
		<h2 class="title-widget-sidebar">THÔNG TIN CÔNG TY</h2>
		<div class="content-widget-sidebar">
			<ul>
				<li class="text-center">
					<a href="">
						<img src="<?= $company['logo']; ?>"
						     class="img-responsive">
					</a>
				</li>
				<hr>

				<li class="">
					<p><?= $company['name']; ?></p>
				</li>
				<hr>

				<li class="">
					A social infrastructure and digital products software company
				</li>
				<hr>

				<li class="">
					<div class="basic-info">
						<p class="company-type"><i class="fas fa-cogs"></i> Product </p>
						<p class="group-icon"><i class="fas fa-sort-amount-up"></i> 301-500 </p>
						<p class="group-icon"><i class="fas fa-flag-checkered"></i> Japan</p>
						<p class="group-icon"><i class="far fa-calendar-alt"></i> Monday - Friday</p>
						<p class="group-icon"><i class="far fa-clock"></i> No OT</p>
					</div>
				</li>
			</ul>
		</div>
	</div>
</div>
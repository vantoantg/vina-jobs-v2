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

<div class="widget-sidebar jobs pd-left-0">
    <form id="search-jobs">
        <h2 class="title-widget-sidebar">TÌM VIỆC LÀM</h2>
        <div class="content-widget-sidebar">
            <input name="keywords" class="form-control keywords" placeholder="Nhập từ khóa">
        </div>

	    <div class="content-widget-sidebar">
            <?php
            $data = \app\models\JobCategories::categoriesMenus()
            ?>
		    <select class="form-control job-select2" name="jobs" data-placeholder="Chọn ngành nghề" multiple>
                <?php
                foreach ($data as $value) {
                    ?>
				    <option value="<?= $value['id'] ?>"> <?= $value['name'] ?></option>
                <?php } ?>
		    </select>
	    </div>

	    <div class="content-widget-sidebar">
            <?php
            $data = \app\models\Locations::getAll();
            ?>
		    <select class="form-control job-select2" name="loca" data-placeholder="Nơi làm việc mong muốn" multiple>
                <?php
                foreach ($data as $value) {
                    ?>
				    <option value="<?= $value['id'] ?>"> <?= $value['name'] ?></option>
                <?php } ?>
		    </select>
	    </div>

        <h2 class="title-widget-sidebar">Thời gian làm việc</h2>
        <div class="content-widget-sidebar">
			<?php
			$data = \app\library\helper\Dropdowns::$working_time;
			?>
            <ul>
				<?php
				foreach ($data as $k => $value) {
					if($k > 0){
					?>
                    <li><label><input type="checkbox" name="wkt" class="iCheck" value="<?= $k ?>"> <?= $value ?></label></li>
				<?php }} ?>
            </ul>
        </div>

        <h2 class="title-widget-sidebar">Mức lương</h2>
        <div class="content-widget-sidebar">
			<?php
            $data = \app\library\helper\Dropdowns::$salary;
			?>
            <ul>
                <?php
                foreach ($data as $k => $value) {
                    if($k > 0){
                        ?>
			            <li><label><input type="checkbox" name="salary" class="iCheck" value="<?= $k ?>"> <?= $value ?></label></li>
                    <?php }} ?>
            </ul>
        </div>

        <h2 class="title-widget-sidebar">Kinh nghiệm làm việc</h2>
        <div class="content-widget-sidebar">
			<?php
            $data = \app\library\helper\Dropdowns::$experience;
			?>
            <ul>
				<?php
				foreach ($data as $k => $value) {
                if($k > 0){
					?>
                    <li><label><input type="checkbox" name="exp" class="iCheck" value="<?= $k ?>"> <?= $value ?></label></li>
				<?php } } ?>
            </ul>
        </div>


        <button class="btn btn-primary w100"><i class="fa fa-search" style="top:3px"></i> TÌM KIẾM</button>
    </form>
</div>

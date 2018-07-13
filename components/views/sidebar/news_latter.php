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
use yii\widgets\ActiveForm;
?>

<div class="widget-sidebar">
    <?php $form = ActiveForm::begin([
        'method' => 'post',
        'action' => \app\library\helper\Helper::getInstance()->createUrl(['news-latter.html']),
        'options' => [
            'id' => 'formNewsLatter',
            'class' => 'form floating-label',
            'accept-charset' => 'utf-8',
        ],
    ]); ?>
	<h2 class="title-widget-sidebar">Đăng ký nhận tin</h2>
	<p>Bằng cách nhập email vào đây và nhấn gửi. Bạn sẽ nhận các tin mới nhất từ <?=\app\library\helper\Helper::getInstance()->params() ?></p>
    <?= $form->field($newsLatter, 'email', [
        'template' => '{label}<div class="input-group"><span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>{input}</div>{error}{hint}',
    ])->textInput(['data-enter' => 'ajax'])->label(false); ?>
	<button type="button" class="btn btn-primary ajaxForm"><i class="fas fa-location-arrow"></i> Đăng ký</button>
    <?php ActiveForm::end(); ?>
</div>
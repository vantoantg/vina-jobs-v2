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

return [
    'front' => [
        'class' => 'app\modules\front\Module',
    ],
    'admin' => [
        'class' => 'app\modules\admin\Module',
    ],
    'auth' => [
        'class' => 'app\modules\auth\Module',
    ],
    'user' => [
        'class' => 'app\modules\user\Module',
    ],
    'system' => [
        'class' => 'app\modules\system\Module',
    ],
    'common' => [
        'class' => 'app\modules\common\Module',
    ],
    'product' => [
        'class' => 'app\modules\product\Module',
    ],
    'contents' => [
        'class' => 'app\modules\contents\Module',
    ],
    'jobs' => [
        'class' => 'app\modules\jobs\Module',
    ],
    'redactor' => [
        'class' => 'yii\redactor\RedactorModule',
        'uploadDir' => '@webroot/uploads',
        'uploadUrl' => '@web/uploads',
        'imageAllowExtensions'=>['jpg','png','gif']
    ]
];
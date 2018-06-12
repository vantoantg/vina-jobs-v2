<?php

/*
 *  Created by Tona Nguyen.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
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
        'imageAllowExtensions' => ['jpg', 'png', 'gif'],
    ],
];

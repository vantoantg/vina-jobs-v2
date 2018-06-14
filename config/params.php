<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

$private = require __DIR__.'/private.php';

return [
    'adminEmail' => 'nguyennguyen.vt88@gmail.com',
    'adminSystemEmail' => 'admin@jobsvina.com',
    'companyLogoPath' => 'web/uploads/_company/',
    'companyCompanyGallery' => 'web/uploads/_company_gallery/',
    'companyCandidatePath' => 'web/uploads/_candidate/',

    'siteName' => 'Jobs Vina',
    'hotline' => '0932 252 414',
    'address' => '143/70 Gò Dầu, Phường Tân Quý, Quận Tân Phú, HCM',
    'seo' => [
        'title' => 'Tuyển dụng, tìm kiếm việc làm miễn phí tại jobs Vina nhanh chóng và hiệu quả',
        'description' => 'Tìm kiếm việc làm miễn phí - Tuyển dụng & Tìm kiếm việc làm nhanh, hiệu quả',
        'keywords' => 'tuyển dụng, tuyen dung, tìm kiếm việc làm, tìm việc làm miễn phí, tim kiem viec lam mien phi, dang tin mien phi, tìm ứng viên miễn phí, tìm hồ sơ tuyển dụng miễn phím sinh viên moi tot nghiep, đăng tin, dang tin tim viec, tìm việc làm lập trình web, lập trình php, kế toán, viec lam ban thi gian',
    ],
    'mail' => require __DIR__.'/email.php',
    'encrypt' => $private['encrypt'],
    'siteSetting' => [
        'urlCookied' => false,
    ],

    'gallery' => [
        'max' => 3,
    ],
];

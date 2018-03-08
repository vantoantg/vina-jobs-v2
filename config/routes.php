<?php

return [
	/* Url                                                              => Controller/action */
	'/' => 'front/default/index',
	'job-seekers.html' => 'site/job-seekers',
	'employeers.html' => 'site/employeers',
	'about-us.html' => 'site/about-us',
	'blog.html' => 'site/blog',
	'contact.html' => 'site/contact',

	'user/logout.html' => 'front/user/logout',
	'user/login.html' => 'front/user/login',

	'register/candidate.html' => 'front/user/register-candidate',
	'register/company.html' => 'front/user/register-company',
	'company/update.html' => 'front/user/update-company',

	'user/profile.html' => 'front/user/profile',
	'user/profile/<id:[a-zA-Z0-9_ -@.]+>.html' => 'front/user/view-profile',
	'user/forgot-password.html' => 'front/user/forgot',
	'user/change-password.html' => 'front/user/profile-change-password',
	'user/reset-password/<token:[a-zA-Z0-9_ -@.]+>.html' => 'front/user/profile-reset-password',

    // jobs
	'service/jobs/update/job-<id:[a-zA-Z0-9_ -@.]+>.html' => 'front/jobs/edit-jobs',
	'service/register-jobs.html' => 'front/jobs/post-jobs',

	'service/register-cv.html' => 'front/jobs/post-cv',
    'service/cv/update/<id:[a-zA-Z0-9_ -@.]+>.html' => 'front/jobs/edit-cv',



	/* Admin module
	Url                                                                 => 'module/controller/action
	*/
	'admin/login' => 'admin/login/index',
	'admin/logout' => 'admin/login/logout',
	'admin' => 'admin/default/index',

    /* Auth module
	*/
    '/auth'                 => 'auth/auth-assignment/index',
    '/auth/auth-assignment' => 'auth/auth-assignment/index',
    '/auth/auth-rule'       => 'auth/auth-rule/index',
    '/auth/auth-item'       => 'auth/auth-item/index',
    '/auth/auth-item-child' => 'auth/auth-item-child/index',

    /* User module
	*/
    '/user' => 'user/user/index',
    '/user/create' => 'user/user/create',

    /* User system
	*/
    '/system' => 'system/migration/index',
    '/system/migration' => 'system/migration/index',
















	/*'<username:[a-zA-Z0-9_ -@.]+>/view/<slug:[a-zA-Z0-9_ -]+>.html' => 'resume/view',
	'<username:[a-zA-Z0-9_ -@.]+>/update/<slug:[a-zA-Z0-9_ -]+>.html' => 'resume/update',
	'<username:[a-zA-Z0-9_ -@.]+>/profile.html' => 'profile/view',
	'<username:[a-zA-Z0-9_ -@.]+>/profile/update.html' => 'profile/update',
	'tin-tuc.html' => 'site/news',
	'tin-tuc/<slug:[a-zA-Z0-9_ -]+>.html' => 'site/news-detail',*/



];
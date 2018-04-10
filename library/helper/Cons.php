<?php
/**
 * Created by Tona Nguyễn
 * Date: 3/28/2017
 * Time: 11:35 AM
 */

namespace app\library\helper;

class Cons
{
    const
	        STATUS_ACTIVE = 1,
		    STATUS_DISABLED = 2,
		    STATUS_DRAFT = 0;
	const
		ARCHIVE_FALSE = 0,
		ARCHIVE_TRUE = 1;

	const
        ROUTE_ADMIN_ROOT = 'admin',

        ROUTE_AD_PAGE_LIST = '/admin/pages',
        ROUTE_AD_CAROUSEL_LIST = '/admin/carousel',
        ROUTE_AD_CAROUSEL_ITEM_LIST = '/admin/carousel-items',
        ROUTE_AD_CAROUSEL_TAGS_LIST = '/admin/tags',
        ROUTE_AD_PRODUCT_LIST = '/product/product',
        ROUTE_AD_PRODUCT_CATEGORY_LIST = '/product/product-category',
        ROUTE_AD_SYSTEM_SETTING_LIST = '/system/setting',
        ROUTE_AD_USER_LIST = '/user';

	const
		PAGE_HOME = 'home',
		PAGE_JOB_ABOUT_US = 'about-us.html',
		PAGE_BLOG = 'blog.html',
		PAGE_CONTACT = 'contact.html',
		PAGE_USER_PROFILE = 'user-profile-html',
		PAGE_REGISTER_CANDIDATE = 'register-candidate-html',
		PAGE_REGISTER_COMPANY = 'register-company-html',
		PAGE_JOB_SEEKERS = 'job-seekers-html',
		PAGE_EMPLOYEERS = 'employeers-html';

	/**
     * @var array
     */
    public static $a_target = [
        '_blank' => '_blank',
        '_self' => '_self',
        '_parent' => '_parent',
        '_top' => '_top',
    ];

	/**
	 * @var array
	 */
	public static $gender = [
		0 => '-- Chọn --',
		1 => 'Nữ',
		2 => 'Nam',
	];

	/**
	 * @var array
	 */
	public static $levels = [
		0 => '-- Chọn --',
		1 => 'Đại học',
		2 => 'Cao đẳng',
		3 => 'Trung cấp',
		4 => 'Cao học',
		5 => 'Trung học',
		6 => 'Chứng chỉ',
		7 => 'Lao động phổ thông',
	];

	/**
	 * @var array
	 */
	public static $experience = [
		0 => '-- Chọn --',
		1 => 'Chưa có kinh nghiệm',
		2 => 'Dưới 1 năm',
		3 => '1 năm',
		4 => '2 năm',
		5 => '3 năm',
		6 => '4 năm',
		7 => '5 năm',
		8 => 'Trên 5 năm',
	];

    /**
     * @var array
     */
    public static $working_time = [
        0 => '-- Chọn --',
        1 => 'Full time',
        2 => 'Part time',
    ];
}

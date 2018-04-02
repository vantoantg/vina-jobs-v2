<?php
/**
 * Created by Tona Nguyen.
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
}

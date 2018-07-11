<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\library\helper;

class Cons
{
    const
        STATUS_ACTIVE = 1;
    const STATUS_DISABLED = 2;
    const STATUS_DRAFT = 0;
    const
        ARCHIVE_FALSE = 0;
    const ARCHIVE_TRUE = 1;

    const TEMPLATE_FOLDER = 'web'; // TODO

    const
        ROUTE_ADMIN_ROOT = 'admin';
    const ROUTE_AD_PAGE_LIST = '/admin/pages';
    const ROUTE_AD_CAROUSEL_LIST = '/admin/carousel';
    const ROUTE_AD_CAROUSEL_ITEM_LIST = '/admin/carousel-items';
    const ROUTE_AD_CAROUSEL_TAGS_LIST = '/admin/tags';
    const ROUTE_AD_PRODUCT_LIST = '/product/product';
    const ROUTE_AD_PRODUCT_CATEGORY_LIST = '/product/product-category';
    const ROUTE_AD_SYSTEM_SETTING_LIST = '/system/setting';
    const ROUTE_AD_USER_LIST = '/user';

    const
        PAGE_HOME = 'home';
    const PAGE_JOB_ABOUT_US = 'about-us.html';
    const PAGE_BLOG = 'blog.html';
    const PAGE_CONTACT = 'contact.html';
    const PAGE_USER_PROFILE = 'user-profile-html';
    const PAGE_REGISTER_CANDIDATE = 'register-candidate-html';
    const PAGE_REGISTER_COMPANY = 'register-company-html';
    const PAGE_JOB_SEEKERS = 'job-seekers-html';
    const PAGE_EMPLOYERS = 'employers-html';

    const MSG_NEWS_LATTER_SUCCESS = 'Bạn đã đăng ký thành công!';
    const MSG_NEWS_LATTER_REGISTERED = 'Email này đã được đăng ký!';

	/**
	 * @var object Cons
	 */
	protected static $_instance;
	/**
	 * @return Cons
	 */
	public static function getInstance($refresh = false)
	{
		if ($refresh || !(self::$_instance instanceof self)) {
			self::$_instance = new self();
		}

		return self::$_instance;
	}

    /**
     * @return string
     */
    public static function getLoadingImg()
    {
        return Helper::getInstance()->homeUrl().'web/template/jobs/img/loading.gif';
    }

    /**
     * @return string
     */
    public static function getNoUserImg()
    {
        return Helper::getInstance()->homeUrl().'web/imgs/no_image_user.png';
    }

    /**
     * @return string
     */
    public static function getNoImg()
    {
        return Helper::getInstance()->homeUrl().'web/imgs/no-image.jpg';
    }

	/**
	 * @param $key
	 * @return bool|mixed
	 */
    public function settingSite($key)
    {
        $setting = [
        	'perPage' => 10
        ];

        return isset($setting[$key]) ? $setting[$key] : false;
    }
}

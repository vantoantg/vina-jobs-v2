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
        ROUTE_AD_PAGE_LIST = '/admin/pages',
        ROUTE_AD_CAROUSEL_LIST = '/admin/carousel';

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

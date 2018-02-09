<?php
namespace app\components\tona;

class Cons
{

    const
            IMG_DEFAULT_USER = '/web/images/defaults/noUser.jpg',
            IMG_DEFAULT_PROJECT = '/web/images/defaults/img-project-default.jpg',
            IMG_DEFAULT = '/web/images/defaults/img-default.jpg';

    const
            STATUS_ACTIVE = 1,
            STATUS_NONACTIVE = 2,
            STATUS_DRAFT = 0;

    const
            ARCHIVE_TRUE    = 1,
            ARCHIVE_FALSE   = 0;

    const   URL_EXT     = '.html';

    const   SQL_DATE        = 'Y-m-d',
            SQL_DATE_TIME   = 'Y-m-d H:i:s';

    const TEMPLATE_RESUME = 'recruitment';
    const TEMPLATE_FOLDER = 'taco';

    /**
     * @var array
     */
    public static $a_target = [
        '_blank' => '_blank',
        '_self' => '_self',
        '_parent' => '_parent',
        '_top' => '_top',
    ];

    const
        PAGE_TEMPLATE_FULL          = 1,
        PAGE_TEMPLATE_SIDEBAR_LEFT  = 2,
        PAGE_TEMPLATE_SIDEBAR_RIGHT   = 3;
    /**
     * @var array
     */
    public static $page_template = [
        self::PAGE_TEMPLATE_FULL            => 'Full page',
        self::PAGE_TEMPLATE_SIDEBAR_LEFT    => 'Sidebar left',
        self::PAGE_TEMPLATE_SIDEBAR_RIGHT     => 'Sidebar right',
    ];

    public function init(){

    }
}

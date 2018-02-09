<?php
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

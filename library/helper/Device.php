<?php
/**
 * Created by Tona Nguyễn
 * Date: 3/28/2017
 * Time: 11:35 AM
 */

namespace app\library\helper;

class Device
{
    protected static $_instance;

    /**
     * @return Device
     */
    public static function getInstance ()
    {
        if(!(self::$_instance instanceof self))
        {
            self::$_instance = new self();
        }

        return self::$_instance;
    }

    /**
     * @return int
     */
    public function isMoble()
    {
        $preg_match = "/(android|avantgo|blackberry|bolt|boost|cricket|docomo|fone|hiptop|mini|mobi|palm|phone|pie|tablet|up\.browser|up\.link|webos|wos)/i";
        return preg_match($preg_match, $_SERVER["HTTP_USER_AGENT"]);
    }
}

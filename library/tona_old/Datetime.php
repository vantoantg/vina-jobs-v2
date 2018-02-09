<?php
namespace app\components\tona;
use Carbon\Carbon;
use Yii;

class Datetime
{
    const
        SQL_DATE = 'Y-m-d',
        SQL_DATETIME = 'Y-m-d H:i:s',

        VIEW_DMY    = 'd M Y',
        VIEW_DATETIME    = 'H:i:s d/m/Y',
        VIEW_DATETIME_dmYHi     = 'd/m/Y H:i',
        VIEW_DATETIME_dmYHis    = 'd/m/Y H:i:s',
        VIEW_TIME           = 'H:m',

        FILE_TIME            = 'dmYHis',

        INPUT_DMY           = 'd/m/Y',
        INPUT_d_MM_Y        = 'd M Y',
        INPUT_d_MM_Y_Hi     = 'd M Y H:i',
        INPUT_MDY           = 'm/d/Y',
        INPUT_MDYHiA        = 'm/d/Y H:i A',
        INPUT_MDYHi         = 'm/d/Y H:i';

    const DEFAULT_TIME_ZONE = "Asia/Bangkok";

    public function init(){

    }

    /**
     * @param null $zone
     * @param null $format
     * @return string
     */
    public static function getDateNow($format = null, $zone = null){
        if($zone == null){
            $zone = Common::currentUser('timezone');
            if(!$zone){
                $zone = self::DEFAULT_TIME_ZONE;
            }
        }
        if($format == null){
            $format = self::VIEW_DATETIME;
        }
        $date = Carbon::now($zone);
        return $date->format($format);
    }

    /**
     * @param null $zone
     * @param null $format
     * @return string
     */
    public static function getTimeNow($zone = null, $format = null){
        if($zone == null){
            $zone = Common::currentUser('timezone');
        }
        if($format == null){
            $format = self::VIEW_TIME;
        }
        $date = Carbon::now($zone);
        return $date->format($format);
    }
}

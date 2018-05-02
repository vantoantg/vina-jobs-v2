<?php
/**
 * Created by Tona Nguyễn
 * Date: 3/28/2017
 * Time: 11:35 AM
 */

namespace app\library\helper;

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
	 * @return string
	 */
	public static function createdAt($zone = null){
		if($zone == null){
			$zone = Common::currentUser('timezone');
			if(!$zone){
				$zone = self::DEFAULT_TIME_ZONE;
			}
		}
		return Carbon::now($zone)->format(Datetime::SQL_DATETIME);
	}

    /**
     * @param null $zone
     * @param null $format
     * @return string
     */
    public static function getTimeNow($zone = null, $format = null){
        if($zone == null){
            $zone = Common::currentUser('timezone');
	        if(!$zone){
		        $zone = self::DEFAULT_TIME_ZONE;
	        }
        }
        if($format == null){
            $format = self::VIEW_TIME;
        }
        $date = Carbon::now($zone);
        return $date->format($format);
    }

    /**
     * @param $date
     * @param string $fomat
     * @return null|string
     */
    public static function todateSql($date, $fomat = 'd/m/Y'){
        if(!$date){
            return null;
        }
        return Carbon::createFromFormat($fomat, $date)->format(self::SQL_DATE);
    }

    /**
     * @param $datetime
     * @param string $fomat
     * @return null|string
     */
    public static function todatetimeSql($datetime, $fomat = 'd/m/Y'){
        if(!$datetime){
            return null;
        }
        return Carbon::createFromFormat($fomat, $datetime)->format(self::SQL_DATE);
    }

    /**
     * @param string $fomat
     * @param null $tz
     * @return string
     */
    public static function datetimeSqlNow($fomat = 'Y-m-d H:i:s', $tz = null){
    	if($tz == null){
		    $tz = Common::currentUser('timezone');
		    if($tz == false){
		    	$tz = Datetime::DEFAULT_TIME_ZONE;
		    }
	    }
        return Carbon::now($tz)->format($fomat);
    }

    /**
     * @param $date
     * @param string $format
     * @return string
     */
    public static function sqlDateToFormat($date, $format = 'd/m/Y'){
        if(!$date){
            return '--';
        }

        return Carbon::createFromFormat(self::SQL_DATE, $date)->format($format);
    }

    /**
     * @param $datetime
     * @param string $format
     * @return string
     */
    public static function sqlDatetimeToFormat($datetime, $format = 'd/m/Y'){
        if(!$datetime){
            return '';
        }

        return Carbon::createFromFormat(self::SQL_DATETIME, $datetime)->format($format);
    }

    /**
     * @param $datetime
     * @return string
     */
    public static function sqlDatetimeDiffForHumans($datetime){
        if(!$datetime){
            return '';
        }
        Carbon::setLocale(Yii::$app->language);
        return Carbon::createFromFormat(self::SQL_DATETIME, $datetime)->diffForHumans();
    }
}

<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\library\helper;

use Carbon\Carbon;
use Yii;

class Datetime
{
    const
        SQL_DATE = 'Y-m-d';
    const SQL_DATETIME = 'Y-m-d H:i:s';
    const VIEW_DMY = 'd M Y';
    const VIEW_DATETIME = 'H:i:s d/m/Y';
    const VIEW_DATETIME_dmYHi = 'd/m/Y H:i';
    const VIEW_DATETIME_dmYHis = 'd/m/Y H:i:s';
    const VIEW_TIME = 'H:m';
    const FILE_TIME = 'dmYHis';
    const INPUT_DMY = 'd/m/Y';
    const INPUT_d_MM_Y = 'd M Y';
    const INPUT_d_MM_Y_Hi = 'd M Y H:i';
    const INPUT_MDY = 'm/d/Y';
    const INPUT_MDYHiA = 'm/d/Y H:i A';
    const INPUT_MDYHi = 'm/d/Y H:i';

    const DEFAULT_TIME_ZONE = 'Asia/Bangkok';

    public function init()
    {
    }

    /**
     * @param null $zone
     * @param null $format
     *
     * @return string
     */
    public static function getDateNow($format = null, $zone = null)
    {
        if ($zone == null) {
            $zone = Common::currentUser('timezone');
            if (!$zone) {
                $zone = self::DEFAULT_TIME_ZONE;
            }
        }
        if ($format == null) {
            $format = self::VIEW_DATETIME;
        }
        $date = Carbon::now($zone);

        return $date->format($format);
    }

    /**
     * @param null $zone
     *
     * @return string
     */
    public static function createdAt($zone = null)
    {
        if ($zone == null) {
            $zone = Common::currentUser('timezone');
            if (!$zone) {
                $zone = self::DEFAULT_TIME_ZONE;
            }
        }

        return Carbon::now($zone)->format(Datetime::SQL_DATETIME);
    }

    /**
     * @param null $zone
     * @param null $format
     *
     * @return string
     */
    public static function getTimeNow($zone = null, $format = null)
    {
        if ($zone == null) {
            $zone = Common::currentUser('timezone');
            if (!$zone) {
                $zone = self::DEFAULT_TIME_ZONE;
            }
        }
        if ($format == null) {
            $format = self::VIEW_TIME;
        }
        $date = Carbon::now($zone);

        return $date->format($format);
    }

    /**
     * @param $date
     * @param string $fomat
     *
     * @return null|string
     */
    public static function todateSql($date, $fomat = 'd/m/Y')
    {
        if (!$date) {
            return null;
        }

        return Carbon::createFromFormat($fomat, $date)->format(self::SQL_DATE);
    }

    /**
     * @param $datetime
     * @param string $fomat
     *
     * @return null|string
     */
    public static function todatetimeSql($datetime, $fomat = 'd/m/Y')
    {
        if (!$datetime) {
            return null;
        }

        return Carbon::createFromFormat($fomat, $datetime)->format(self::SQL_DATE);
    }

    /**
     * @param string $fomat
     * @param null $tz
     *
     * @return string
     */
    public static function datetimeSqlNow($fomat = 'Y-m-d H:i:s', $tz = null)
    {
        if ($tz == null) {
            $tz = Common::currentUser('timezone');
            if ($tz == false) {
                $tz = Datetime::DEFAULT_TIME_ZONE;
            }
        }

        return Carbon::now($tz)->format($fomat);
    }

    /**
     * @param $date
     * @param string $format
     *
     * @return string
     */
    public static function sqlDateToFormat($date, $format = 'd/m/Y')
    {
        if (!$date) {
            return '--';
        }

        return Carbon::createFromFormat(self::SQL_DATE, $date)->format($format);
    }

    /**
     * @param $datetime
     * @param string $format
     *
     * @return string
     */
    public static function sqlDatetimeToFormat($datetime, $format = 'd/m/Y')
    {
        if (!$datetime) {
            return '';
        }

        return Carbon::createFromFormat(self::SQL_DATETIME, $datetime)->format($format);
    }

    /**
     * @param $datetime
     *
     * @return string
     */
    public static function sqlDatetimeDiffForHumans($datetime, $tz = null)
    {
        if (!$datetime) {
            return '';
        }
        if ($tz === null) {
            $tz = Helper::getTzUser();
        }
        Carbon::setLocale(Yii::$app->language);

        return Carbon::createFromFormat(self::SQL_DATETIME, $datetime, $tz)->diffForHumans();
    }
}

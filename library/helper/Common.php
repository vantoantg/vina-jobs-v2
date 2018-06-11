<?php
/**
 * Created by Tona Nguyễn
 * Date: 3/28/2017
 * Time: 11:35 AM
*/

namespace app\library\helper;

use Yii;

class Common
{
    public function init()
    {
    }

    /**
     * @return bool
     */
    public static function isLoginned()
    {
        if (Yii::$app->user->identity) {
            return true;
        }

        return false;
    }

    /**
     * No login
     * @return bool
     */
    public static function isGuest()
    {
        if (!Yii::$app->user->identity) {
            return true;
        }

        return false;
    }

    /**
     * @param string $key
     * @return string
     */
    public static function currentUser($key = 'id', $return = true)
    {
        if (Yii::$app->user->identity) {
            return Yii::$app->user->identity->$key;
        } else {
            if ($return) {
                return null;
            }
            return false;
        }
    }

    /**
     * @return bool|null|\yii\web\IdentityInterface
     */
    public static function currentUsers()
    {
        if (Yii::$app->user->identity) {
            return Yii::$app->user->identity;
        }
        return false;
    }
}

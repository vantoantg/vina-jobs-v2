<?php
namespace app\components\tona;

use Yii;
class Login
{
    public function init(){

    }

    /**
     * @param string $key
     * @return string
     */
    public static function checked(){
        if(Yii::$app->user->identity){
            return true;
        }else{
            return false;
        }
    }

    /**
     * @param $created_by
     * @return bool
     */
    public static function checkOwner($created_by){
        if(Yii::$app->user->identity){
            if(Role::allowAdmin(Yii::$app->user->identity->role) == false){
                if(Yii::$app->user->identity->getId() == $created_by){
                    return true;
                }else{
                    return false;
                }
            }else{
                return true;
            }
        }else{
            return false;
        }
    }
}

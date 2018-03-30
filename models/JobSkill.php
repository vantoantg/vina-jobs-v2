<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 3/30/2018
 * Time: 4:51 PM
 */

namespace app\models;


class JobSkill extends \app\models\base\JobSkill
{
    public static function getAllGroupSkill(){
        $table = self::tableName();
        $result = [];
        $sql = "SELECT * FROM $table";

        $data = \Yii::$app->db->createCommand($sql)->queryAll();

        foreach ($data as $item) {
            $result[$item['categories_id']][] = ['id' => $item['id'], 'name' => $item['name']];
        }

        return $result;
    }

    public static function getAllSkill(){
        $table = self::tableName();
        $sql = "SELECT * FROM $table";

        $data = \Yii::$app->db->createCommand($sql)->queryAll();

        return $data;
    }
}
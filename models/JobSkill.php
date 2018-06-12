<?php

/*
 *  Created by Tona Nguyen.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\models;

class JobSkill extends \app\models\base\JobSkill
{
    public static function getAllGroupSkill()
    {
        $table = self::tableName();
        $result = [];
        $sql = "SELECT * FROM $table";

        $data = \Yii::$app->db->createCommand($sql)->queryAll();

        foreach ($data as $item) {
            $result[$item['categories_id']][] = ['id' => $item['id'], 'name' => $item['name']];
        }

        return $result;
    }

    public static function getAllSkill()
    {
        $table = self::tableName();
        $sql = "SELECT * FROM $table";

        $data = \Yii::$app->db->createCommand($sql)->queryAll();

        return $data;
    }
}

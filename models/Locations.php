<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\models;

class Locations extends \app\models\base\Locations
{
    /**
     * @return array|\yii\db\ActiveRecord[]
     */
    public static function getLocations()
    {
        return self::find()
            ->select('id, name')
            ->where('parent_id = :parent_id and type = :type', [
                ':parent_id' => 64,
                ':type' => 3,
            ])
            ->orderBy(['arranged' => SORT_ASC])
            ->all();
    }

    /**
     * @return array
     */
    public static function getAll()
    {
        $data = [];
        $type = 3;
        $table = self::tableName();
        // TODO: Resort data in table
        $sql = "SELECT `id`, `name` FROM $table WHERE (`parent_id` = 64 and `type` = $type AND `id` != 84) order by `arranged` ASC, `name` ASC";
        $datas = \Yii::$app->db->createCommand($sql)->queryAll();

        foreach ($datas as $k => $rs) {
            $data[] = [
                'id' => $rs['id'],
                'name' => $rs['name'],
            ];
        }

        return $data;
    }
}

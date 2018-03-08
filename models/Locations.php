<?php
/**
 * Created by PhpStorm.
 * User: HP570
 * Date: 1/29/2018
 * Time: 5:32 PM
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
                ':type'      => 3
            ])
	        ->orderBy(['arranged' => SORT_ASC])
            ->all();
    }

    /**
     * @param bool $is_category
     * @param int $parent_id
     * @param string $space
     * @param array $trees
     * @return array
     */
    static public function categoriesMenus($is_category = true, $parent_id = 64, $space = "", $trees = [])
    {
        $type = 3;
        $table = self::tableName();
        if (!$trees) {
            $trees = [];
        }
        $sql = "SELECT * FROM $table WHERE (parent_id = {$parent_id}) and type = $type order by name asc";
        if (\Yii::$app->request->getQueryParam('id') && $is_category) {
            $id = \Yii::$app->request->getQueryParam('id');
            if ($id > 0) {
                $sql = "SELECT * FROM $table WHERE (parent_id = {$parent_id} AND id != {$id}) and type = $type order by name asc";
            }
        }
        $data = \Yii::$app->db->createCommand($sql)->queryAll();

        foreach ($data as $k => $rs) {
            $trees[] = array(
                'id' => $rs['id'],
                'name' => $space . $rs['name'],
            );
            $trees = self::categoriesMenus($is_category, $rs['id'], $space . ' - ', $trees);
        }

        return $trees;
    }
}
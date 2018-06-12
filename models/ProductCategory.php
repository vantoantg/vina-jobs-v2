<?php

/*
 *  Created by Tona Nguyen.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\models;

class ProductCategory extends \app\models\base\ProductCategory
{
    /**
     * @param bool $is_category
     * @param int $parent_id
     * @param string $space
     * @param array $trees
     *
     * @return array
     */
    public static function categoriesMenus($is_category = true, $parent_id = 0, $space = '', $trees = [])
    {
        $table = self::tableName();
        if (!$trees) {
            $trees = [];
        }
        $sql = "SELECT * FROM $table WHERE (parent_id = {$parent_id}) order by arranged asc";
        /*if (\Yii::$app->request->getQueryParam('id') && $is_category) {
            $id = \Yii::$app->request->getQueryParam('id');
            if ($id > 0) {
                $sql = "SELECT * FROM $table WHERE (parent_id = {$parent_id} AND id != {$id}) order by arranged asc";
            }
        }*/
        $data = \Yii::$app->db->createCommand($sql)->queryAll();
        foreach ($data as $k => $rs) {
            $trees[] = [
                'id' => $rs['id'],
                'name' => $space.$rs['name'],
                'arranged' => $rs['arranged'],
                'parent_id' => $rs['parent_id'],
            ];
            $trees = self::categoriesMenus($is_category, $rs['id'], $space.' - ', $trees);
        }

        return $trees;
    }

    /**
     * @return string
     */
    public function getCategoryName()
    {
        $model = ProductCategory::findOne($this->parent_id);
        if ($model) {
            return $model->name;
        }

        return '--';
    }
}

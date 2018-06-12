<?php

/*
 *  Created by Tona Nguyễn.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: Hồ Chí Minh, Việt Nam
 *  Website: https://jobsvina.com/
 */

namespace app\models;

class PostCategory extends \app\models\base\PostCategory
{
    const   STATUS_ACTIVE = 1;
    const STATUS_DRAFT = 0;

    /**
     * @param bool $insert
     *
     * @return bool
     */
    public function beforeSave($insert)
    {
        /*if ($this->isNewRecord) {
        } else {
        }*/
        return parent::beforeSave($insert);
    }

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
            $id = Yii::$app->request->getQueryParam('id');
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
}

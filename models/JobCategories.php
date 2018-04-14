<?php

namespace app\models;

class JobCategories extends \app\models\base\JobCategories
{
	const STATUS_ACTIVE = 1;

	/**
	 * @return array
	 */
    static public function getAll(){
	    $data = [];
	    $type = 3;
	    $table = self::tableName();
	    // TODO: Resort data in table
	    $sql = "SELECT `id`, `name` FROM $table WHERE (`parent_id` <> 0 and `status` = 1) order by `arranged` ASC, `name` ASC";
	    $datas = \Yii::$app->db->createCommand($sql)->queryAll();

	    foreach ($datas as $k => $rs) {
		    $data[] = array(
			    'id' => $rs['id'],
			    'name' => $rs['name'],
		    );
	    }

	    return $data;
    }

	/**
	 * @param bool $is_category
	 * @param int $parent_id
	 * @param string $space
	 * @param array $trees
	 * @return array
	 */
    static public function categoriesMenus($is_category = true, $parent_id = 0, $space = "", $trees = [])
    {
	    $status = self::STATUS_ACTIVE;
        $table = self::tableName();
        if (!$trees) {
            $trees = [];
        }
        $sql = "SELECT * FROM $table WHERE (parent_id = {$parent_id}) and status = $status order by arranged asc";
        if (\Yii::$app->request->getQueryParam('id') && $is_category) {
            $id = Yii::$app->request->getQueryParam('id');
            if ($id > 0) {
                $sql = "SELECT * FROM $table WHERE (parent_id = {$parent_id} AND id != {$id}) and status = $status order by arranged asc";
            }
        }
        $data = \Yii::$app->db->createCommand($sql)->queryAll();
        foreach ($data as $k => $rs) {
            $trees[] = array(
                'id' => $rs['id'],
                'name' => $space . $rs['name'],
                'arranged' => $rs['arranged'],
                'parent_id' => $rs['parent_id'],
            );
            $trees = self::categoriesMenus($is_category, $rs['id'], $space . ' - ', $trees);
        }

        return $trees;
    }
}

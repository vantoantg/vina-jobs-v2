<?php
/**
 * Created by PhpStorm.
 * User: HP570
 * Date: 1/29/2018
 * Time: 5:32 PM
 */

namespace app\models;


class ProductCategory extends \app\models\base\ProductCategory
{

    /**
     * @param bool $is_category
     * @param int $parent_id
     * @param string $space
     * @param array $trees
     * @return array
     */
	static public function categoriesMenus($is_category = true, $parent_id = 0, $space = "", $trees = [])
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
<?php
/**
 * Created by Tona Nguyễn
 * Date: 1/29/2018
 * Time: 5:32 PM
 */

namespace app\models;


use app\library\helper\Common;
use app\library\helper\Datetime;
use yii\data\ActiveDataProvider;

class Post extends \app\models\base\Post
{
	/**
	 * @param bool $insert
	 * @return bool
	 */
	public function beforeSave($insert)
	{
		if ($this->isNewRecord) {
			$this->created_at = Datetime::datetimeSqlNow();
			$this->updated_at = Datetime::datetimeSqlNow();
			$this->created_by = Common::currentUsers()->getId();
			$this->updated_by = Common::currentUsers()->getId();
		} else {
			$this->updated_at = Datetime::datetimeSqlNow();
			$this->updated_by = Common::currentUsers()->getId();
		}

		return parent::beforeSave($insert);
	}

	/**
	 * @param int $except
	 * @return array|null|\yii\db\ActiveRecord[]
	 */
	public static function getList($except = 0){
		$model = self::find()
			->select(['id', 'name'])
			->where(['<>', 'id', $except])
			->all();
		if($model){
			return $model;
		}

		return null;
	}

	public function search($params)
	{
		$query = Post::find();

		// add conditions that should always apply here

		$dataProvider = new ActiveDataProvider([
			'query' => $query,
		]);

		$this->load($params);

		if (!$this->validate()) {
			// uncomment the following line if you do not want to return any records when validation fails
			// $query->where('0=1');
			return $dataProvider;
		}

		// grid filtering conditions
		$query->andFilterWhere([
			'id' => $this->id,
			'parent_id' => $this->parent_id,
			'view' => $this->view,
			'pape_template' => $this->pape_template,
			'created_by' => $this->created_by,
			'updated_by' => $this->updated_by,
			'created_at' => $this->created_at,
			'updated_at' => $this->updated_at,
			'status' => $this->status,
		]);

		$query->andFilterWhere(['like', 'name', $this->name])
			->andFilterWhere(['like', 'slug', $this->slug])
			->andFilterWhere(['like', 'content', $this->content])
			->andFilterWhere(['like', 'seo_title', $this->seo_title])
			->andFilterWhere(['like', 'seo_keyword', $this->seo_keyword])
			->andFilterWhere(['like', 'seo_description', $this->seo_description])
			->andFilterWhere(['like', 'img', $this->img]);

		return $dataProvider;
	}
}
<?php

/*
 *  Created by Tona Nguyen.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\models;

use app\library\helper\Common;
use app\library\helper\Datetime;
use yii\data\ActiveDataProvider;

class Post extends \app\models\base\Post
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
     *
     * @return array|null|\yii\db\ActiveRecord[]
     */
    public static function getList($except = 0)
    {
        $model = self::find()
            ->select(['id', 'name'])
            ->where(['<>', 'id', $except])
            ->all();
        if ($model) {
            return $model;
        }

        return null;
    }

    public function search($params)
    {
        $query = Post::find()->alias('post');
        $query->join('INNER JOIN', 'tn_post_category post_cat', 'post.post_category_id = post_cat.id AND post_cat.slug = :slug', ['slug' => 'jobsvina-com']);
        $query->where(['post.status' => Post::STATUS_ACTIVE, 'post_cat.status' => PostCategory::STATUS_ACTIVE]);
        $query->orderBy(['post.arranged' => SORT_DESC, 'post.created_at' => SORT_DESC]);
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

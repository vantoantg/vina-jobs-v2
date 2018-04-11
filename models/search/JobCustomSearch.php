<?php

namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Job as JobModel;

/**
 * Pages represents the model behind the search form of `app\models\Pages`.
 */
class JobCustomSearch extends JobModel
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [

        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = JobModel::find()->select(['title']);

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
            'status' => 1,
        ]);

        if(isset($params['keywords'])){
//            $query->andFilterWhere(['like', 'title', $params['keywords']]);
        }

        if(isset($params['jobs'])){
//            $query->andFilterWhere(['in', 'categories_id', $params['jobs']]);
        }
//            ->andFilterWhere(['like', 'slug', $this->slug])
//            ->andFilterWhere(['like', 'content', $this->content])
//            ->andFilterWhere(['like', 'seo_title', $this->seo_title])
//            ->andFilterWhere(['like', 'seo_keyword', $this->seo_keyword])
//            ->andFilterWhere(['like', 'seo_description', $this->seo_description]);

        return $dataProvider;
    }
}

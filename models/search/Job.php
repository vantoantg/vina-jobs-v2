<?php

namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Job as JobModel;

/**
 * Job represents the model behind the search form of `app\models\Job`.
 */
class Job extends JobModel
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'categories_id', 'company_id', 'salary', 'working_time', 'created_by', 'updated_by', 'approved_by', 'arrange', 'star', 'client_status', 'status'], 'integer'],
            [['title', 'slug', 'description', 'content', 'tags', 'keyword', 'address', 'created_at', 'updated_at', 'effect_date', 'end_date', 'approved_at'], 'safe'],
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
        $query = JobModel::find();

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
            'categories_id' => $this->categories_id,
            'company_id' => $this->company_id,
            'salary' => $this->salary,
            'working_time' => $this->working_time,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'effect_date' => $this->effect_date,
            'end_date' => $this->end_date,
            'approved_at' => $this->approved_at,
            'approved_by' => $this->approved_by,
            'arrange' => $this->arrange,
            'star' => $this->star,
            'client_status' => $this->client_status,
            'status' => $this->status,
        ]);

        $query->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'slug', $this->slug])
            ->andFilterWhere(['like', 'description', $this->description])
            ->andFilterWhere(['like', 'content', $this->content])
            ->andFilterWhere(['like', 'tags', $this->tags])
            ->andFilterWhere(['like', 'keyword', $this->keyword])
            ->andFilterWhere(['like', 'address', $this->address]);

        return $dataProvider;
    }
}

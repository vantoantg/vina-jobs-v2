<?php

/*
 *  Created by Tona Nguyen.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Events;

/**
 * EventsSearch represents the model behind the search form about `app\models\Events`.
 */
class EventsSearch extends Events
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'user_id', 'type_id', 'all_day', 'editable', 'startEditable', 'durationEditable', 'resourceEditable', 'overlap', 'status'], 'integer'],
            [['title', 'slug', 'start', 'end', 'url', 'className', 'rendering', 'constraint', 'source', 'color', 'backgroundColor', 'borderColor', 'textColor'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
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
        $query = Events::find();

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
            'user_id' => $this->user_id,
            'type_id' => $this->type_id,
            'all_day' => $this->all_day,
            'start' => $this->start,
            'end' => $this->end,
            'editable' => $this->editable,
            'startEditable' => $this->startEditable,
            'durationEditable' => $this->durationEditable,
            'resourceEditable' => $this->resourceEditable,
            'overlap' => $this->overlap,
            'status' => $this->status,
        ]);

        $query->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'slug', $this->slug])
            ->andFilterWhere(['like', 'url', $this->url])
            ->andFilterWhere(['like', 'className', $this->className])
            ->andFilterWhere(['like', 'rendering', $this->rendering])
            ->andFilterWhere(['like', 'constraint', $this->constraint])
            ->andFilterWhere(['like', 'source', $this->source])
            ->andFilterWhere(['like', 'color', $this->color])
            ->andFilterWhere(['like', 'backgroundColor', $this->backgroundColor])
            ->andFilterWhere(['like', 'borderColor', $this->borderColor])
            ->andFilterWhere(['like', 'textColor', $this->textColor]);

        return $dataProvider;
    }
}

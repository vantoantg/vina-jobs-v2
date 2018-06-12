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
use app\models\CacheImg;

/**
 * CacheImgSearch represents the model behind the search form about `app\models\CacheImg`.
 */
class CacheImgSearch extends CacheImg
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'object_id'], 'integer'],
            [['object_type', 'img_size', 'img_path', 'created_at'], 'safe'],
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
        $query = CacheImg::find();

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
            'object_id' => $this->object_id,
            'created_at' => $this->created_at,
        ]);

        $query->andFilterWhere(['like', 'object_type', $this->object_type])
            ->andFilterWhere(['like', 'img_size', $this->img_size])
            ->andFilterWhere(['like', 'img_path', $this->img_path]);

        return $dataProvider;
    }
}

<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\CarouselItems as CarouselItemsModel;

/**
 * CarouselItems represents the model behind the search form of `app\models\CarouselItems`.
 */
class CarouselItems extends CarouselItemsModel
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'carousel_id', 'sorted'], 'integer'],
            [['img_thum', 'img_view', 'img_original', 'title', 'description', 'link', 'target', 'status'], 'safe'],
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
        $query = CarouselItemsModel::find();

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
            'carousel_id' => $this->carousel_id,
            'sorted' => $this->sorted,
        ]);

        $query->andFilterWhere(['like', 'img_thum', $this->img_thum])
            ->andFilterWhere(['like', 'img_view', $this->img_view])
            ->andFilterWhere(['like', 'img_original', $this->img_original])
            ->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'description', $this->description])
            ->andFilterWhere(['like', 'link', $this->link])
            ->andFilterWhere(['like', 'target', $this->target])
            ->andFilterWhere(['like', 'status', $this->status]);

        return $dataProvider;
    }
}

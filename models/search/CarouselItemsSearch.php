<?php

namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\CarouselItems;

/**
 * CarouselItemsSearch represents the model behind the search form about `app\models\CarouselItems`.
 */
class CarouselItemsSearch extends CarouselItems
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'carousel_id', 'sorted', 'status'], 'integer'],
            [['img_thum', 'img_view', 'img_original', 'title', 'description', 'link'], 'safe'],
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
    public function search($params, $carousel_id = false)
    {
        $query = CarouselItems::find();

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
            'status' => $this->status,
        ]);

        $query->andFilterWhere(['like', 'img_thum', $this->img_thum])
            ->andFilterWhere(['like', 'img_view', $this->img_view])
            ->andFilterWhere(['like', 'img_original', $this->img_original])
            ->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'description', $this->description])
            ->andFilterWhere(['like', 'link', $this->link]);

        if ($carousel_id) {
            $query->andWhere(['carousel_id' => $carousel_id]);
        }

        return $dataProvider;
    }
}

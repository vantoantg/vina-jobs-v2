<?php

namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Product as ProductModel;

/**
 * Product represents the model behind the search form of `app\models\Product`.
 */
class Product extends ProductModel
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'category_id', 'view', 'is_comment', 'arranged', 'status', 'is_deleted', 'created_by', 'updated_by'], 'integer'],
            [['name', 'description', 'content', 'image', 'slug', 'created_at', 'updated_at'], 'safe'],
            [['price_in', 'price_out', 'price_sale', 'quantity_remaining'], 'number'],
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
        $query = ProductModel::find();

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
            'category_id' => $this->category_id,
            'price_in' => $this->price_in,
            'price_out' => $this->price_out,
            'price_sale' => $this->price_sale,
            'quantity_remaining' => $this->quantity_remaining,
            'view' => $this->view,
            'is_comment' => $this->is_comment,
            'arranged' => $this->arranged,
            'status' => $this->status,
            'is_deleted' => $this->is_deleted,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'description', $this->description])
            ->andFilterWhere(['like', 'content', $this->content])
            ->andFilterWhere(['like', 'image', $this->image])
            ->andFilterWhere(['like', 'slug', $this->slug]);

        return $dataProvider;
    }
}

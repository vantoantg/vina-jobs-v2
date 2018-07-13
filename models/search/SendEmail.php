<?php

namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\SendEmail as SendEmailModel;

/**
 * SendEmail represents the model behind the search form of `app\models\SendEmail`.
 */
class SendEmail extends SendEmailModel
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'is_sent', 'sent_by', 'resent'], 'integer'],
            [['send_to', 'send_cc', 'subject', 'content', 'attach', 'template', 'sent_date', 'created_at'], 'safe'],
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
        $query = SendEmailModel::find();

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
            'is_sent' => $this->is_sent,
            'sent_date' => $this->sent_date,
            'sent_by' => $this->sent_by,
            'resent' => $this->resent,
            'created_at' => $this->created_at,
        ]);

        $query->andFilterWhere(['like', 'send_to', $this->send_to])
            ->andFilterWhere(['like', 'send_cc', $this->send_cc])
            ->andFilterWhere(['like', 'subject', $this->subject])
            ->andFilterWhere(['like', 'content', $this->content])
            ->andFilterWhere(['like', 'attach', $this->attach])
            ->andFilterWhere(['like', 'template', $this->template]);

        return $dataProvider;
    }
}

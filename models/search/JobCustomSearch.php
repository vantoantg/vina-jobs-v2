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
use app\models\Job as JobModel;
use yii\db\Query;

/**
 * Pages represents the model behind the search form of `app\models\Pages`.
 */
class JobCustomSearch extends JobModel
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
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
        $query = new Query();
	    $query->select([
	    	'job.id as job_id',
	    	'job.title as job_name',
		    'job.slug',
		    'job.cv_end_date',
		    'job.salary',
		    'job.working_time',
		    'job.created_at',
		    'com.id as com_id',
		    'com.name as com_name',
		    'com.logo as com_logo',
		    'job_cat.name AS cat_name',
		    'loca.name AS loca_name',
	    ])
		    ->from(\app\models\Job::tableName(). ' job')
	        ->innerJoin(\app\models\Company::tableName().' com', 'com.id = job.company_id')
		    ->innerJoin('tn_job_categories job_cat', 'job_cat.id = job.categories_id')
		    ->leftJoin('tn_locations loca', 'loca.id = job.address');

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
            'job.status' => 1,
            'job.client_status' => \app\models\Job::STATUS_CLIENT_PUBLISH,
        ]);

        if (isset($params['keywords'])) {
            $query->andFilterWhere(['like', 'job.title', $params['keywords']]);
            $query->orFilterWhere(['like', 'job.keyword', $params['keywords']]);
            $query->orFilterWhere(['like', 'job.content', $params['keywords']]);
	        $query->orFilterWhere(['like', 'job.description', $params['keywords']]);
	        $query->orFilterWhere(['like', 'com.name', $params['keywords']]);
	        $query->orFilterWhere(['like', 'com.content', $params['keywords']]);
        }

        if (isset($params['jobs'])) {
            $query->andFilterWhere(['in', 'job.categories_id', $params['jobs']]);
        }

	    if (isset($params['loca'])) {
		    $query->andFilterWhere(['in', 'job.address', $params['loca']]);
	    }

	    if (isset($params['wkt'])) {
		    $query->andFilterWhere(['in', 'job.working_time', $params['wkt']]);
	    }

	    if (isset($params['salary'])) {
		    $query->andFilterWhere(['in', 'job.salary', $params['salary']]);
	    }

	    if (isset($params['exp'])) {
		    // TODO: Add more field
//		    $query->andFilterWhere(['in', 'job.categories_id', $params['exp']]);
	    }
//            ->andFilterWhere(['like', 'slug', $this->slug])
//            ->andFilterWhere(['like', 'content', $this->content])
//            ->andFilterWhere(['like', 'seo_title', $this->seo_title])
//            ->andFilterWhere(['like', 'seo_keyword', $this->seo_keyword])
//            ->andFilterWhere(['like', 'seo_description', $this->seo_description]);

        return $dataProvider;
    }
}

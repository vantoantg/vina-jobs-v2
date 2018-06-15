<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\models;

use app\library\helper\Common;
use app\library\helper\Datetime;

class CurriculumVitae extends \app\models\base\CurriculumVitae
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tn_curriculum_vitae';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['categories_id', 'title', 'content', 'salary'], 'required'],
            [['categories_id', 'created_by', 'updated_by', 'approved_by', 'arrange', 'star', 'status'], 'integer'],
            [['description', 'content'], 'string'],
            [['created_at', 'updated_at', 'effect_date', 'end_date', 'approved_at'], 'safe'],
            [['title', 'name', 'tags', 'keyword', 'salary', 'address'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'categories_id' => 'Categories ID',
            'title' => 'Title',
            'name' => 'Name',
            'description' => 'Description',
            'content' => 'Content',
            'tags' => 'Tags',
            'keyword' => 'Keyword',
            'salary' => 'Salary',
            'address' => 'Address',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'effect_date' => 'Effect Date',
            'end_date' => 'End Date',
            'approved_at' => 'Approved At',
            'approved_by' => 'Approved By',
            'arrange' => 'Arrange',
            'star' => 'Star',
            'status' => 'Status',
        ];
    }

    public function beforeSave($insert)
    {
        if ($this->isNewRecord) {
            $this->effect_date = Datetime::getTimeNow(null, Datetime::SQL_DATETIME);
            $this->created_at = Datetime::getTimeNow(null, Datetime::SQL_DATETIME);
            $this->updated_at = Datetime::getTimeNow(null, Datetime::SQL_DATETIME);
            $this->updated_by = Common::currentUser();
            $this->created_by = Common::currentUser();
        } else {
            $this->updated_at = Datetime::getTimeNow(null, Datetime::SQL_DATETIME);
            $this->updated_by = Common::currentUser();
        }

        return parent::beforeSave($insert);
    }
}

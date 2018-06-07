<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "tn_jobs".
 *
 * @property string $id
 * @property int $categories_id
 * @property int $company_id
 * @property string $title
 * @property string $slug
 * @property string $description
 * @property string $content
 * @property string $cv_end_date
 * @property string $tags
 * @property string $keyword
 * @property int $salary
 * @property int $working_time
 * @property string $address
 * @property int $created_by
 * @property int $updated_by
 * @property string $created_at
 * @property string $updated_at
 * @property string $effect_date
 * @property string $end_date
 * @property string $approved_at
 * @property int $approved_by
 * @property int $arrange
 * @property int $star
 * @property int $client_status
 * @property int $status
 */
class Jobs extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tn_jobs';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['categories_id', 'company_id', 'salary', 'working_time', 'created_by', 'updated_by', 'approved_by', 'arrange', 'star', 'client_status', 'status'], 'integer'],
            [['description', 'content'], 'string'],
            [['cv_end_date', 'created_at', 'updated_at', 'effect_date', 'end_date', 'approved_at'], 'safe'],
            [['title', 'slug', 'tags', 'keyword', 'address'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'categories_id' => 'Categories ID',
            'company_id' => 'Company ID',
            'title' => 'Title',
            'slug' => 'Slug',
            'description' => 'Description',
            'content' => 'Content',
            'cv_end_date' => 'Cv End Date',
            'tags' => 'Tags',
            'keyword' => 'Keyword',
            'salary' => 'Salary',
            'working_time' => 'Working Time',
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
            'client_status' => 'Client Status',
            'status' => 'Status',
        ];
    }
}

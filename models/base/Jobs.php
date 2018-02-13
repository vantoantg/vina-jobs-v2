<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "tn_jobs".
 *
 * @property int $id
 * @property int $categories_id
 * @property int $company_id
 * @property string $title
 * @property string $name
 * @property string $description
 * @property string $content
 * @property string $tags
 * @property string $keyword
 * @property string $salary
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
            [['categories_id', 'company_id', 'created_by', 'updated_by', 'approved_by', 'arrange', 'star', 'status'], 'integer'],
            [['description', 'content'], 'string'],
            [['created_at', 'updated_at', 'effect_date', 'end_date', 'approved_at'], 'safe'],
            [['title', 'name', 'tags', 'keyword', 'salary', 'address'], 'string', 'max' => 255],
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
}

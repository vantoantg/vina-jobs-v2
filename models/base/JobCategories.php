<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "tn_job_categories".
 *
 * @property int $id
 * @property int $parent_id
 * @property string $name
 * @property string $description
 * @property string $icon_class
 * @property string $image
 * @property string $created_at
 * @property string $updated_at
 * @property int $created_by
 * @property int $updated_by
 * @property int $arrange
 * @property int $total_jobs
 * @property int $total_cv
 * @property int $status
 */
class JobCategories extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tn_job_categories';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['parent_id', 'created_by', 'updated_by', 'arrange', 'total_jobs', 'total_cv', 'status'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['name'], 'string', 'max' => 11],
            [['description', 'icon_class', 'image'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'parent_id' => 'Parent ID',
            'name' => 'Name',
            'description' => 'Description',
            'icon_class' => 'Icon Class',
            'image' => 'Image',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'arrange' => 'Arrange',
            'total_jobs' => 'Total Jobs',
            'total_cv' => 'Total Cv',
            'status' => 'Status',
        ];
    }
}

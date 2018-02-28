<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "tn_company".
 *
 * @property int $id
 * @property int $location_id
 * @property string $name
 * @property string $logo
 * @property string $content
 * @property int $created_by
 * @property string $created_at
 * @property int $status
 * @property int $arranged
 */
class Company extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tn_company';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['location_id', 'created_by', 'status', 'arranged'], 'integer'],
            [['content'], 'string'],
            [['created_at'], 'safe'],
            [['name', 'logo'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'location_id' => 'Location ID',
            'name' => 'Name',
            'logo' => 'Logo',
            'content' => 'Content',
            'created_by' => 'Created By',
            'created_at' => 'Created At',
            'status' => 'Status',
            'arranged' => 'Arranged',
        ];
    }
}

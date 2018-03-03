<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "tn_locations".
 *
 * @property integer $int
 * @property integer $parent_id
 * @property string $name
 * @property string $description
 * @property integer $type
 * @property integer $status
 */
class Locations extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tn_locations';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['parent_id', 'type', 'status'], 'integer'],
            [['name', 'description'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'int' => 'Int',
            'parent_id' => 'Parent ID',
            'name' => 'Name',
            'description' => 'Description',
            'type' => 'Type',
            'status' => 'Status',
        ];
    }
}

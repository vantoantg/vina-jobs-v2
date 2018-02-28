<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "tn_dropdown".
 *
 * @property int $id
 * @property int $type
 * @property string $name
 * @property string $decription
 * @property int $aranged
 * @property int $status
 */
class Dropdown extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tn_dropdown';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['type', 'name'], 'required'],
            [['type', 'aranged', 'status'], 'integer'],
            [['decription'], 'string'],
            [['name'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'type' => 'Type',
            'name' => 'Name',
            'decription' => 'Decription',
            'aranged' => 'Aranged',
            'status' => 'Status',
        ];
    }
}

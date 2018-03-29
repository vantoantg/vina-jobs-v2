<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "tn_setting".
 *
 * @property int $id
 * @property string $name
 * @property string $code
 * @property string $value
 * @property string $default
 * @property int $sorted
 * @property string $input
 */
class Setting extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tn_setting';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'code'], 'required'],
            [['sorted'], 'integer'],
            [['input'], 'string'],
            [['name'], 'string', 'max' => 255],
            [['code', 'value', 'default'], 'string', 'max' => 55],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'code' => 'Code',
            'value' => 'Value',
            'default' => 'Default',
            'sorted' => 'Sorted',
            'input' => 'Input',
        ];
    }
}

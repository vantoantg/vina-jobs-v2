<?php

/*
 *  Created by Tona Nguyễn.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: Hồ Chí Minh, Việt Nam
 *  Website: https://jobsvina.com/
 */

namespace app\models\base;

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
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tn_setting';
    }

    /**
     * {@inheritdoc}
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
     * {@inheritdoc}
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

<?php

/*
 *  Created by Tona Nguyen.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\models\base;

/**
 * This is the model class for table "tn_system".
 *
 * @property integer $id
 * @property string $name
 * @property string $code
 * @property string $value
 * @property integer $value_number
 * @property string $default
 */
class System extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tn_system';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'code'], 'required'],
            [['value_number'], 'integer'],
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
            'value_number' => 'Value Number',
            'default' => 'Default',
        ];
    }
}

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
 * This is the model class for table "tn_dropdown".
 *
 * @property int $id
 * @property int $type
 * @property string $name
 * @property string $decription
 * @property int $arranged
 * @property int $status
 */
class Dropdown extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tn_dropdown';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['type', 'name'], 'required'],
            [['type', 'arranged', 'status'], 'integer'],
            [['decription'], 'string'],
            [['name'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'type' => 'Type',
            'name' => 'Name',
            'decription' => 'Decription',
            'arranged' => 'Aranged',
            'status' => 'Status',
        ];
    }
}

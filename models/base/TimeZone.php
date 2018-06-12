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
 * This is the model class for table "tn_time_zone".
 *
 * @property integer $id
 * @property string $name
 * @property string $code
 * @property string $utc
 * @property integer $sorted
 * @property integer $status
 */
class TimeZone extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tn_time_zone';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['sorted', 'status'], 'integer'],
            [['name', 'code'], 'string', 'max' => 155],
            [['utc'], 'string', 'max' => 15],
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
            'utc' => 'Utc',
            'sorted' => 'Sorted',
            'status' => 'Status',
        ];
    }
}

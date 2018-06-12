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
 * This is the model class for table "tn_company".
 *
 * @property string $id
 * @property int $location_id
 * @property string $name
 * @property string $logo
 * @property string $website
 * @property string $content
 * @property int $scale
 * @property string $address
 * @property string $phone
 * @property string $fax
 * @property string $tax_id
 * @property int $created_by
 * @property string $created_at
 * @property int $status
 * @property int $arranged
 */
class Company extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tn_company';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['location_id', 'scale', 'created_by', 'status', 'arranged'], 'integer'],
            [['content'], 'string'],
            [['created_at'], 'safe'],
            [['name', 'logo', 'website', 'address', 'phone', 'fax', 'tax_id'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'location_id' => 'Location ID',
            'name' => 'Name',
            'logo' => 'Logo',
            'website' => 'Website',
            'content' => 'Content',
            'scale' => 'Scale',
            'address' => 'Address',
            'phone' => 'Phone',
            'fax' => 'Fax',
            'tax_id' => 'Tax ID',
            'created_by' => 'Created By',
            'created_at' => 'Created At',
            'status' => 'Status',
            'arranged' => 'Arranged',
        ];
    }
}

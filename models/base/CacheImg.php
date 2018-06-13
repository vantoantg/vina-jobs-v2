<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\models\base;

/**
 * This is the model class for table "tn_cache_img".
 *
 * @property integer $id
 * @property integer $object_id
 * @property string $object_type
 * @property string $img_size
 * @property string $img_path
 * @property string $created_at
 */
class CacheImg extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tn_cache_img';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['object_id', 'object_type', 'img_path'], 'required'],
            [['object_id'], 'integer'],
            [['created_at'], 'safe'],
            [['object_type', 'img_size'], 'string', 'max' => 25],
            [['img_path'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'object_id' => 'Object ID',
            'object_type' => 'Object Type',
            'img_size' => 'Img Size',
            'img_path' => 'Img Path',
            'created_at' => 'Created At',
        ];
    }
}

<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "tn_news_latter".
 *
 * @property int $id
 * @property int $user_id
 * @property string $email
 * @property int $is_follow
 * @property string $created_at
 * @property string $updated_at
 */
class NewsLatter extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tn_news_latter';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'is_follow'], 'integer'],
            [['email'], 'required'],
            [['created_at', 'updated_at'], 'safe'],
            [['email'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => 'User ID',
            'email' => 'Email',
            'is_follow' => 'Is Follow',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }
}

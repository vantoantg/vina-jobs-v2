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
 * This is the model class for table "tn_comment".
 *
 * @property int $id
 * @property int $parent_id
 * @property int $object_id
 * @property resource $object_type
 * @property string $comment
 * @property string $created_by
 * @property string $created_at
 * @property int $is_deleted
 */
class Comment extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tn_comment';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['parent_id', 'object_id', 'is_deleted'], 'integer'],
            [['object_type', 'comment', 'created_by', 'created_at'], 'required'],
            [['created_at'], 'safe'],
            [['object_type'], 'string', 'max' => 55],
            [['comment'], 'string', 'max' => 200],
            [['created_by'], 'string', 'max' => 40],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'parent_id' => 'Parent ID',
            'object_id' => 'Object ID',
            'object_type' => 'Object Type',
            'comment' => 'Comment',
            'created_by' => 'Created By',
            'created_at' => 'Created At',
            'is_deleted' => 'Is Deleted',
        ];
    }
}

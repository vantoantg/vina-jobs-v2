<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "tn_post".
 *
 * @property int $id
 * @property int $post_category_id
 * @property string $name
 * @property string $slug
 * @property string $description
 * @property string $content
 * @property string $img
 * @property int $view
 * @property int $sorted
 * @property int $created_by
 * @property string $created_at
 * @property int $updated_by
 * @property string $updated_at
 * @property int $arranged
 * @property int $status
 */
class Post extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tn_post';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['post_category_id', 'view', 'sorted', 'created_by', 'updated_by', 'arranged', 'status'], 'integer'],
            [['name'], 'required'],
            [['description', 'content'], 'string'],
            [['created_at', 'updated_at'], 'safe'],
            [['name', 'slug', 'img'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'post_category_id' => 'Post Category ID',
            'name' => 'Name',
            'slug' => 'Slug',
            'description' => 'Description',
            'content' => 'Content',
            'img' => 'Img',
            'view' => 'View',
            'sorted' => 'Sorted',
            'created_by' => 'Created By',
            'created_at' => 'Created At',
            'updated_by' => 'Updated By',
            'updated_at' => 'Updated At',
            'arranged' => 'Arranged',
            'status' => 'Status',
        ];
    }
}

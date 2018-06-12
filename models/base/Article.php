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
 * This is the model class for table "tn_article".
 *
 * @property integer $id
 * @property integer $category_id
 * @property integer $type_id
 * @property string $name
 * @property string $slug
 * @property string $content
 * @property string $image
 * @property string $description
 * @property string $keyword
 * @property string $tag
 * @property integer $view
 * @property integer $created_by
 * @property string $created_at
 * @property integer $updated_by
 * @property string $updated_at
 * @property integer $star
 * @property string $source
 * @property integer $is_comment
 * @property integer $comment_totel
 * @property integer $sorted
 * @property integer $is_deleted
 * @property integer $status
 * @property ArticleCategory $category
 */
class Article extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tn_article';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['category_id', 'type_id', 'view', 'created_by', 'updated_by', 'star', 'is_comment', 'comment_totel', 'sorted', 'is_deleted', 'status'], 'integer'],
            [['content', 'description'], 'string'],
            [['created_at', 'updated_at'], 'safe'],
            [['name', 'slug', 'image', 'keyword', 'tag', 'source'], 'string', 'max' => 255],
            [['category_id'], 'exist', 'skipOnError' => true, 'targetClass' => ArticleCategory::className(), 'targetAttribute' => ['category_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'category_id' => 'Category ID',
            'type_id' => 'Type ID',
            'name' => 'Name',
            'slug' => 'Slug',
            'content' => 'Content',
            'image' => 'Image',
            'description' => 'Description',
            'keyword' => 'Keyword',
            'tag' => 'Tag',
            'view' => 'View',
            'created_by' => 'Created By',
            'created_at' => 'Created At',
            'updated_by' => 'Updated By',
            'updated_at' => 'Updated At',
            'star' => 'Star',
            'source' => 'Source',
            'is_comment' => 'Is Comment',
            'comment_totel' => 'Comment Totel',
            'sorted' => 'Sorted',
            'is_deleted' => 'Is Deleted',
            'status' => 'Status',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategory()
    {
        return $this->hasOne(ArticleCategory::className(), ['id' => 'category_id']);
    }
}

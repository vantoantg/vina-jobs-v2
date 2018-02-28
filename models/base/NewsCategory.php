<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "tn_news_category".
 *
 * @property integer $id
 * @property integer $parent_id
 * @property string $name
 * @property string $slug
 * @property string $image
 * @property string $content
 * @property string $description
 * @property integer $sorted
 * @property integer $status
 */
class NewsCategory extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tn_news_category';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'slug'], 'required'],
            [['parent_id', 'sorted', 'status'], 'integer'],
            [['content'], 'string'],
            [['name', 'slug', 'image', 'description'], 'string', 'max' => 255],
            [['name', 'slug'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'parent_id' => 'Parent ID',
            'name' => 'Name',
            'slug' => 'Slug',
            'image' => 'Image',
            'content' => 'Content',
            'description' => 'Description',
            'sorted' => 'Sorted',
            'status' => 'Status',
        ];
    }
}

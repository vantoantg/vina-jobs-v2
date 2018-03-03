<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "tn_post_category".
 *
 * @property int $id
 * @property string $name
 * @property string $slug
 * @property string $description
 * @property string $content
 * @property string $img
 * @property int $sorted
 * @property int $status
 */
class PostCategory extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tn_post_category';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'slug'], 'required'],
            [['description', 'content'], 'string'],
            [['sorted', 'status'], 'integer'],
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
            'name' => 'Name',
            'slug' => 'Slug',
            'description' => 'Description',
            'content' => 'Content',
            'img' => 'Img',
            'sorted' => 'Sorted',
            'status' => 'Status',
        ];
    }
}

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
 * This is the model class for table "tn_article_category".
 *
 * @property integer $id
 * @property integer $parent_id
 * @property string $name
 * @property string $slug
 * @property string $content
 * @property string $image
 * @property string $description
 * @property string $keyword
 * @property integer $sorted
 * @property integer $status
 * @property Article[] $tnArticles
 */
class ArticleCategory extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tn_article_category';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['parent_id', 'sorted', 'status'], 'integer'],
            [['content', 'description'], 'string'],
            [['name', 'slug', 'image', 'keyword'], 'string', 'max' => 255],
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
            'name' => 'Name',
            'slug' => 'Slug',
            'content' => 'Content',
            'image' => 'Image',
            'description' => 'Description',
            'keyword' => 'Keyword',
            'sorted' => 'Sorted',
            'status' => 'Status',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTnArticles()
    {
        return $this->hasMany(Article::className(), ['category_id' => 'id']);
    }
}

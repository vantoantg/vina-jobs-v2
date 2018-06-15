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
 * This is the model class for table "tn_news".
 *
 * @property integer $id
 * @property integer $news_category_id
 * @property string $name
 * @property string $description
 * @property string $content
 * @property string $slug
 * @property string $image
 * @property string $video
 * @property integer $view
 * @property integer $sorted
 * @property string $source
 * @property integer $start
 * @property integer $created_by
 * @property string $created_at
 * @property integer $updated_by
 * @property string $updated_at
 * @property integer $is_comment
 * @property integer $is_publish
 * @property string $publish_date
 * @property integer $status
 */
class News extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tn_news';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['news_category_id'], 'required'],
            [['news_category_id', 'view', 'sorted', 'start', 'created_by', 'updated_by', 'is_comment', 'is_publish', 'status'], 'integer'],
            [['content'], 'string'],
            [['created_at', 'updated_at', 'publish_date'], 'safe'],
            [['name', 'description', 'slug', 'image', 'video', 'source'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'news_category_id' => 'News Category ID',
            'name' => 'Name',
            'description' => 'Description',
            'content' => 'Content',
            'slug' => 'Slug',
            'image' => 'Image',
            'video' => 'Video',
            'view' => 'View',
            'sorted' => 'Sorted',
            'source' => 'Source',
            'start' => 'Start',
            'created_by' => 'Created By',
            'created_at' => 'Created At',
            'updated_by' => 'Updated By',
            'updated_at' => 'Updated At',
            'is_comment' => 'Is Comment',
            'is_publish' => 'Is Publish',
            'publish_date' => 'Publish Date',
            'status' => 'Status',
        ];
    }
}

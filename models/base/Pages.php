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
 * This is the model class for table "tn_pages".
 *
 * @property int $id
 * @property int $parent_id
 * @property string $name
 * @property string $slug
 * @property string $content
 * @property string $seo_title
 * @property string $seo_keyword
 * @property string $seo_description
 * @property string $img
 * @property int $view
 * @property int $pape_template
 * @property int $created_by
 * @property int $updated_by
 * @property string $created_at
 * @property string $updated_at
 * @property int $status
 */
class Pages extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tn_pages';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['parent_id', 'view', 'pape_template', 'created_by', 'updated_by', 'status'], 'integer'],
            [['slug'], 'required'],
            [['content'], 'string'],
            [['created_at', 'updated_at'], 'safe'],
            [['name', 'slug', 'seo_title', 'seo_keyword', 'seo_description', 'img'], 'string', 'max' => 255],
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
            'seo_title' => 'Seo Title',
            'seo_keyword' => 'Seo Keyword',
            'seo_description' => 'Seo Description',
            'img' => 'Img',
            'view' => 'View',
            'pape_template' => 'Pape Template',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'status' => 'Status',
        ];
    }
}

<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "tn_page".
 *
 * @property integer $id
 * @property integer $parent_id
 * @property string $name
 * @property string $slug
 * @property string $content
 * @property string $seo_title
 * @property string $seo_keyword
 * @property string $seo_description
 * @property string $img
 * @property integer $view
 * @property integer $actived
 * @property integer $pape_template
 */
class Page extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tn_page';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['parent_id', 'view', 'actived', 'pape_template'], 'integer'],
            [['content'], 'string'],
            [['name', 'slug', 'seo_title', 'seo_keyword', 'seo_description', 'img'], 'string', 'max' => 255],
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
            'content' => 'Content',
            'seo_title' => 'Seo Title',
            'seo_keyword' => 'Seo Keyword',
            'seo_description' => 'Seo Description',
            'img' => 'Img',
            'view' => 'View',
            'actived' => 'Actived',
            'pape_template' => 'Pape Template',
        ];
    }
}

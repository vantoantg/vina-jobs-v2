<?php

namespace app\models;

class Tags extends \app\models\base\Tags
{

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tn_tags';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['status'], 'integer'],
            [['slug', 'title'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'slug' => 'Slug',
            'title' => 'Title',
            'status' => 'Status',
        ];
    }
}

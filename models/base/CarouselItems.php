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
 * This is the model class for table "tn_carousel_items".
 *
 * @property integer $id
 * @property integer $carousel_id
 * @property string $img_thum
 * @property string $img_view
 * @property string $img_original
 * @property string $title
 * @property string $description
 * @property string $link
 * @property string $target
 * @property integer $sorted
 * @property integer $status
 */
class CarouselItems extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tn_carousel_items';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['carousel_id', 'img_view'], 'required'],
            [['carousel_id', 'sorted', 'status'], 'integer'],
            [['description'], 'string'],
            [['img_thum', 'img_view', 'img_original', 'title', 'link'], 'string', 'max' => 255],
            [['target'], 'string', 'max' => 15],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'carousel_id' => 'Carousel ID',
            'img_thum' => 'Img Thum',
            'img_view' => 'Img View',
            'img_original' => 'Img Original',
            'title' => 'Title',
            'description' => 'Description',
            'link' => 'Link',
            'target' => 'Target',
            'sorted' => 'Sorted',
            'status' => 'Status',
        ];
    }
}

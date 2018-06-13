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
 * This is the model class for table "tn_product".
 *
 * @property int $id
 * @property int $category_id
 * @property string $name
 * @property string $description
 * @property string $content
 * @property string $image
 * @property string $slug
 * @property double $price_in
 * @property double $price_out
 * @property double $price_sale
 * @property double $quantity_remaining
 * @property int $view
 * @property int $is_comment
 * @property int $arranged
 * @property int $status
 * @property int $is_deleted
 * @property int $created_by
 * @property int $updated_by
 * @property string $created_at
 * @property string $updated_at
 */
class Product extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tn_product';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['category_id', 'view', 'is_comment', 'arranged', 'status', 'is_deleted', 'created_by', 'updated_by'], 'integer'],
            [['name'], 'required'],
            [['description', 'content'], 'string'],
            [['price_in', 'price_out', 'price_sale', 'quantity_remaining'], 'number'],
            [['created_at', 'updated_at'], 'safe'],
            [['name', 'image', 'slug'], 'string', 'max' => 255],
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
            'name' => 'Name',
            'description' => 'Description',
            'content' => 'Content',
            'image' => 'Image',
            'slug' => 'Slug',
            'price_in' => 'Price In',
            'price_out' => 'Price Out',
            'price_sale' => 'Price Sale',
            'quantity_remaining' => 'Quantity Remaining',
            'view' => 'View',
            'is_comment' => 'Is Comment',
            'arranged' => 'Arranged',
            'status' => 'Status',
            'is_deleted' => 'Is Deleted',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }
}

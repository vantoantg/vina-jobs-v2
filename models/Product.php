<?php

/*
 *  Created by Tona Nguyễn.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: Hồ Chí Minh, Việt Nam
 *  Website: https://jobsvina.com/
 */

namespace app\models;

class Product extends \app\models\base\Product
{
    /**
     * @return string
     */
    public function getCategoryName()
    {
        $model = ProductCategory::findOne($this->category_id);
        if ($model) {
            return $model->name;
        }

        return '';
    }
}

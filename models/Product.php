<?php

/*
 *  Created by Tona Nguyen.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
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

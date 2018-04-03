<?php
/**
 * Created by Tona Nguyễn
 * Date: 1/29/2018
 * Time: 5:32 PM
 */

namespace app\models;


class Product extends \app\models\base\Product
{

	/**
	 * @return string
	 */
    public function getCategoryName(){
    	$model = ProductCategory::findOne($this->category_id);
    	if($model){
    		return $model->name;
	    }

	    return '';
    }
}
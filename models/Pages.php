<?php
/**
 * Created by PhpStorm.
 * User: HP570
 * Date: 1/29/2018
 * Time: 5:32 PM
 */

namespace app\models;


class Pages extends \app\models\base\Pages
{
	const STATUS_ACTIVE = 1;
	/**
	 * @param string $slug
	 * @return Pages|null|static
	 */
    public static function get($slug = 'home'){
	    $model = self::findOne(['slug' => $slug, 'status' => self::STATUS_ACTIVE]);
    	if($model){
    		return $model;
	    }
	    return new self();
    }
}
<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 3/29/2018
 * Time: 2:04 PM
 */

namespace app\models;


class Candidate extends \app\models\base\Candidate
{
    public function rules()
    {
        return [
            [['job_category_id'], 'integer'],
            [['skill'], 'integer', 'on' => 'form'],
            [['skill'], 'string','on'=>'register'],
            [['education', 'experience'], 'string', 'max' => 1000]
        ];
    }

    /**
     * @param array $array
     * @return null|string
     */
    public function array2String($array = []){
        if(!$array || !is_array($array)){
            return null;
        }

        return implode(",", $array);
    }
}
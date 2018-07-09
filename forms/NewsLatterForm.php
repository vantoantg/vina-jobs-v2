<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\forms;

use app\models\Users;
use yii\base\Model;

/**
 * Class NewsLatterForm
 * @package app\forms
 */
class NewsLatterForm extends Model
{
    public $email;

    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            ['email', 'filter', 'filter' => 'trim'],
            ['email', 'required'],
            ['email', 'email'],
//            ['email', 'unique', 'targetClass' => Users::class, 'message' => 'Email này đã được sử dụng.'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'email' => 'Email',
        ];
    }
}

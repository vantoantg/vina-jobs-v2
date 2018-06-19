<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\forms;

use yii\base\Model;

/**
 * LoginForm is the model behind the login form.
 *
 * @property User|null $user This property is read-only.
 */
class SearchForm extends Model
{
    public $keys;
    public $location;
    public $categories;

    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            [['keys'], 'string'],
            [['location', 'categories'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'keys' => 'keys',
            'location' => 'location',
            'categories' => 'categories',
        ];
    }
}

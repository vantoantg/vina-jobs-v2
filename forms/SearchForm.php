<?php

namespace app\forms;

use app\models\Users;
use Yii;
use yii\base\Model;

/**
 * LoginForm is the model behind the login form.
 *
 * @property User|null $user This property is read-only.
 *
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
	 * @inheritdoc
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

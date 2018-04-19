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
class ApplyForm extends Model
{
    public $message;


    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            [['message'], 'string'],
            [['message'], 'required'],
        ];
    }

	/**
	 * @inheritdoc
	 */
	public function attributeLabels()
	{
		return [
			'message' => 'Tin nhắn',
		];
	}
}

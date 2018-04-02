<?php

namespace app\forms;

use yii\base\Model;

/**
 * LoginForm is the model behind the login form.
 *
 * @property User|null $user This property is read-only.
 *
 */
class LayoutForm extends Model
{
    public $files;
    public $textarea;

    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            [['textarea'], 'string'],
        ];
    }

	/**
	 * @inheritdoc
	 */
	public function attributeLabels()
	{
		return [
			'textarea' => 'Content',
		];
	}
}

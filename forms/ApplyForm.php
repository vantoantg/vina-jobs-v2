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
    public $new_cv;


    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            [['message'], 'string'],
            [['message'], 'required'],
	        [['new_cv'], 'file', 'extensions' =>'pdf, pptx, docx, doc', 'maxSize' => 3072000, 'tooBig' => 'Chỉ tải lên file dưới 3MB'],
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

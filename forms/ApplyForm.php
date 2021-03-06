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
class ApplyForm extends Model
{
    public $message;
    public $new_cv;
    public $job_code;
    public $redirect;

    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            [['message', 'job_code', 'redirect'], 'string'],
            [['message'], 'required'],
            [['new_cv'], 'file', 'extensions' => 'pdf, pptx, docx, doc', 'maxSize' => 3072000, 'tooBig' => 'Chỉ tải lên file dưới 3MB'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'message' => 'Tin nhắn',
        ];
    }
}

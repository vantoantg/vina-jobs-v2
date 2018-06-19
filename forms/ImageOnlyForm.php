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
class ImageOnlyForm extends Model
{
    public $image;

    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            [['image'], 'required'],
            [['image'], 'file', 'extensions' => 'gif, jpg, png', 'maxSize' => 3072000, 'tooBig' => 'Chỉ tải lên file dưới 3MB'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'image' => 'Hình ảnh',
        ];
    }

    public function upload()
    {
        if ($this->validate()) {
            $this->image->saveAs('uploads/'.$this->image->baseName.'.'.$this->image->extension);

            return $this->image;
        } else {
            return false;
        }
    }
}

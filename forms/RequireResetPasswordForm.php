<?php
namespace app\forms;

use app\models\Users as User;
use yii\base\Model;

class RequireResetPasswordForm extends Model
{
    public $email;

    public function rules()
    {
        return [

            [['email'], 'required'],
            [['email'], 'email'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'email' => 'Email',
        ];
    }

/*    protected function getUser()
    {
        if ($this->_user === null) {
            $this->_user = User::findByUsername($this->username);
        }

        return $this->_user;
    }*/

}
<?php
namespace app\forms;

use app\models\Users as User;
use app\models\Users;
use yii\base\Model;

class ProfilePasswordForm extends Model
{
    public $password;
    public $changepassword;
    public $reenterpassword;
    public $_user;

    const SCENARIO_UPDATE = 'update';
    const SCENARIO_RESET_PW = 'reset_pw';

    public function rules()
    {
        return [

            ['password', 'validatePassword'],
            [['password', 'changepassword'], 'required'],
            [['changepassword'],'string','min' => 8, 'max' => 60],
            ['reenterpassword', 'required'],
            ['reenterpassword', 'compare', 'compareAttribute'=>'changepassword', 'message'=>"Passwords don't match" ]
        ];
    }

    /**
     * @return array
     */
    public function scenarios()
    {
        $scenarios = parent::scenarios();
        $scenarios[self::SCENARIO_UPDATE] = ['password', 'changepassword', 'reenterpassword'];
        $scenarios[self::SCENARIO_RESET_PW] = ['changepassword', 'reenterpassword'];
        return $scenarios;
    }

    public function attributeLabels()
    {
        return [
            //'user_profile_id' => 'User Profile ID',
            //'user_ref_id' => 'User Ref ID',
            'password' => 'Mật khẩu hiện tại',
            'changepassword' => 'Mật khẩu mới',
            'reenterpassword' => 'Nhập lại mật khẩu mới',
        ];
    }

    public function validatePassword($attribute)
    {
        if (!$this->hasErrors()) {
            $user = $this->getUser();
            if (!$user || !$user->validatePassword($this->password)) {
                $this->addError($attribute, 'Mật khẩu bạn nhập không đúng');
                return false;
            }
        }
        return true;
    }

    protected function getUser()
    {
        if ($this->_user === null) {
            $this->_user = Users::findOne(\Yii::$app->user->identity->getId());
        }

        return $this->_user;
    }
}

<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\components;

use app\forms\LoginForm;
use yii\base\Widget;
use app\library\helper\Helper;

class UserWidget extends Widget
{
    public $message;

    public function init()
    {
        parent::init();
        if ($this->message === null) {
            $this->message = 'Welcome User';
        } else {
            $this->message = 'Welcome '.$this->message;
        }
    }

    public function login()
    {
        $form = new LoginForm();

        return $this->render('user/login', [
            'model' => $form,
        ]);
    }

    public function optionsRegister()
    {
        return $this->render('user/options_register', [
            'candidate' => Helper::createUrl(['front/user/register-candidate']),
            'company' => Helper::createUrl(['front/user/register-company']),
        ]);
    }
}

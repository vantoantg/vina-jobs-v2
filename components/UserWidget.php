<?php
/**
 * Created by Tona Nguyễn
 * Date: 2/6/2018
 * Time: 6:23 PM
 */
namespace app\components;

use app\forms\LoginForm;
use yii\base\Widget;
use app\library\helper\Helper;
use yii\helpers\Html;

class UserWidget extends Widget
{
    public $message;

    public function init()
    {
        parent::init();
        if ($this->message === null) {
            $this->message = 'Welcome User';
        } else {
            $this->message = 'Welcome ' . $this->message;
        }
    }


    public function login(){
        $form = new LoginForm();
        return $this->render('user/login', [
            'model' => $form
        ]);
    }

    public function optionsRegister(){
	    return $this->render('user/options_register', [
		    'candidate' => Helper::createUrl(['front/user/register-candidate']),
		    'company' => Helper::createUrl(['front/user/register-company']),
	    ]);
    }
}
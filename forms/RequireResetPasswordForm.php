<?php

namespace app\forms;

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

    public function sendEmailResetPassword($email, $User){
        /** var $User Users */
        $mail = \Yii::$app->mailer->compose('@app/mail/layouts/html', ['content' => 1312312312])
            ->setFrom($email)
            ->setTo($this->email)
            ->setSubject('Email sent from Yii2-Swiftmailer')
            ->send();

        echo '<pre>';
        print_r($mail);
        echo '</pre>';
        die;
    }
}
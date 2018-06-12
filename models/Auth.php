<?php

/*
 *  Created by Tona Nguyễn.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: Hồ Chí Minh, Việt Nam
 *  Website: https://jobsvina.com/
 */

namespace app\models;

class Auth extends \yii\db\ActiveRecord
{
    protected $userType;
    protected $email;

    /**
     * @param $client
     *
     * @return string
     */
    public function detectUserType($client)
    {
        \Yii::$app->session->set('redirectAfterLoginWithSocial', 4);

        $clientId = $client->getId();
        $userAttributes = $client->getUserAttributes();
        switch ($clientId) {
            case 'facebook':
                $this->email = $userAttributes['email'];

                return $this->userFacebook($userAttributes);

            case 'twitter':
                $this->email = $userAttributes['email'];

                return $this->userTwitter($userAttributes);

            case 'github':
                $this->email = $userAttributes['email'];

                return $this->userGitHub($userAttributes);
            case 'google':
                $this->email = $userAttributes['emails'][0]['value'];

                return $this->userGoogle($userAttributes);
        }
    }

    /**
     * @param $userData
     *
     * @return bool
     */
    public function userFacebook($userData)
    {
        $this->userType = Users::USER_TYPE_FACEBOOK;

        $user = Users::find()->where(['email' => $this->email])->one();
        if ($user) {
            \Yii::$app->user->login(Users::findOne($user->id));
        } else {
            $user = $this->newUser($userData);
            \Yii::$app->user->login(Users::findOne($user->id));
        }

        return true;
    }

    /**
     * @param array $userData
     *
     * @return bool
     */
    public function userGitHub($userData = [])
    {
        $this->userType = Users::USER_TYPE_GITHUB;

        $user = Users::find()->where(['email' => $this->email])->one();
        if ($user) {
            \Yii::$app->user->login(Users::findOne($user->id));
        } else {
            $transaction = \Yii::$app->db->beginTransaction();
            $user = $this->newUser($userData);
            if ($user) {
                $userDetail = UserDetails::checkAndCreateUser($user->id);
                $userDetail->setNames($userData['name']);
                if ($userDetail->update()) {
                    $transaction->commit();
                } else {
                    $transaction->rollBack();
                }
            }
            \Yii::$app->user->login(Users::findOne($user->id));
        }

        return true;
    }

    /**
     * @param array $userData
     *
     * @return bool
     */
    public function userGoogle($userData = [])
    {
        $this->userType = Users::USER_TYPE_GOOGLE;

        $user = Users::find()->where(['email' => $this->email])->one();
        if ($user) {
            \Yii::$app->user->login(Users::findOne($user->id));
        } else {
            $userData['name'] = $userData['displayName'];
            $userData['avatar_url'] = $userData['image']['url'];
            $transaction = \Yii::$app->db->beginTransaction();
            $user = $this->newUser($userData);
            if ($user) {
                $userDetail = UserDetails::checkAndCreateUser($user->id);
                $userDetail->setNames($userData['name']);
                if ($userDetail->update()) {
                    $transaction->commit();
                } else {
                    $transaction->rollBack();
                }
            }
            \Yii::$app->user->login(Users::findOne($user->id));
        }

        return true;
    }

    /**
     * @param $userData
     *
     * @return bool
     */
    public function userTwitter($userData)
    {
        $this->userType = Users::USER_TYPE_TWITTER;
        $userData['login'] = $userData['screen_name'];
        $userData['avatar_url'] = $userData['profile_image_url'];

        $user = Users::find()->where(['email' => $this->email])->one();
        if ($user) {
            \Yii::$app->user->login(Users::findOne($user->id));
        } else {
            // Save session attribute user from FB
            $transaction = \Yii::$app->db->beginTransaction();
            $user = $this->newUser($userData);
            if ($user) {
                $userDetail = UserDetails::checkAndCreateUser($user->id);
                $userDetail->setNames($userData['name']);
                if ($userDetail->update()) {
                    $transaction->commit();
                } else {
                    $transaction->rollBack();
                }
            }
            \Yii::$app->user->login(Users::findOne($user->id));
        }

        return true;
    }

    /**
     * @param $userData
     *
     * @return Users
     */
    public function newUser($userData)
    {
        $model = new Users();
        $model->scenario = Users::SCENARIO_UPDATE;
        $model->username = $this->email;
        $model->email = $this->email;
        $model->generateAuthKey();
        $model->password = '123456';
        $model->name = isset($userData['name']) ? $userData['name'] : null;
        $model->avatar_url = isset($userData['avatar_url']) ? $userData['avatar_url'] : null;
        $model->attributes = json_encode($userData);
        $model->type = $this->userType;
        if ($model->save()) {
            //Todo: send email to user
            // $this->sendEmail();

            return $model;
        }

        return false;
    }

    public function sendEmail()
    {
    }
}

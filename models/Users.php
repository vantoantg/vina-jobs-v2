<?php

namespace app\models;

use app\library\helper\Cons;
use app\library\helper\Role;
use yii\base\Security;
use yii\web\IdentityInterface;

class Users extends \app\models\base\User implements IdentityInterface
{

    const
        USER_TYPE_DEFAULT = 1, //  Register(candidate)
        USER_TYPE_FACEBOOK = 2,
        USER_TYPE_GOOGLE = 3,
        USER_TYPE_TWITTER = 4,
        USER_TYPE_GITHUB = 5,

        USER_TYPE_CONTACT_OF_COMPANY = 9; // Contact of company

	const
		STATUS_WAITING_ACTIVE = 0,
		STATUS_WAITING_RESET_PASSWORD = 3,

		STATUS_ACTIVED = 1,
		STATUS_DISABLED = 2;

    const SCENARIO_REGISTER = 'register';
    const SCENARIO_UPDATE = 'update';

    public $slug_name;
    public $as_employers;
    public $repassword;
    public $new_password;
    public $renew_password;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'email', 'password', 'repassword'], 'required'],
            [['role', 'archive', 'type', 'status'], 'integer'],
            [['attributes'], 'string'],
            [['username', 'name'], 'string', 'max' => 32],
            [['email', 'avatar_url'], 'string', 'max' => 255],
            [['password'], 'string', 'min' => 6, 'max' => 64],
            [['auth_key', 'access_token', 'password_reset_token'], 'string', 'max' => 128],
            [['slug_name'], 'string', 'max' => 155],
            [['lang'], 'string', 'max' => 5],
            [['timezone'], 'string', 'max' => 100],
            [['email', 'access_token'], 'unique'],
	        ['repassword', 'compare', 'compareAttribute'=>'password', 'message' => "Mật khẩu nhập lại chưa chính xác." ],
        ];
    }

    /**
     * @return array
     */
    public function scenarios()
    {
        $scenarios = parent::scenarios();
        $scenarios[self::SCENARIO_UPDATE] = ['name'];
        $scenarios[self::SCENARIO_REGISTER] = ['name', 'email', 'password', 'repassword'];
        return $scenarios;
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'username' => 'Email',
            'email' => 'Email',
            'password' => 'Mật khẩu',
            'auth_key' => 'Auth Key',
            'access_token' => 'Access Token',
            'password_reset_token' => 'Password Reset Token',
            'role' => 'Role',
            'name' => 'Tên',
            'slug_name' => 'Slug Name',
            'avatar' => 'Avatar',
            'avatar_url' => 'Avatar Url',
            'archive' => 'Archive',
            'type' => 'Type',
            'lang' => 'Lang',
            'timezone' => 'Timezone',
            'attributes' => 'Attributes',
            'status' => 'Status',

	        'as_employers' => 'Như là nhà tuyển dụng'
        ];
    }

	/**
	 * @param bool $insert
	 * @return bool
	 */
    public function beforeSave($insert) {

        if (parent::beforeSave($insert)) {
            if ($this->isNewRecord) {
                $this->setPassword($this->password);
                $this->password_reset_token = $this->generatePasswordResetToken();
                $this->auth_key = \Yii::$app->getSecurity()->generateRandomString();
            }
            return true;
        }
        return false;
    }

	/**
	 *
	 */
    public function newContactCompany(){
	    $this->type = Users::USER_TYPE_CONTACT_OF_COMPANY;
	    $this->status = Users::STATUS_WAITING_ACTIVE;
	    $this->role = Role::ROLE_CUSTOMMER;
    }

    /**
     * @inheritdoc
     */
    public static function findIdentity($id)
    {
        return static::findOne($id);
    }

    /**
     * @inheritdoc
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        return static::findOne(['access_token' => $token]);
    }

    /**
     * Finds user by username
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username)
    {
        return static::findOne(['username' => $username, 'archive' => Cons::ARCHIVE_FALSE, 'status' => Cons::STATUS_ACTIVE]);
    }

    /**
     * Finds user by password reset token
     *
     * @param string $token password reset token
     * @return static|null
     */
    public static function findByPasswordResetToken($token)
    {
        $expire = \Yii::$app->params['user.passwordResetTokenExpire'];
        $parts = explode('_', $token);
        $timestamp = (int)end($parts);
        if ($timestamp + $expire < time()) {
            return null;
        }

        return static::findOne(['password_reset_token' => $token]);

    }


    /**
     * @inheritdoc
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @inheritdoc
     */
    public function getAuthKey()
    {
        return $this->auth_key;
    }

    /**
     * @inheritdoc
     */
    public function validateAuthKey($authKey)
    {
        return $this->getAuthKey() === $authKey;
    }

    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return boolean if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        return \Yii::$app->getSecurity()->validatePassword($password, $this->password);
    }

    /**
     * Generates password hash from password and sets it to the model
     *
     * @param string $password
     */
    public function setPassword($password)
    {
        $security = new Security();
//        $this->password_hash = $security->generatePasswordHash($password);
        $this->password = \Yii::$app->getSecurity()->generatePasswordHash($password);
    }

    /**
     * Generates "remember me" authentication key
     */
    public function generateAuthKey()
    {
        $security = new Security();
        $this->auth_key = $security->generateRandomKey();
    }

    /**
     * Generates new password reset token
     */
    public function generatePasswordResetToken()
    {
        $security = new Security();
        $this->password_reset_token = $security->generateRandomKey() . '_' . time();
    }

    /**
     * Removes password reset token
     */
    public function removePasswordResetToken()
    {
        $this->password_reset_token = null;
    }
    /** EXTENSION MOVIE **/

}

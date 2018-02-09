<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "tn_user".
 *
 * @property int $id
 * @property string $username
 * @property string $email
 * @property string $password
 * @property string $auth_key
 * @property string $access_token
 * @property string $password_reset_token
 * @property int $role
 * @property string $name
 * @property string $slug_name
 * @property string $avatar
 * @property string $avatar_url
 * @property int $archive
 * @property int $type
 * @property string $lang
 * @property string $timezone
 * @property string $attributes
 * @property int $status
 */
class User extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tn_user';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['username', 'password', 'auth_key'], 'required'],
            [['role', 'archive', 'type', 'status'], 'integer'],
            [['attributes'], 'string'],
            [['username', 'name'], 'string', 'max' => 32],
            [['email', 'avatar_url'], 'string', 'max' => 255],
            [['password'], 'string', 'max' => 64],
            [['auth_key', 'access_token', 'password_reset_token'], 'string', 'max' => 128],
            [['slug_name', 'avatar'], 'string', 'max' => 155],
            [['lang'], 'string', 'max' => 5],
            [['timezone'], 'string', 'max' => 100],
            [['access_token'], 'unique'],
        ];
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
            'password' => 'Password',
            'auth_key' => 'Auth Key',
            'access_token' => 'Access Token',
            'password_reset_token' => 'Password Reset Token',
            'role' => 'Role',
            'name' => 'Name',
            'slug_name' => 'Slug Name',
            'avatar' => 'Avatar',
            'avatar_url' => 'Avatar Url',
            'archive' => 'Archive',
            'type' => 'Type',
            'lang' => 'Lang',
            'timezone' => 'Timezone',
            'attributes' => 'Attributes',
            'status' => 'Status',
        ];
    }
}

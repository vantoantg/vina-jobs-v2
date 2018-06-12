<?php

/*
 *  Created by Tona Nguyen.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\models\base;

/**
 * This is the model class for table "tn_user_online".
 *
 * @property integer $id
 * @property string $session
 * @property string $ip
 * @property string $time
 * @property string $browser
 * @property string $url
 * @property string $controller
 * @property string $action
 * @property string $method
 */
class UserOnline extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tn_user_online';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['time'], 'safe'],
            [['session', 'browser', 'url'], 'string', 'max' => 255],
            [['ip', 'method'], 'string', 'max' => 15],
            [['controller', 'action'], 'string', 'max' => 55],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'session' => 'Session',
            'ip' => 'Ip',
            'time' => 'Time',
            'browser' => 'Browser',
            'url' => 'Url',
            'controller' => 'Controller',
            'action' => 'Action',
            'method' => 'Method',
        ];
    }
}

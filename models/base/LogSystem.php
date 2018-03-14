<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "tn_log_system".
 *
 * @property int $id
 * @property string $url
 * @property int $user_id
 * @property string $ip
 * @property string $browser
 * @property string $time
 * @property string $controller
 * @property string $action
 * @property string $method
 * @property string $user_timezone
 */
class LogSystem extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tn_log_system';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id'], 'integer'],
            [['time'], 'safe'],
            [['url', 'browser'], 'string', 'max' => 255],
            [['ip', 'method'], 'string', 'max' => 15],
            [['controller', 'action', 'user_timezone'], 'string', 'max' => 55],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'url' => 'Url',
            'user_id' => 'User ID',
            'ip' => 'Ip',
            'browser' => 'Browser',
            'time' => 'Time',
            'controller' => 'Controller',
            'action' => 'Action',
            'method' => 'Method',
            'user_timezone' => 'User Timezone',
        ];
    }
}

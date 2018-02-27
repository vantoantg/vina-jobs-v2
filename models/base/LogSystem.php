<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "tn_log_system".
 *
 * @property integer $id
 * @property string $url
 * @property integer $user_id
 * @property string $ip
 * @property string $browser
 * @property string $time
 * @property string $controller
 * @property string $action
 * @property string $method
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
            [['url'], 'string', 'max' => 255],
            [['ip', 'method'], 'string', 'max' => 15],
            [['browser'], 'string', 'max' => 255],
            [['controller', 'action'], 'string', 'max' => 55],
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
        ];
    }
}

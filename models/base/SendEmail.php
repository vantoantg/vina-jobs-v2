<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "tn_send_email".
 *
 * @property string $id
 * @property string $send_to
 * @property string $send_cc
 * @property string $subject
 * @property string $content
 * @property string $attach
 * @property string $template
 * @property int $is_sent
 * @property string $sent_date
 * @property int $sent_by
 * @property int $resent
 * @property string $created_at
 */
class SendEmail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tn_send_email';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['send_to', 'subject', 'content'], 'required'],
            [['content'], 'string'],
            [['is_sent', 'sent_by', 'resent'], 'integer'],
            [['sent_date', 'created_at'], 'safe'],
            [['send_to', 'send_cc', 'template'], 'string', 'max' => 155],
            [['subject', 'attach'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'send_to' => 'Send To',
            'send_cc' => 'Send Cc',
            'subject' => 'Subject',
            'content' => 'Content',
            'attach' => 'Attach',
            'template' => 'Template',
            'is_sent' => 'Is Sent',
            'sent_date' => 'Sent Date',
            'sent_by' => 'Sent By',
            'resent' => 'Resent',
            'created_at' => 'Created At',
        ];
    }
}

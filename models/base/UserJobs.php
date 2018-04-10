<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "tn_user_jobs".
 *
 * @property int $id
 * @property int $user_id
 * @property int $jobs_id
 * @property int $applied
 * @property string $applied_time
 * @property int $saved
 * @property string $saved_time
 * @property int $arranged
 * @property int $is_deleted
 */
class UserJobs extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tn_user_jobs';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'jobs_id', 'arranged'], 'integer'],
            [['applied_time', 'saved_time'], 'safe'],
            [['applied', 'saved', 'is_deleted'], 'string', 'max' => 1],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => 'User ID',
            'jobs_id' => 'Jobs ID',
            'applied' => 'Applied',
            'applied_time' => 'Applied Time',
            'saved' => 'Saved',
            'saved_time' => 'Saved Time',
            'arranged' => 'Arranged',
            'is_deleted' => 'Is Deleted',
        ];
    }
}

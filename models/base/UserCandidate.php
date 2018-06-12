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
 * This is the model class for table "tn_user_candidate".
 *
 * @property int $id
 * @property int $candidate_id
 * @property string $created_at
 * @property int $created_by
 * @property int $is_deleted
 */
class UserCandidate extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tn_user_candidate';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['candidate_id', 'created_by', 'is_deleted'], 'integer'],
            [['created_at'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'candidate_id' => 'Candidate ID',
            'created_at' => 'Created At',
            'created_by' => 'Created By',
            'is_deleted' => 'Is Deleted',
        ];
    }
}

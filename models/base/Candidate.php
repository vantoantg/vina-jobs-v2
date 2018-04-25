<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "tn_candidate".
 *
 * @property int $id
 * @property int $user_id
 * @property string $title
 * @property string $slug
 * @property int $job_category_id
 * @property string $skill_tags
 * @property string $skill
 * @property int $location
 * @property string $video
 * @property string $resume_content
 * @property string $resume_file
 * @property string $social_network
 * @property string $education
 * @property string $experience
 * @property int $created_by
 * @property string $created_at
 * @property int $updated_by
 * @property string $updated_at
 * @property int $approved_by
 * @property string $approved_at
 * @property int $view
 * @property int $sorted
 * @property int $star
 * @property int $client_status
 * @property int $status
 */
class Candidate extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tn_candidate';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id'], 'required'],
            [['user_id', 'job_category_id', 'created_by', 'updated_by', 'approved_by', 'view', 'sorted'], 'integer'],
            [['skill', 'resume_content', 'location'], 'string'],
            [['created_at', 'updated_at', 'approved_at'], 'safe'],
            [['title', 'slug', 'video', 'resume_file', 'location'], 'string', 'max' => 255],
            [['skill_tags', 'social_network', 'education', 'experience'], 'string', 'max' => 1000],
            [['star', 'client_status', 'status'], 'string', 'max' => 1],
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
            'title' => 'Title',
            'slug' => 'Slug',
            'job_category_id' => 'Job Category ID',
            'skill_tags' => 'Skill Tags',
            'skill' => 'Skill',
            'location' => 'Location',
            'video' => 'Video',
            'resume_content' => 'Resume Content',
            'resume_file' => 'Resume File',
            'social_network' => 'Social Network',
            'education' => 'Education',
            'experience' => 'Experience',
            'created_by' => 'Created By',
            'created_at' => 'Created At',
            'updated_by' => 'Updated By',
            'updated_at' => 'Updated At',
            'approved_by' => 'Approved By',
            'approved_at' => 'Approved At',
            'view' => 'View',
            'sorted' => 'Sorted',
            'star' => 'Star',
            'client_status' => 'Client Status',
            'status' => 'Status',
        ];
    }
}

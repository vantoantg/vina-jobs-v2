<?php

/*
 *  Created by Tona Nguyễn.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: Hồ Chí Minh, Việt Nam
 *  Website: https://jobsvina.com/
 */

namespace app\models\base;

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
 * @property string $location
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
 * @property int $receives
 * @property int $star
 * @property int $client_status
 * @property int $status
 */
class Candidate extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tn_candidate';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id'], 'required'],
            [['user_id', 'job_category_id', 'created_by', 'updated_by', 'approved_by', 'view', 'sorted', 'receives', 'star', 'client_status', 'status'], 'integer'],
            [['skill', 'resume_content'], 'string'],
            [['created_at', 'updated_at', 'approved_at'], 'safe'],
            [['title', 'slug', 'location', 'video', 'resume_file'], 'string', 'max' => 255],
            [['skill_tags', 'social_network', 'education', 'experience'], 'string', 'max' => 1000],
        ];
    }

    /**
     * {@inheritdoc}
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
            'receives' => 'Receives',
            'star' => 'Star',
            'client_status' => 'Client Status',
            'status' => 'Status',
        ];
    }
}

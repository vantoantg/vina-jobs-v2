<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 3/29/2018
 * Time: 2:04 PM
 */

namespace app\models;


class Candidate extends \app\models\base\Candidate
{
	const
		STATUS_WAITING_APPROVE = 0,
		STATUS_ACTIVE = 1,

		STATUS_CLIENT_PUBLISH = 7,
		STATUS_CLIENT_DRAFT = 8;
    public $receives;
    public function rules()
    {
        return [
            [['user_id', 'job_category_id', 'skill'], 'required'],
            [['user_id', 'job_category_id', 'location', 'created_by', 'updated_by', 'approved_by', 'view', 'sorted', 'receives'], 'integer'],
            [['resume_content'], 'string'],
            [['created_at', 'updated_at', 'approved_at', 'skill'], 'safe'],
            [['title', 'slug', 'video', 'resume_file'], 'string', 'max' => 255],
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
			'job_category_id' => 'Lĩnh vực',
			'skill_tags' => 'Các kỹ năng',
			'skill' => 'Kỹ năng',
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
			'receives' => 'Bạn sẽ nhận các tin tuyển dụng mới nhất liên quan đến ngành - nghề bạn đã đăng ký ?',
			'status' => 'Status',
		];
	}

    /**
     * @param array $array
     * @return null|string
     */
    public function array2String($array = []){
        if(!$array || !is_array($array)){
            return null;
        }

        return implode(",", $array);
    }

	/**
	 * @param $userId
	 * @param bool $createIfNot
	 * @return Candidate|array|bool|null|\yii\db\ActiveRecord
	 */
	public static function getCandidate($userId, $createIfNot = true)
	{
		$candidate = Candidate::find()->where(['user_id' => $userId])->one();
		if (!$candidate) {
			if ($createIfNot) {
				$candidate = new Candidate();
				$candidate->user_id = $userId;
				$candidate->save();
				return $candidate;
			}
			return false;
		}

		return $candidate;
	}
}
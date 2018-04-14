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

    public function rules()
    {
        return [
            [['user_id'], 'required'],
            [['user_id', 'job_category_id', 'location', 'created_by', 'updated_by', 'approved_by', 'view', 'sorted'], 'integer'],
            [['resume_content'], 'string'],
            [['created_at', 'updated_at', 'approved_at', 'skill'], 'safe'],
            [['title', 'slug', 'video', 'resume_file'], 'string', 'max' => 255],
            [['skill_tags', 'social_network', 'education', 'experience'], 'string', 'max' => 1000],
            [['star', 'client_status', 'status'], 'string', 'max' => 1],
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
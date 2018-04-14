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
    public function rules()
    {
        return [
            [['job_category_id'], 'integer'],
            [['skill'], 'integer', 'on' => 'form'],
            [['skill'], 'string','on'=>'register'],
            [['education', 'experience'], 'string', 'max' => 1000]
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
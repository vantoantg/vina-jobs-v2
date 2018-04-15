<?php
/**
 * Created by Tona Nguyễn
 * Date: 1/29/2018
 * Time: 5:32 PM
 */

namespace app\models;


use app\library\helper\Common;
use app\library\helper\Datetime;

class UserDetails extends \app\models\base\UserDetails
{
	/**
	 * @var Object Helper
	 */
	protected static $_instance;

	/**
	 * @return Device
	 */
	public static function getInstance()
	{
		if (!(self::$_instance instanceof self)) {
			self::$_instance = new self();
		}

		return self::$_instance;
	}

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['phone'], 'required'],
            [['user_id', 'gender', 'job_title_id', 'experience', 'level', 'direct_manager_id', 'approved_by', 'active_tour_guide'], 'integer'],
            [['birthday', 'changed_password_date', 'registration_date', 'approved_at', 'city_id'], 'safe'],
	        [['birthday', 'about_me'], 'string'],
            [['email', 'address'], 'string', 'max' => 255],
            [['first_name', 'middle_name', 'last_name'], 'string', 'max' => 50],
            [['phone'], 'string', 'max' => 11],
            [['user_id'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'user_id' => 'User ID',
            'email' => 'Email',
            'first_name' => 'First Name',
            'middle_name' => 'Middle Name',
            'last_name' => 'Last Name',
            'gender' => 'Giới tính',
            'birthday' => 'Sinh nhật',
            'phone' => 'Điện thoại',
            'address' => 'Địa chỉ',
            'changed_password_date' => 'Changed Password Date',
            'job_title_id' => 'Job Title ID',
            'direct_manager_id' => 'Direct Manager ID',
            'city_id' => 'City ID',
            'registration_date' => 'Registration Date',
            'approved_by' => 'Approved By',
            'approved_at' => 'Approved At',
            'active_tour_guide' => 'Active Tour Guide',
        ];
    }

    public function saveInfo(){
        $this->birthday = Datetime::todateSql($this->birthday);
        $this->registration_date = Datetime::datetimeSqlNow();
    }

	/**
	 * @param string $fullname
	 */
    public function setNames($fullname = ''){
	    $name = explode(" ", $fullname);
	    if (count($name) == 1) {
		    $this->last_name = $name[0];
	    }

	    if (count($name) == 2) {
		    $this->first_name = $name[0];
		    $this->last_name = $name[1];
	    }

	    if (count($name) >= 3) {
		    $this->first_name = $name[0];
		    $middle = '';
		    foreach ($name as $key => $n) {
			    if ($key > 0 && $key < count($name) - 1) {
				    $middle .= $n . ' ';
			    }
		    }
		    $this->middle_name = trim($middle);
		    $this->last_name = $name[count($name) - 1];
	    }
    }

	/**
	 * @param $userId
	 * @return UserDetails|array|null|\yii\db\ActiveRecord
	 */
    public static function checkAndCreateUser($userId){
	    $userDetail = self::find()->where(['user_id' => $userId])->one();
	    if(!$userDetail){
	    	$userDetail = new UserDetails();
	    	$userDetail->user_id = $userId;
	    	$userDetail->phone = '--'; // Field is require
	    	$userDetail->save();
	    }

	    return $userDetail;
    }

    /**
     * @param $userId
     * @return UserDetails|array|null|\yii\db\ActiveRecord
     */
    public static function getInfo($userId = null){
        if($userId == null){
            $userId = Common::currentUser();
        }

        /** @var $userDetail self $userDetail */
        $userDetail = UserDetails::checkAndCreateUser($userId);

        $userDetail->birthday = Datetime::sqlDateToFormat($userDetail->birthday);
        $userDetail->registration_date = Datetime::sqlDatetimeDiffForHumans($userDetail->registration_date);


        return $userDetail;
    }
}
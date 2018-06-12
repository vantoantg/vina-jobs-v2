<?php

/*
 *  Created by Tona Nguyễn.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: Hồ Chí Minh, Việt Nam
 *  Website: https://jobsvina.com/
 */

namespace app\models;

use app\library\helper\Common;
use app\library\helper\Datetime;
use app\library\helper\Dropdowns;
use app\library\helper\Helper;

class UserDetails extends \app\models\base\UserDetails
{
    /**
     * {@inheritdoc}
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
     * {@inheritdoc}
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

    /**
     * @param bool $insert
     *
     * @return bool
     */
    public function beforeSave($insert)
    {
        if ($this->isNewRecord) {
            $this->registration_date = Datetime::datetimeSqlNow();
        } else {
        }

        return parent::beforeSave($insert);
    }

    public function saveInfo()
    {
        $this->birthday = Datetime::todateSql($this->birthday);
        $this->registration_date = Datetime::datetimeSqlNow();
    }

    /**
     * @param string $fullname
     */
    public function setNames($fullname = '')
    {
        $name = explode(' ', $fullname);
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
                    $middle .= $n.' ';
                }
            }
            $this->middle_name = trim($middle);
            $this->last_name = $name[count($name) - 1];
        }
    }

    /**
     * @param $userId
     *
     * @return UserDetails|array|null|\yii\db\ActiveRecord
     */
    public static function checkAndCreateUser($userId)
    {
        $userDetail = self::find()->where(['user_id' => $userId])->one();
        if (!$userDetail) {
            $userDetail = new UserDetails();
            $userDetail->user_id = $userId;
            $userDetail->phone = '--'; // Field is require
            $userDetail->save();
        }

        return $userDetail;
    }

    /**
     * @param $userId
     *
     * @return UserDetails|array|null|\yii\db\ActiveRecord
     */
    public static function getInfo($userId = null)
    {
        if ($userId == null) {
            $userId = Common::currentUser();
        }

        /** @var $userDetail self $userDetail */
        $userDetail = UserDetails::checkAndCreateUser($userId);
        if (!$userDetail->email) {
            $userDetail->email = Common::currentUsers()->email;
        }

        $userDetail->birthday = Datetime::sqlDateToFormat($userDetail->birthday);
        $userDetail->registration_date = Datetime::sqlDatetimeDiffForHumans($userDetail->registration_date);
        $userDetail->gender = ($userDetail->gender) ? Dropdowns::$gender[$userDetail->gender] : '--';

        return $userDetail;
    }

    /**
     * @param $type
     *
     * @return array|null|\yii\db\ActiveRecord|\yii\db\ActiveRecord[]
     */
    public function loadInfomationContactProfile($type)
    {
        if ($type == 'company') {
            $com = Company::find()->select(['id', 'name', 'website', 'content', 'logo'])->where(['created_by' => Common::currentUsers()->getId()])->asArray()->one();
            $com['logo'] = Company::getLogo($com['logo']);
            $com['gallery'] = Company::instance()->gallery($com['id']);
            $com['isUpload'] = (count($com['gallery']) < Helper::params('gallery', 'max')) ? true : false;

            return $com;
        }

        // Tin đã đăng
        if ($type == 'jobs') {
            $jobs = Job::instance()->getJobs(Common::currentUsers()->getId());

            return $jobs;
        }

        // Ứng viên đang theo dõi
        if ($type == 'candidate') {
            return UserCandidate::instance()->getList();
        }
    }
}

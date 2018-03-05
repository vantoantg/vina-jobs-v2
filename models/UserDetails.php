<?php
/**
 * Created by PhpStorm.
 * User: HP570
 * Date: 1/29/2018
 * Time: 5:32 PM
 */

namespace app\models;


class UserDetails extends \app\models\base\UserDetails
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'gender', 'job_title_id', 'direct_manager_id', 'city_id', 'approved_by', 'active_tour_guide'], 'integer'],
            [['birthday', 'changed_password_date', 'registration_date', 'approved_at'], 'safe'],
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
            'gender' => 'Gender',
            'birthday' => 'Birthday',
            'phone' => 'Phone',
            'address' => 'Address',
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
}
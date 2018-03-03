<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "tn_user_details".
 *
 * @property int $user_id
 * @property string $email
 * @property string $first_name
 * @property string $middle_name
 * @property string $last_name
 * @property int $gender
 * @property string $birthday
 * @property string $phone
 * @property string $address
 * @property string $changed_password_date
 * @property int $job_title_id
 * @property int $direct_manager_id
 * @property int $city_id
 * @property string $registration_date
 * @property int $approved_by
 * @property string $approved_at
 * @property int $active_tour_guide
 */
class UserDetails extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tn_user_details';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id'], 'required'],
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

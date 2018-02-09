<?php
namespace app\components\tona;

class Role
{
    const
        ROLE_ADMINISTRATOR  = 1,
        ROLE_ADMIN          = 2,
        ROLE_DIRECTOR       = 3,
        ROLE_ACCOUNTANT     = 4,
        ROLE_HR             = 5,
        ROLE_TEMLEADER      = 6,
        ROLE_MEMBER         = 7,

        ROLE_CUSTOMMER      = 8,
        ROLE_GUEST          = 9;

    public function init(){

    }
    
    public static function getListRole(){
        return [
            self::ROLE_ADMINISTRATOR    => 'Administrator',
            self::ROLE_ADMIN            => 'Admin',
            self::ROLE_DIRECTOR         => 'Director',
            self::ROLE_ACCOUNTANT       => 'Accountant',
            self::ROLE_HR               => 'HR',
            self::ROLE_TEMLEADER        => 'Teamleader',
            self::ROLE_MEMBER           => 'Member',
            self::ROLE_CUSTOMMER        => 'Custommer',
            self::ROLE_GUEST            => 'Guest',
        ];
    }

    /**
     * @param bool|false $role
     * @return bool
     */
    public static function allowAdmin($role = false){
        if($role == false){
            $role = Common::currentUser('role', false);
        }
        if (in_array($role, [
            self::ROLE_ADMINISTRATOR,
            self::ROLE_ADMIN,
            self::ROLE_DIRECTOR])) {
            return true;
        }
        return false;
    }

    /**
     * @param bool|false $role
     * @return bool
     */
    public static function allowSite($role = false){
        if($role == false){
            $role = Common::currentUser('role', false);
        }
        if (in_array($role, [
            self::ROLE_ADMINISTRATOR,
            self::ROLE_ADMIN,
            self::ROLE_DIRECTOR,
            self::ROLE_ACCOUNTANT,
            self::ROLE_HR,
            self::ROLE_TEMLEADER,
            self::ROLE_MEMBER,
            self::ROLE_TEMLEADER,
            self::ROLE_CUSTOMMER,
            self::ROLE_GUEST])) {
            return true;
        }
        return false;
    }

    /**
     * @param bool|false $role
     * @return bool
     */
    public static function checkRemoveUser($role = false){
        if($role == false){
            $role = Common::currentUser('role', false);
        }
        if (in_array($role, [
            self::ROLE_ADMINISTRATOR,
            self::ROLE_ADMIN,
            ])) {
            return true;
        }
        return false;
    }

    /**
     * @param bool|false $role
     * @return bool
     */
    public static function checkAdminTN($role = false){
        if($role == false){
            $role = Common::currentUser('role', false);
        }
        if (in_array($role, [
            self::ROLE_ADMINISTRATOR,
            self::ROLE_ADMIN,
        ])) {
            return true;
        }
        return false;
    }
}

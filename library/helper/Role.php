<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\library\helper;

class Role
{
    const ROLE_ADMINISTRATOR = 1;
    const ROLE_ADMIN = 2;
    const ROLE_DIRECTOR = 3;
    const ROLE_ACCOUNTANT = 4;
    const ROLE_HR = 5;
    const ROLE_TEAM_LEADER = 6;
    const ROLE_MEMBER = 7;
    const ROLE_CUSTOMER = 8;
    const ROLE_GUEST = 9;

    public function init()
    {
    }

    public static function getListRole()
    {
        return [
            self::ROLE_ADMINISTRATOR => 'Administrator',
            self::ROLE_ADMIN => 'Admin',
            self::ROLE_DIRECTOR => 'Director',
            self::ROLE_ACCOUNTANT => 'Accountant',
            self::ROLE_HR => 'HR',
            self::ROLE_TEAM_LEADER => 'Team leader',
            self::ROLE_MEMBER => 'Member',
            self::ROLE_CUSTOMER => 'Customer',
            self::ROLE_GUEST => 'Guest',
        ];
    }

    /**
     * @param bool|false $role
     *
     * @return bool
     */
    public static function allowAdmin($role = false)
    {
        if ($role == false) {
            $role = Common::currentUser('role', false);
        }
        if (in_array($role, [
            self::ROLE_ADMINISTRATOR,
            self::ROLE_ADMIN,
            self::ROLE_DIRECTOR, ])) {
            return true;
        }

        return false;
    }

    /**
     * @param bool|false $role
     *
     * @return bool
     */
    public static function allowSite($role = false)
    {
        if ($role == false) {
            $role = Common::currentUser('role', false);
        }
        if (in_array($role, [
            self::ROLE_ADMINISTRATOR,
            self::ROLE_ADMIN,
            self::ROLE_DIRECTOR,
            self::ROLE_ACCOUNTANT,
            self::ROLE_HR,
            self::ROLE_TEAM_LEADER,
            self::ROLE_MEMBER,
            self::ROLE_CUSTOMER,
            self::ROLE_GUEST, ])) {
            return true;
        }

        return false;
    }

    /**
     * @param bool|false $role
     *
     * @return bool
     */
    public static function checkRemoveUser($role = false)
    {
        if ($role == false) {
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
     *
     * @return bool
     */
    public static function checkAdminTN($role = false)
    {
        if ($role == false) {
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

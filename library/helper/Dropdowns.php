<?php
/**
 * Created by Tona Nguyễn
 * Date: 3/28/2017
 * Time: 11:35 AM
 */

namespace app\library\helper;

class Dropdowns
{
    public static $a_target = [
        '_blank' => '_blank',
        '_self' => '_self',
        '_parent' => '_parent',
        '_top' => '_top',
    ];

    /**
     * @var array
     */
    public static $gender = [
        0 => '-- Chọn --',
        1 => 'Nữ',
        2 => 'Nam',
    ];

    /**
     * @var array
     */
    public static $levels = [
        0 => '-- Chọn --',
        1 => 'Đại học',
        2 => 'Cao đẳng',
        3 => 'Trung cấp',
        4 => 'Cao học',
        5 => 'Trung học',
        6 => 'Chứng chỉ',
        7 => 'Lao động phổ thông',
    ];

    /**
     * @var array
     */
    public static $experience = [
        0 => '-- Chọn --',
        1 => 'Chưa có kinh nghiệm',
        2 => 'Dưới 1 năm',
        3 => '1 năm',
        4 => '2 năm',
        5 => '3 năm',
        6 => '4 năm',
        7 => '5 năm',
        8 => 'Trên 5 năm',
    ];

    /**
     * @var array
     */
    public static $working_time = [
        0 => '-- Chọn --',
        1 => 'Full time',
        2 => 'Part time',
    ];
}

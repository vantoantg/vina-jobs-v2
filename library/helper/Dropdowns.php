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
    public static $education = [
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
        1 => 'Không cần kinh nghiệm',
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
        1 => 'Toàn thời gian cố định',
        2 => 'Toàn thời gian tạm thời',
        3 => 'Bán thời gian cố định',
        4 => 'Bán thời gian tạm thời',
        5 => 'Theo hợp đồng / Tư vấn',
        6 => 'Thực tập',
        10 => 'Khác',
    ];

    /**
     * @var array
     */
    public static $salary = [
        1 => "Thỏa thuận",
        2 => '5 triệu',
        3 => '5-10 triệu',
        4 => '10-15 triệu',
        5 => '15-20 triệu',
        6 => '20-30 triệu',
        7 => 'Trên 30 triệu',
        8 => 'Bạn sẽ yêu thích',
        10 => 'Khác',
    ];

    /**
     * @var array
     */
    public static $position_expected = [
            0 => 'Tất cả',
            1 => 'Mới tốt nghiệp / Thực tập sinh',
            2 => 'Nhân viên',
            3 => 'Trưởng nhóm',
            4 => 'Phó phòng',
            5 => 'Trưởng phòng',
            6 => 'Quản lý cấp cao',
            10 => 'Khác',
        ];
    
}

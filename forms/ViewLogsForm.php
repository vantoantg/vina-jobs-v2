<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\forms;

use app\models\Users;
use yii\base\Model;

/**
 * Class NewsLatterForm
 * @package app\forms
 */
class ViewLogsForm extends Model
{
    public $files;
    public $fileName;
    public $textarea;

    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            ['files', 'filter', 'filter' => 'trim'],
        ];
    }

    public function formName()
    {
        return 'ViewLogs';
    }
}

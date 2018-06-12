<?php

/*
 *  Created by Tona Nguyen.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\models;

class Dropdown extends \app\models\base\Dropdown
{
    const STATUS_ACTIVE = 1;
    const STATUS_DISABLED = 0;

    const TYPE_GENDER = 4;
    const TYPE_LEVEL = 3;
    const TYPE_EXP = 2;
    const TYPE_TIME = 1;

    public $dropdowns;

    public function __construct(array $config = [])
    {
        parent::__construct($config);
        $this->getAll();
    }

    /**
     * @return array|\yii\db\ActiveRecord[]
     */
    public function getAll()
    {
        if ($this->dropdowns) {
            return $this->dropdowns;
        }

        $this->dropdowns = self::find()
            ->select('type, name, value')
            ->where('status = :status', [
                ':status' => Dropdown::STATUS_ACTIVE,
            ])
            ->orderBy(['arranged' => SORT_ASC])
            ->asArray()->all();

        return $this->dropdowns;
    }

    /**
     * @param int $type
     *
     * @return array
     */
    public function getDropdown($type = 0)
    {
        $array = [];
        $data = $this->dropdowns;
        foreach ($data as $item) {
            if ($type == $item['type']) {
                $item['id'] = $item['value'];
                $array[] = $item;
            }
        }

        return$array;
    }
}

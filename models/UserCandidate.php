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

class UserCandidate extends \app\models\base\UserCandidate
{
    /**
     * @param bool $insert
     *
     * @return bool
     */
    public function beforeSave($insert)
    {
        if ($this->isNewRecord) {
            $this->created_at = Datetime::datetimeSqlNow();
            $this->created_by = Common::currentUsers()->getId();
        } else {
        }

        return parent::beforeSave($insert);
    }

    /**
     * @param int $except
     *
     * @return array|null|\yii\db\ActiveRecord[]
     */
    public function getList($except = 0)
    {
        //Todo:...
        return [];
    }
}

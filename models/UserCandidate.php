<?php
/**
 * Created by Tona Nguyễn
 * Date: 1/29/2018
 * Time: 5:32 PM
 */

namespace app\models;

use app\library\helper\Common;
use app\library\helper\Datetime;
use yii\data\ActiveDataProvider;

class UserCandidate extends \app\models\base\UserCandidate
{
    /**
     * @param bool $insert
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
     * @return array|null|\yii\db\ActiveRecord[]
     */
    public function getList($except = 0)
    {
        //Todo:...
        return [];
    }
}

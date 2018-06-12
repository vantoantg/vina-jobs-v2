<?php

/*
 *  Created by Tona Nguyen.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\models;

use app\library\helper\Common;
use app\library\helper\Datetime;

class Pages extends \app\models\base\Pages
{
    const STATUS_ACTIVE = 1;

    /**
     * @param string $slug
     *
     * @return Pages|null|static
     */
    public static function get($slug = 'home')
    {
        $model = self::findOne(['slug' => $slug, 'status' => self::STATUS_ACTIVE]);
        if ($model) {
            return $model;
        }

        return new self();
    }

    /**
     * @param int $except
     *
     * @return array|null|\yii\db\ActiveRecord[]
     */
    public static function getList($except = 0)
    {
        $model = self::find()
            ->select(['id', 'name'])
            ->where(['<>', 'id', $except])
            ->all();
        if ($model) {
            return $model;
        }

        return null;
    }

    /**
     * @param bool $insert
     *
     * @return bool
     */
    public function beforeSave($insert)
    {
        if ($this->isNewRecord) {
            $this->created_at = Datetime::datetimeSqlNow();
            $this->updated_at = Datetime::datetimeSqlNow();
            $this->created_by = Common::currentUsers()->getId();
            $this->updated_by = Common::currentUsers()->getId();
        } else {
            $this->updated_at = Datetime::datetimeSqlNow();
            $this->updated_by = Common::currentUsers()->getId();
        }

        return parent::beforeSave($insert);
    }
}

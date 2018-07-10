<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\models;

use app\library\helper\Cons;
use app\library\helper\Datetime;

class NewsLatter extends \app\models\base\NewsLatter
{
    const STATUS_ACTIVE = 1;
    const STATUS_DRAFT = 0;

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
        } else {
            $this->updated_at = Datetime::datetimeSqlNow();
        }

        return parent::beforeSave($insert);
    }

    /**
     * @param $email
     * @return array
     */
    public function saveNewsLatter($email){
        $newsLatter = self::findOne(['email' => $email]);
        $message = Cons::MSG_NEWS_LATTER_REGISTERED;
        if(!$newsLatter){
            $model = new self();
            $model->email = $email;
            $model->save();
            $message = Cons::MSG_NEWS_LATTER_SUCCESS;
        }

        return ['error' => false, 'message' => $message];
    }
}

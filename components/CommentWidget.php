<?php

/*
 *  Created by Tona Nguyễn.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: Hồ Chí Minh, Việt Nam
 *  Website: https://jobsvina.com/
 */

namespace app\components;

use yii\base\Widget;

class CommentWidget extends Widget
{
    public $message;

    public function init()
    {
        parent::init();
        if ($this->message === null) {
            $this->message = 'Welcome User';
        } else {
            $this->message = 'Welcome '.$this->message;
        }
    }

    /**
     * @return string
     */
    public function commentFB()
    {
        return $this->render('comment/fb_box');
    }

    /**
     * @param $object_id
     * @param $object_type
     *
     * @return string
     */
    public function comment($object_id, $object_type)
    {
        return $this->render('comment/index', [
            'object_id' => $object_id,
            'object_type' => $object_type,
        ]);
    }
}

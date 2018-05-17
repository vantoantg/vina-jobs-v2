<?php
/**
 * Created by Tona Nguyễn
 * Date: 2/6/2018
 * Time: 6:23 PM
 */
namespace app\components;

use yii\base\Widget;
use app\library\helper\Helper;
use yii\helpers\Html;

class CommentWidget extends Widget
{
    public $message;

    public function init()
    {
        parent::init();
        if ($this->message === null) {
            $this->message = 'Welcome User';
        } else {
            $this->message = 'Welcome ' . $this->message;
        }

    }

	/**
	 * @return string
	 */
    public function commentFB(){
        return $this->render('comment/fb_box');
    }

	/**
	 * @param $object_id
	 * @param $object_type
	 * @return string
	 */
    public function comment($object_id, $object_type){
	    return $this->render('comment/index',[
	    	'object_id' => $object_id,
		    'object_type' => $object_type
	    ]);
    }
}
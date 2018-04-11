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

class SidebarWidget extends Widget
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

    public function recentJobs(){
	    return $this->render('sidebar/recent_job', [

	    ]);
    }

    public function archives(){
        return $this->render('sidebar/archives', [

        ]);
    }

    public function categories(){
        return $this->render('sidebar/categories', [

        ]);
    }

    public function newsLatter(){
        return $this->render('sidebar/news_latter', [

        ]);
    }


    public function searchResultJobs($_url){
        return $this->render('sidebar/search_result_jobs', [
            '_url' => $_url
        ]);
    }
}
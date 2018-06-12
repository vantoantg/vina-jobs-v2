<?php
/**
 * Created by Tona Nguyễn
 * Date: 2/6/2018
 * Time: 6:23 PM
 */
namespace app\components;

use app\models\Job;
use yii\base\Widget;
use app\library\helper\Helper;
use yii\helpers\Html;

class SiteWidget extends Widget
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
     * @param array $except_job_ids
     * @return string|void
     */
    public function footer($except_job_ids = [])
    {
        $data = Job::instance()->getRecentJobsSidebar($except_job_ids, 3);
        return $this->render('site/footer', [
            'data' => $data
        ]);
    }
}

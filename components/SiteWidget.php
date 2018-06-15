<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\components;

use app\models\Job;
use yii\base\Widget;

class SiteWidget extends Widget
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
     * @param array $except_job_ids
     *
     * @return string|void
     */
    public function footer($except_job_ids = [])
    {
        $data = Job::instance()->getRecentJobsSidebar($except_job_ids, 3);

        return $this->render('site/footer', [
            'data' => $data,
        ]);
    }
}

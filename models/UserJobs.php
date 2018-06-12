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

class UserJobs extends \app\models\base\UserJobs
{
    /**
     * @return mixed
     */
    public static function preapply()
    {
    }

    /**
     * @param $jobId
     * @param $data
     *
     * @return bool|int
     */
    public static function favorite($jobId, $data)
    {
        if ($jobId && $data) {
            $job = UserJobs::findOne(['user_id' => Common::currentUser(), 'jobs_id' => $jobId]);
            if (!$job) {
                $job = new UserJobs();
                if ($data['action'] == 'favorite') {
                    $job->saved = 1;
                }
                $job->user_id = Common::currentUser();
                $job->jobs_id = $jobId;
                $job->saved_time = Datetime::getDateNow(Datetime::SQL_DATETIME);
                $job->save();
            } else {
                if ($data['action'] == 'favorite') {
                    $job->saved = ($job->saved == 1) ? 0 : 1;
                }
                $job->update();
            }

            return $job->saved;
        }

        return false;
    }
}

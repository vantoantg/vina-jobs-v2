<?php
/**
 * Created by Tona Nguyễn
 * Date: 1/29/2018
 * Time: 5:32 PM
 */

namespace app\models;


use app\library\helper\Common;
use app\library\helper\Datetime;

class UserJobs extends \app\models\base\UserJobs
{
    public static function favoriteOrApply($jobId, $data){

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
        }
    }
}
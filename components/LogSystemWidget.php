<?php

/*
 *  Created by Tona Nguyen.
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\components;

use app\library\helper\Common;
use app\library\helper\Helper;
use app\library\helper\Datetime;
use app\models\LogSystem;
use Carbon\Carbon;
use yii\base\Widget;
use Yii;

/**
 * Created by Tona Nguyễn
 * Date: 6/12/2016
 * Time: 8:20 PM
 */
class LogSystemWidget extends Widget
{
    public $message;

    public function init()
    {
        parent::init();
    }

    public function run()
    {
    }

    public static function createLogs()
    {
//        ini_set('memory_limit', '4096M');
//        set_time_limit(300000);
        //	    $transaction = Yii::$app->db->beginTransaction();
//        for($i=0; $i<= 1000000000; $i++) {
        $u = new LogSystem();
        $user_id = Common::currentUser('id');
        $u->user_id = $user_id ? $user_id : 0;
        $u->time = Carbon::now()->format(Datetime::SQL_DATETIME);
        $u->browser = Helper::getBrowser();
        $u->url = Helper::getCurrentUrl();
        $u->ip = Helper::getIpClient();
        $u->controller = Yii::$app->controller->id;
        $u->action = Yii::$app->controller->action->id;
        $u->method = Helper::getMethod();
        $u->user_timezone = Common::currentUser('timezone');
        $u->save();
//        }
//        $transaction->rollBack();
    }
}

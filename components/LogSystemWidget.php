<?php
namespace app\components;
use \app\library\helper\Common;
use app\library\helper\Helper;
use app\library\helper\Datetime;
use app\models\LogSystem;
use Carbon\Carbon;
use yii\base\Widget;
use Yii;

/**
 * Created by PhpStorm.
 * User: Administrator
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

	public static function createLogs(){
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
	}
}
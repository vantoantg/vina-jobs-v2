<?php
/**
 *
 */

namespace app\library\helper;

use Yii;
use yii\helpers\Url;
use \yii\web\Response;

/**
 * Class Helper
 * @package app\library\helper
 */
class Helper
{

	public function init()
	{
	}

	/**
	 * @param array $data
	 * @return array
	 */
	public static function jsonData($data = [])
	{
		Yii::$app->response->format = Response::FORMAT_JSON;
		if(!$data){
			return ['data' => null];
		}else{
			return $data;
		}
	}

    /**
     * @return string
     */
	public static function homeUrl(){
	    return Yii::$app->getHomeUrl();
    }

    /**
     * @param bool $domainNameOnly
     * @return string
     */
	public static function siteURL($domainNameOnly = false)
	{
		$protocol = ((!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') ||
			$_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
		$domainName = $_SERVER['HTTP_HOST'];
		if($domainNameOnly){
			return $domainName;
		}
		return $protocol . $domainName;
	}


    /**
     * @param string $route
     * @param string $returnClass
     * @return string
     */
    public static function active($route = 'site/index', $returnClass = 'active')
    {
        if ($route == Yii::$app->controller->getRoute()) {
            return $returnClass;
        }

        return '';
    }

    /**
     * @param string $route
     * @return string
     */
    public static function createUrl($route = '/', $params = [])
    {
        if($params){
            // Todo
        }
        if($route == '/'){
            return self::homeUrl();
        }

        foreach (self::getRoutes() as $url => $r) {
            if ($route == $r) {
                return self::homeUrl() . $url;
            }
        }

        return $route;
    }


    /**
     * Get all route definned
     * @return mixed
     */
	public static function getRoutes(){
        $routes = include (Yii::$app->basePath .'/config/routes.php');
        return $routes;
    }

	public static function test(){
        echo '<pre>';
        print_r(Yii::$app->controller->getRoute());
        echo '</pre>';
        die;
    }
}

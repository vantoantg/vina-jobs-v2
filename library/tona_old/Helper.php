<?php
namespace app\components\tona;

use app\models\CacheImg;
use Carbon\Carbon;
use Yii;
use \app\components\library\abeautifulsite\SimpleImage;

class Helper
{
    public function init()
    {
    }

    /**
     * @param $route
     * @param $slug
     * @return string
     */
    public static function urlTo($route, $slug)
    {
        return \yii\helpers\Url::to('/'.$route.'/'.$slug.'.html');
    }

    /**
     * @param null $class
     * @return Helper|static
     */
    public static function instants($class = null)
    {
        if ($class instanceof static) {
            return clone $class;
        }
        return new static;
    }

    /**
     * @param $rootPath
     * @param $w
     * @param $h
     * @param string $position
     * @return string
     * @throws \Exception
     */
    public static function thumbnail($object_type, $object_id, $rootPath, $w, $h, $position = 'center')
    {
        $pathCache = CacheImg::instants()->getCache($object_type, $object_id, self::setSize($w, $h));
        if ($pathCache) {
            if (self::checkImage($pathCache, false) == false) {
                CacheImg::instants()->removeArray($object_type, $object_id, self::setSize($w, $h));
                return self::thumbnail($object_type, $object_id, $rootPath, $w, $h);
            }
            return self::checkImage($pathCache, true, Cons::IMG_DEFAULT_PROJECT);
        } else {
            return self::createThumbnail($object_type, $object_id, $rootPath, $w, $h, $position);
        }
    }

    /**
     * @param string $object_type
     * @param $object_id
     * @param $rootPath
     * @param $w
     * @param $h
     * @param string $position
     * @return string
     * @throws \Exception
     */
    public static function createThumbnail($object_type, $object_id, $rootPath, $w, $h, $position = 'center')
    {
        if (self::checkImage($rootPath, false) == false) {
            return Cons::IMG_DEFAULT;
        }
        $img = Yii::$app->basePath.$rootPath;
        $name = explode('/', $img);
        $name = $name[count($name) - 1];

        $newFile = '/web/cache/img/'.md5($object_type).'-'.$name;
        @chmod(Yii::$app->basePath.'/web/cache/img', 0777);
        $im = new SimpleImage();

        $im->load($img)->thumbnail($w, $h, $position)->save(Yii::$app->basePath.$newFile, 100);
        CacheImg::instants()->saveCache($object_type, $object_id, $newFile, self::setSize($w, $h));
        return $newFile;
    }

    /**
     * @param $w
     * @param $h
     * @return string
     */
    public static function setSize($w, $h)
    {
        return $w.'x'.$h;
    }

    /**
     * @param $key
     * @return string
     */
    public static function getSeo($key)
    {
        if (isset(Yii::$app->view->params[$key])) {
            return Yii::$app->view->params[$key];
        } else {
            return '';
        }
    }

    /**
     * @param $key
     * @param $value
     */
    public static function setSeo($key, $value)
    {
        Yii::$app->view->params[$key] = $value;
    }

    /**
     * @return string
     */
    public static function userAvatar()
    {
        return self::checkImage(Common::currentUser('avatar'), true);
    }

    /**
     * @param $path
     * @param string $img_default
     * @return string
     */
    public static function checkImage($path, $checkOnly = false, $img_default = Cons::IMG_DEFAULT_USER)
    {
        if ($path && file_exists(Yii::$app->basePath.$path)) {
            return $path;
        } else {
            if ($checkOnly == false) {
                return false;
            }
            return $img_default;
        }
    }

    /**
     * @param array $controllers
     * @return string
     */
    public static function checkMenuAdmin($controllers = [], $sub_menu = false, $class = 'active')
    {
        $con = explode('/', Yii::$app->controller->id);
        if ($sub_menu) {
            $con = Yii::$app->controller->action->id;
        }

        if (isset($con[1]) && in_array($con[1], $controllers)) {
            return $class;
        } else {
            return '';
        }
    }

    /**
     * @param $action
     * @return string
     */
    public static function checkActiveMenu($action)
    {
        if (Yii::$app->controller->id.'/'.Yii::$app->controller->action->id == $action) {
            return 'active';
        } else {
            return '';
        }
    }

    /**
     * @param $number
     * @return string
     */
    public static function formatNumber($number)
    {
        return number_format("$number");
    }

    /**
     * @return mixed
     */
    public static function getMethod()
    {
        return $_SERVER['REQUEST_METHOD'];
    }
    /**
     * @return mixed
     */
    public static function getIpClient()
    {
        return $_SERVER['SERVER_ADDR'];
    }
    /**
     * @return mixed
     */
    public static function getBrowser()
    {
        return  $_SERVER['HTTP_USER_AGENT'];
    }
    /**
     * @return string
     */
    public static function getCurrentUrl()
    {
        return "http" . (($_SERVER['SERVER_PORT'] == 443) ? "s://" : "://") . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
    }
    /**
     * @param $name
     * @return mixed
     */
    public static function getCookie($name)
    {
        $return = explode('~', $name);
        if (!isset($_COOKIE[$name])) {
            return $return[0];
        } else {
            return $return[1];
        }
    }

    /**
     * @param $array
     * @return \stdClass
     */
    public static function arrayToObject($array)
    {
        $object = new \stdClass();
        foreach ($array as $key => $value) {
            if (is_array($value)) {
                $value = self::arrayToObject($value);
            }
            $object->$key = $value;
        }
        return $object;
    }

    /**
     * @param $object
     * @return array
     */
    public static function objectToArray($object)
    {
        $arrays = [];
        foreach ($object as $key => $value) {
            if (is_object($value)) {
                $value = self::objectToArray($value);
            }
            $arrays[$key] = $value;
        }
        return $arrays;
    }

    /**
     * @param $strUrl
     * @return string
     */
    public function checkUrlHttp($strUrl)
    {
        $arrParsedUrl = parse_url($strUrl);
        if (!empty($arrParsedUrl['scheme'])) {
            // Contains http:// schema
            if ($arrParsedUrl['scheme'] === "http") {
            }
            // Contains https:// schema
            elseif ($arrParsedUrl['scheme'] === "https") {
            }
            return $strUrl;
        } else {
            return 'http://'.$strUrl;
        }
    }

    /**
     * @param array $data
     * @return array
     */
    public static function jsonData($data = [])
    {
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        if (!$data) {
            return ['data' => null];
        } else {
            return $data;
        }
    }

    /**
     * @return string
     */
    public static function urlTemplate()
    {
        return self::siteURL().'/web/template/'.Cons::TEMPLATE_FOLDER.'/';
    }

    /**
     * @return string
     */
    public static function siteURL($domainNameOnly = false)
    {
        $protocol = ((!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') ||
            $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
        $domainName = $_SERVER['HTTP_HOST'];
        if ($domainNameOnly) {
            return $domainName;
        }
        return $protocol . $domainName;
    }

    /**
     * Function used to create a slug associated to an "ugly" string.
     *
     * @param string $string the string to transform.
     *
     * @return string the resulting slug.
     */
    public static function createSlug($strings)
    {
        $string = self::stripUnicode($strings);
        $table = array(
            '�'=>'S', '�'=>'s', '?'=>'Dj', '?'=>'dj', '�'=>'Z', '�'=>'z', '?'=>'C', '?'=>'c', '?'=>'C', '?'=>'c',
            '�'=>'A', '�'=>'A', '�'=>'A', '�'=>'A', '�'=>'A', '�'=>'A', '�'=>'A', '�'=>'C', '�'=>'E', '�'=>'E',
            '�'=>'E', '�'=>'E', '�'=>'I', '�'=>'I', '�'=>'I', '�'=>'I', '�'=>'N', '�'=>'O', '�'=>'O', '�'=>'O',
            '�'=>'O', '�'=>'O', '�'=>'O', '�'=>'U', '�'=>'U', '�'=>'U', '�'=>'U', '�'=>'Y', '�'=>'B', '�'=>'Ss',
            '�'=>'a', '�'=>'a', '�'=>'a', '�'=>'a', '�'=>'a', '�'=>'a', '�'=>'a', '�'=>'c', '�'=>'e', '�'=>'e',
            '�'=>'e', '�'=>'e', '�'=>'i', '�'=>'i', '�'=>'i', '�'=>'i', '�'=>'o', '�'=>'n', '�'=>'o', '�'=>'o',
            '�'=>'o', '�'=>'o', '�'=>'o', '�'=>'o', '�'=>'u', '�'=>'u', '�'=>'u', '�'=>'y', '�'=>'y', '�'=>'b',
            '�'=>'y', '?'=>'R', '?'=>'r', '/' => '-', ' ' => '-', '.' => '', ',' => '', ';' => '', ':' => '-', '@' => '-'
        );

        // -- Remove duplicated spaces
        $stripped = preg_replace(array('/\s{2,}/', '/[\t\n]/'), ' ', $string);

        // -- Returns the slug
        return strtolower(strtr($string, $table));
    }

    /**
     * @param $str
     * @return mixed
     */
    public static function stripUnicode($str)
    {
        $str = preg_replace("/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/", 'a', $str);
        $str = preg_replace("/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/", 'e', $str);
        $str = preg_replace("/(ì|í|ị|ỉ|ĩ)/", 'i', $str);
        $str = preg_replace("/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/", 'o', $str);
        $str = preg_replace("/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/", 'u', $str);
        $str = preg_replace("/(ỳ|ý|ỵ|ỷ|ỹ)/", 'y', $str);
        $str = preg_replace("/(đ)/", 'd', $str);
        $str = preg_replace("/(À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ)/", 'A', $str);
        $str = preg_replace("/(È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ)/", 'E', $str);
        $str = preg_replace("/(Ì|Í|Ị|Ỉ|Ĩ)/", 'I', $str);
        $str = preg_replace("/(Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ)/", 'O', $str);
        $str = preg_replace("/(Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ)/", 'U', $str);
        $str = preg_replace("/(Ỳ|Ý|Ỵ|Ỷ|Ỹ)/", 'Y', $str);
        $str = preg_replace("/(Đ)/", 'D', $str);
        $str = str_replace("  ", " ", $str);
        $str = str_replace("   ", " ", $str);
        $str = str_replace("    ", " ", $str);
        $str = str_replace("     ", " ", $str);
        $str = str_replace("      ", " ", $str);
        $str = str_replace("       ", " ", $str);
        $str = str_replace("        ", " ", $str);
        $str = str_replace("         ", " ", $str);
        $str = str_replace("          ", " ", $str);
        $str = str_replace("           ", " ", $str);
        return $str;
    }

    /**
     * @param $str
     * @param int $words
     * @return string
     */
    public static function cutStringSpace($str, $words = 20)
    {
        if ($str) {
            $string = '';
            $arr = explode(' ', $str);
            if (count($arr) > $words) {
                for ($i = 0; $i < $words; $i++) {
                    $string .= ' '. $arr[$i];
                }
                return trim($string.'...');
            }
            return $str;
        }
    }

    /**
     * @return array
     */
    public static function getConfigDb()
    {
        $dsn = str_replace('mysql:', '', Yii::$app->getDb()->dsn);
        $dsn = explode(';', $dsn);
        $db_user = Yii::$app->getDb()->username;
        $db_pass = Yii::$app->getDb()->password;
        $db_host = str_replace('host=', '', $dsn[0]);
        $db_name = str_replace('dbname=', '', $dsn[1]);

        return ['host' => $db_host, 'user' => $db_user, 'pass' => $db_pass, 'db_name' => $db_name];
    }
    /**
     * @param $host
     * @param $user
     * @param $pass
     * @param $name
     * @param string $tables
     */
    public static function backupDB($host = null, $user = null, $pass = null, $name = null, $tables = '*')
    {
        if ($host == null) {
            $host = Helper::getConfigDb()['host'];
        }
        if ($user == null) {
            $user = Helper::getConfigDb()['user'];
        }
        if ($pass == null) {
            $pass = Helper::getConfigDb()['pass'];
        }
        if ($name == null) {
            $name = Helper::getConfigDb()['db_name'];
        }

        $path = Yii::$app->basePath.'/db/backups';
        @chmod($path, 0777);

        /* backup the db OR just a table */
        $link = mysqli_connect($host, $user, $pass);
        mysqli_select_db($link, $name);

        //get all of the tables
        if ($tables == '*') {
            $tables = array();
            $result = mysqli_query($link, 'SHOW TABLES');
            while ($row = mysqli_fetch_row($result)) {
                $tables[] = $row[0];
            }
        } else {
            $tables = is_array($tables) ? $tables : explode(',', $tables);
        }

        $return = '';
        //cycle through
        foreach ($tables as $table) {
            $result = mysqli_query($link, 'SELECT * FROM ' . $table);
            $num_fields = mysqli_num_fields($result);

            $return .= 'DROP TABLE ' . $table . ';';
            $row2 = mysqli_fetch_row(mysqli_query($link, 'SHOW CREATE TABLE ' . $table));
            $return .= "\n\n" . $row2[1] . ";\n\n";

            for ($i = 0; $i < $num_fields; $i++) {
                while ($row = mysqli_fetch_row($result)) {
                    $return .= 'INSERT INTO ' . $table . ' VALUES(';
                    for ($j = 0; $j < $num_fields; $j++) {
                        $row[$j] = addslashes($row[$j]);
                        $row[$j] = mb_ereg_replace("\n", "\\n", $row[$j]);
                        if (isset($row[$j])) {
                            $return .= '"' . $row[$j] . '"';
                        } else {
                            $return .= '""';
                        }
                        if ($j < ($num_fields - 1)) {
                            $return .= ',';
                        }
                    }
                    $return .= ");\n";
                }
            }
            $return .= "\n\n\n";
        }

        //save file
        $time = Common::currentUser() . '-' . Carbon::now(Common::currentUser('timezone'))->format(Datetime::FILE_TIME);
        $handle = fopen($path.'/db-backup-' . $time . '.sql', 'w+');
        fwrite($handle, $return);
        fclose($handle);
    }
}

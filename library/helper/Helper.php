<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\library\helper;

use app\models\Pages;
use Carbon\Carbon;
use Yii;
use yii\web\Response;

/**
 * Class Helper
 */
class Helper
{
    /**
     * @var object Helper
     */
    protected static $_instance;

    public function init()
    {
    }

    /**
     * @param bool $refresh
     * @return Helper|object
     */
    public static function getInstance($refresh = false)
    {
        if ($refresh || !(self::$_instance instanceof self)) {
            self::$_instance = new self();
        }

        return self::$_instance;
    }

    /**
     * @return string
     */
    public function getTzUser()
    {
        if (Common::isLoginned()) {
            return Common::currentUser('timezone');
        }

        return Datetime::DEFAULT_TIME_ZONE;
    }

    /**
     * @param array $data
     *
     * @return array
     */
    public function jsonData($data = [])
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        if (!$data) {
            return ['data' => null];
        } else {
            return $data;
        }
    }

    /**
     * @return string
     */
    public function homeUrl()
    {
        return Yii::$app->getHomeUrl();
    }

    /**
     * @return string
     */
    public function webImgs($pathFile, $check = true)
    {
        if ($pathFile) {
            $path = Yii::$app->getHomeUrl().'web/imgs/'.$pathFile;
            if ($check && file_exists(Yii::$app->basePath.'/'.$pathFile)) {
                return $path;
            }
        }

        return Yii::$app->getHomeUrl().'web/imgs/no-image.jpg';
    }

    /**
     * @param $pathFile
     * @param int $w
     * @param int $h
     *
     * @return mixed|string
     */
    public function imgRender($pathFile, $w = 100, $h = 100, $prefix = 'blog')
    {
        if (!$pathFile || !file_exists(Yii::$app->basePath.'/'.$pathFile)) {
            $pathFile = '/web/imgs/no-image.jpg';
        }

        $basePath = Yii::$app->basePath.'/'.$pathFile;
        $pathFileArr = explode('/', $pathFile);
        $imgName = end($pathFileArr);
        $prefix = $prefix.'-'.$w.'@'.$h;
        $newUrl = self::homeUrl().'web/assets/'.$prefix.'-'.md5(date('Ymd')).'-'.$imgName;
        $newPath = Yii::$app->basePath.'/web/assets/'.$prefix.'-'.md5(date('Ymd')).'-'.$imgName;

        if (file_exists($newPath)) {
            return $newUrl;
        }

        if (file_exists($basePath)) {
            $img = new \app\library\helper\SimpleImage();
            $img->load($basePath);
            $img->thumbnail($w, $h);
            $img->save($newPath, 100);

            return $newUrl;
        }
    }

    /**
     * @return string
     */
    public function userAvatar($pathFile, $check = true)
    {
        if ($pathFile) {
            $path = Yii::$app->getHomeUrl().$pathFile;
            if ($check && file_exists(Yii::$app->basePath.'/'.$pathFile)) {
                return $path;
            }
        }

        return Yii::$app->getHomeUrl().'web/imgs/no-image.jpg';
    }

    /**
     * @param bool $domainNameOnly
     *
     * @return string
     */
    public function siteURL($domainNameOnly = false)
    {
        $protocol = ((!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') ||
            $_SERVER['SERVER_PORT'] == 443) ? 'https://' : 'http://';
        $domainName = $_SERVER['HTTP_HOST'];
        if ($domainNameOnly) {
            return $domainName;
        }

        return $protocol.$domainName;
    }

    /**
     * @param string $route
     * @param string $returnClass
     *
     * @return string
     */
    public function active($route = 'site/index', $returnClass = 'active')
    {
        if ($route == Yii::$app->controller->getRoute()) {
            return $returnClass;
        }

        return '';
    }

    /**
     * @param $params
     *
     * @return string
     */
    public function createUrl($params)
    {
        if (!is_array($params)) {
            $params = [$params];
        }

        return Yii::$app->getUrlManager()->createUrl($params);
    }

    /**
     * Get all route definned
     *
     * @return mixed
     */
    public function getRoutes()
    {
        $routes = include Yii::$app->basePath.'/config/routes.php';

        return $routes;
    }

    /**
     * @return mixed
     */
    public function getBrowser()
    {
        return $_SERVER['HTTP_USER_AGENT'];
    }

    public static function test()
    {
        echo '<pre>';
        print_r(Yii::$app->controller->getRoute());
        echo '</pre>';
        die;
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
     * @return string
     */
    public static function getCurrentUrl()
    {
        return 'http'.(($_SERVER['SERVER_PORT'] == 443) ? 's://' : '://').$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
    }

    /**
     * @param $name
     *
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
     *
     * @return \stdClass
     */
    public function arrayToObject($array)
    {
        $object = new \stdClass();
        foreach ($array as $key => $value) {
            if (is_array($value)) {
                $value = self::getInstance()->arrayToObject($value);
            }
            $object->$key = $value;
        }

        return $object;
    }

    /**
     * @param $object
     *
     * @return array
     */
    public function objectToArray($object)
    {
        $arrays = [];
        foreach ($object as $key => $value) {
            if (is_object($value)) {
                $value = self::getInstance()->objectToArray($value);
            }
            $arrays[$key] = $value;
        }

        return $arrays;
    }

    /**
     * @param $strUrl
     *
     * @return string
     */
    public function checkUrlHttp($strUrl)
    {
        $arrParsedUrl = parse_url($strUrl);
        if (!empty($arrParsedUrl['scheme'])) {
            // Contains http:// schema
            if ($arrParsedUrl['scheme'] === 'http') {
            } // Contains https:// schema
            else {
                if ($arrParsedUrl['scheme'] === 'https') {
                }
            }

            return $strUrl;
        } else {
            return 'http://'.$strUrl;
        }
    }

    /**
     * @return string
     */
    public function urlTemplate()
    {
        return self::siteURL().'/web/template/'.Cons::TEMPLATE_FOLDER.'/';
    }

    /**
     * Function used to create a slug associated to an "ugly" string.
     *
     * @param string $string the string to transform.
     *
     * @return string the resulting slug.
     */
    public function createSlug($strings)
    {
        $string = self::getInstance()->stripUnicode($strings);
        $table = [
            '�' => 'S',
            '�' => 's',
            '?' => 'Dj',
            '?' => 'dj',
            '�' => 'Z',
            '�' => 'z',
            '?' => 'C',
            '?' => 'c',
            '?' => 'C',
            '?' => 'c',
            '�' => 'A',
            '�' => 'A',
            '�' => 'A',
            '�' => 'A',
            '�' => 'A',
            '�' => 'A',
            '�' => 'A',
            '�' => 'C',
            '�' => 'E',
            '�' => 'E',
            '�' => 'E',
            '�' => 'E',
            '�' => 'I',
            '�' => 'I',
            '�' => 'I',
            '�' => 'I',
            '�' => 'N',
            '�' => 'O',
            '�' => 'O',
            '�' => 'O',
            '�' => 'O',
            '�' => 'O',
            '�' => 'O',
            '�' => 'U',
            '�' => 'U',
            '�' => 'U',
            '�' => 'U',
            '�' => 'Y',
            '�' => 'B',
            '�' => 'Ss',
            '�' => 'a',
            '�' => 'a',
            '�' => 'a',
            '�' => 'a',
            '�' => 'a',
            '�' => 'a',
            '�' => 'a',
            '�' => 'c',
            '�' => 'e',
            '�' => 'e',
            '�' => 'e',
            '�' => 'e',
            '�' => 'i',
            '�' => 'i',
            '�' => 'i',
            '�' => 'i',
            '�' => 'o',
            '�' => 'n',
            '�' => 'o',
            '�' => 'o',
            '�' => 'o',
            '�' => 'o',
            '�' => 'o',
            '�' => 'o',
            '�' => 'u',
            '�' => 'u',
            '�' => 'u',
            '�' => 'y',
            '�' => 'y',
            '�' => 'b',
            '�' => 'y',
            '?' => 'R',
            '?' => 'r',
            '/' => '-',
            ' ' => '-',
            '.' => '',
            ',' => '',
            ';' => '',
            ':' => '-',
            '@' => '-',
            '(' => '-',
            ')' => '-',
        ];

        // -- Remove duplicated spaces
        $string = preg_replace(['/\s{2,}/', '/[\t\n]/'], ' ', $string);

        // -- Returns the slug
        $str = strtolower(strtr($string, $table));
        $str = str_replace('--', '-', $str);
        $str = str_replace('---', '-', $str);
        $str = str_replace('----', '-', $str);

        return $str;
    }

    /**
     * @param $str
     *
     * @return mixed
     */
    public function stripUnicode($str)
    {
        $str = preg_replace('/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/', 'a', $str);
        $str = preg_replace('/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/', 'e', $str);
        $str = preg_replace('/(ì|í|ị|ỉ|ĩ)/', 'i', $str);
        $str = preg_replace('/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/', 'o', $str);
        $str = preg_replace('/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/', 'u', $str);
        $str = preg_replace('/(ỳ|ý|ỵ|ỷ|ỹ)/', 'y', $str);
        $str = preg_replace('/(đ)/', 'd', $str);
        $str = preg_replace('/(À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ)/', 'A', $str);
        $str = preg_replace('/(È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ)/', 'E', $str);
        $str = preg_replace('/(Ì|Í|Ị|Ỉ|Ĩ)/', 'I', $str);
        $str = preg_replace('/(Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ)/', 'O', $str);
        $str = preg_replace('/(Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ)/', 'U', $str);
        $str = preg_replace('/(Ỳ|Ý|Ỵ|Ỷ|Ỹ)/', 'Y', $str);
        $str = preg_replace('/(Đ)/', 'D', $str);
        $str = str_replace('  ', ' ', $str);
        $str = str_replace('   ', ' ', $str);
        $str = str_replace('    ', ' ', $str);
        $str = str_replace('     ', ' ', $str);
        $str = str_replace('      ', ' ', $str);
        $str = str_replace('       ', ' ', $str);
        $str = str_replace('        ', ' ', $str);
        $str = str_replace('         ', ' ', $str);
        $str = str_replace('          ', ' ', $str);
        $str = str_replace('           ', ' ', $str);

        return $str;
    }

    /**
     * @param $str
     * @param int $words
     *
     * @return string
     */
    public function cutStringSpace($str, $words = 20)
    {
        if ($str) {
            $string = '';
            $arr = explode(' ', $str);
            if (count($arr) > $words) {
                for ($i = 0; $i < $words; $i++) {
                    $string .= ' '.$arr[$i];
                }

                return trim($string.'...');
            }

            return $str;
        }
    }

    /**
     * @return array
     */
    public function getConfigDb()
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
    public function backupDB($host = null, $user = null, $pass = null, $name = null, $tables = '*')
    {
        if ($host == null) {
            $host = Helper::getInstance()->getConfigDb()['host'];
        }
        if ($user == null) {
            $user = Helper::getInstance()->getConfigDb()['user'];
        }
        if ($pass == null) {
            $pass = Helper::getInstance()->getConfigDb()['pass'];
        }
        if ($name == null) {
            $name = Helper::getInstance()->getConfigDb()['db_name'];
        }

        $path = Yii::$app->basePath.'/web/backups';

        /* backup the db OR just a table */
        $link = mysqli_connect($host, $user, $pass);
        mysqli_select_db($link, $name);

        //get all of the tables
        if ($tables == '*') {
            $tables = [];
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
            $result = mysqli_query($link, 'SELECT * FROM '.$table);
            $num_fields = mysqli_num_fields($result);

            $return .= 'DROP TABLE '.$table.';';
            $row2 = mysqli_fetch_row(mysqli_query($link, 'SHOW CREATE TABLE '.$table));
            $return .= "\n\n".$row2[1].";\n\n";

            for ($i = 0; $i < $num_fields; $i++) {
                while ($row = mysqli_fetch_row($result)) {
                    $return .= 'INSERT INTO '.$table.' VALUES(';
                    for ($j = 0; $j < $num_fields; $j++) {
                        $row[$j] = addslashes($row[$j]);
                        $row[$j] = mb_ereg_replace("\n", '\\n', $row[$j]);
                        if (isset($row[$j])) {
                            $return .= '"'.$row[$j].'"';
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
        $time = Common::currentUser().'-'.Carbon::now(Common::currentUser('timezone'))->format(Datetime::FILE_TIME);
        $handle = fopen($path.'/db-backup-'.$time.'.sql', 'w+');
        fwrite($handle, $return);
        fclose($handle);
    }

    /**
     * @param $page
     *
     * @return string
     */
    public function titleSeo($page)
    {
        /* @var $page Pages */
        return $page->seo_title ? $page->seo_title : Yii::$app->params['seo']['title'].' | '.Helper::getInstance()->params();
    }

    /**
     * @param $page
     */
    public function generateSeo($page)
    {
        /* @var $page Pages */
        Yii::$app->params['seo']['description'] = ($page->seo_description) ? $page->seo_description : Yii::$app->params['seo']['description'];
        Yii::$app->params['seo']['keywords'] = ($page->seo_keyword) ? $page->seo_keyword : Yii::$app->params['seo']['keywords'];
    }

    /**
     * @param array $items
     * @param string $activeClass
     *
     * @return string
     */
    public function activeMenu($items = [], $activeClass = 'expanded')
    {
        if ($items) {
            foreach ($items as $item) {
                if ($item == Yii::$app->controller->id.'/'.Yii::$app->controller->action->id) {
                    return $activeClass;
                }
            }
        }

        return '';
    }

    public function humanFilesize($bytes, $decimals = 2)
    {
        $size = ['B', 'kB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
        $factor = floor((strlen($bytes) - 1) / 3);

        return sprintf("%.{$decimals}f", $bytes / pow(1024, $factor)).@$size[$factor];
    }

    public function redactorOps($placeholder = '')
    {
        return [
            'placeholder' => $placeholder,
            'observeLinks' => true,
            'convertVideoLinks' => true,
            'imageUpload' => ['/web/uploads/image'],
            'fileUpload' => ['/web/uploads/file'],
            'plugins' => ['fontcolor', 'fontsize', 'fontfamily', 'fullscreen', 'table', 'video', 'counter', 'textdirection', 'clips'],
            'toolbar' => true,
            'buttons' => [
                'html',
//                'format',
                'formatting',
                'lists',
                'bold',
                'italic',
                'deleted',
                'underline',
                'horizontalrule',
                'alignment',
                'unorderedlist',
                'orderedlist',
                'outdent',
                'indent',
                'link',
                /*'image',
                'file'*/
            ],
        ];
    }

    /**
     * @param string $param
     * @param string $param2
     * @param string $param3
     *
     * @return mixed
     */
    public function params($param = 'siteName', $param2 = '', $param3 = '')
    {
        if ($param2) {
            return Yii::$app->params[$param][$param2];
        }
        if ($param3) {
            return Yii::$app->params[$param][$param2][$param3];
        }

        return isset(Yii::$app->params[$param]) ? Yii::$app->params[$param] : null;
    }

    /**
     * @param bool $check_mobile
     *
     * @return string
     */
    public function wowClass($check_mobile = false)
    {
        if ($check_mobile) {
            return '';
        }

        if (!Helper::getInstance()->params('urlCookied')) {
            return 'wow';
        }

        return '';
    }

    /**
     * @return string 'data-toggle="modal" data-target="#login-modal"'
     */
    public function checkLogin()
    {
        if (!Common::isLoginned()) {
            return 'data-toggle="modal" data-target="#login-modal"';
        }

        return '';
    }

    /**
     * @param $string
     * @param bool $action
     *
     * @return bool|string
     */
    public function encrypt($string, $action = true)
    {
        // you may change these values to your own
        $secret_key = Helper::getInstance()->params('encrypt', 'my_simple_secret_key');
        $secret_iv = Helper::getInstance()->params('encrypt', 'my_simple_secret_iv');

        $encrypt_method = 'AES-256-CBC';
        $key = hash('sha256', $secret_key);
        $iv = substr(hash('sha256', $secret_iv), 0, 16);

        if ($action === true) {
            $output = base64_encode(openssl_encrypt($string, $encrypt_method, $key, 0, $iv));
        } else {
            $output = openssl_decrypt(base64_decode($string), $encrypt_method, $key, 0, $iv);
        }

        return $output;
    }

    /**
     * @param $path
     *
     * @return bool|mixed|string
     */
    public function getContentFileWith($path)
    {
        $content = file_get_contents($path);
        $content = str_replace('../fonts/gg-', self::homeUrl().'web/template/jobs/prod/fonts/gg-', $content);
        $content = str_replace('../fonts/fontello/', self::homeUrl().'/web/template/jobs/prod/fonts/fontello/', $content);
        $content = str_replace('../webfonts/', self::homeUrl().'web/template/jobs/prod/webfonts/', $content);

        $content = str_replace('img/', self::homeUrl().'web/template/jobs/prod/css/img/', $content);

        return $content;
    }
}

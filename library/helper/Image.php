<?php
/**
 * Created by Tona Nguyễn
 * Date: 3/28/2017
 * Time: 11:35 AM
 */

namespace app\library\helper;

class Image
{

	/**
	 * @param $data_image
	 * @param string $img_type
	 * @param string $path_save
	 * @return string
	 *
	 * Doc: http://www.tricksofit.com/2014/10/save-base64-encoded-image-to-file-using-php#.WqIrEOhuaUk
	 */
    public static function base64ToImage($data_image, $img_type = 'png', $path_save = 'imgs')
    {
        $data = str_replace('data:image/png;base64,', '', $data_image);
        $data = str_replace(' ', '+', $data);
        $data = base64_decode($data);
        $path = 'web/'.$path_save.'/' . uniqid() . '.'.$img_type;
        $file_save = \Yii::$app->basePath.'/'.$path;
        if(file_put_contents($file_save, $data)){
        	return $path;
        }
    }
}

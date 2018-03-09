<?php
namespace app\library\helper;

class Image
{
    // Doc: http://www.tricksofit.com/2014/10/save-base64-encoded-image-to-file-using-php#.WqIrEOhuaUk
    public static function base64ToImage($data_image)
    {
        $data = str_replace('data:image/png;base64,', '', $data_image);
        $data = str_replace(' ', '+', $data);
        $data = base64_decode($data);
        $file = 'images/' . uniqid() . '.png';
        $success = file_put_contents($file, $data);
    }
}

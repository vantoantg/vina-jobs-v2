<?php
/**
 * Created by Tona Nguyễn
 * Date: 1/29/2018
 * Time: 5:32 PM
 */

namespace app\models;


class FileUploads extends \app\models\base\FileUploads
{

    const CANDIDATE = 'candidate';
    /**
     * @param $object_type
     * @param $object_id
     * @param $file_path
     * @param $file_name
     * @param $file_type
     * @return FileUploads
     */
    public static function saveFile($object_type, $object_id, $file_path, $file_name, $file_type)
    {
        $file = new FileUploads();
        $file->object_type = $object_type;
        $file->object_id = $object_id;
        $file->file_path = $file_path;
        $file->file_name = $file_name;
        $file->file_type = $file_type;
        $file->save();
        return $file;
    }
}
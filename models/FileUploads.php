<?php
/**
 * Created by Tona Nguyễn
 * Date: 1/29/2018
 * Time: 5:32 PM
 */

namespace app\models;


use app\library\helper\Common;
use yii\db\Query;

class FileUploads extends \app\models\base\FileUploads
{

    const CANDIDATE = 'candidate';

    /**
     * @return array|false
     */
    public static function getCV(){
        $user_id = Common::isLoginned() ? Common::currentUsers()->getId() : 0;
        $query = new Query();
        $query->select([
                'cv.file_name',
                'cv.file_type'
            ]
        )
            ->from('tn_file_uploads cv')
            ->where('cv.created_by = :created_by AND cv.object_type = :object_type AND cv.is_deleted = 0', [
                'created_by' => $user_id,
                'object_type' => self::CANDIDATE
            ])
        ->orderBy(['cv.created_at' => SORT_ASC]);

        return $query->createCommand()->queryAll();
    }

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
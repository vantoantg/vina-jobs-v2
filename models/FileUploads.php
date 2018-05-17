<?php
/**
 * Created by Tona Nguyễn
 * Date: 1/29/2018
 * Time: 5:32 PM
 */

namespace app\models;


use app\library\helper\Common;
use app\library\helper\Datetime;
use app\library\helper\Helper;
use yii\db\Query;

class FileUploads extends \app\models\base\FileUploads
{

    const CANDIDATE = 'candidate';
    const COM_GALLERY = 'company_gallery';


    /**
     * @param $object_type
     * @param $object_id
     * @return array
     */
    public function getListByObjects($object_type, $object_id){
        $query = new Query();
        $query->select([
                'f.id',
                'f.file_path',
                'f.file_name',
                'f.file_type',
                'f.created_at',
            ]
        )
            ->from('tn_file_uploads f')
            ->where('f.object_type = :object_type AND f.object_id = :object_id AND f.is_deleted = 0', [
                'object_type' => $object_type,
                'object_id' => $object_id
            ])
            ->orderBy(['f.arranged' => SORT_ASC,'f.created_at' => SORT_ASC]);

        return $query->createCommand()->queryAll();
    }

    /**
     * @return array|false
     */
    public static function getCV(){
        $user_id = Common::isLoginned() ? Common::currentUsers()->getId() : 0;
        $query = new Query();
        $query->select([
                'cv.file_path',
                'cv.file_name',
                'cv.file_type',
                'cv.created_at',
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
    public static function saveFile($object_type, $file_path, $file_name, $file_type,  $object_id = 0)
    {
        $file = new FileUploads();
        $file->object_type = $object_type;
        $file->object_id = $object_id;
        $file->file_path = $file_path;
        $file->file_name = $file_name;
        $file->file_type = $file_type;
        $file->created_by = Common::currentUser();
        $file->created_at = Datetime::createdAt();
        $file->save();
        return $file;
    }

    /**
     * @param $data
     */
    public function doArrange($data){
        $db = \Yii::$app->db;
        $table = self::tableName();
        if($data){
            foreach ($data as $id => $arrange){
                $sql = "UPDATE $table SET `arranged` = :arranged WHERE `id` = :id";
                $params = [
                    'arranged' => $arrange,
                    'id' => $id
                ];
                $db->createCommand($sql)->bindValues($params)->execute();
            }
        }

    }

	/**
	 * @param $fileId
	 * @return bool
	 */
    public function deleteFile($fileId)
    {
	    $file = FileUploads::findOne($fileId);
	    if($file){
		    @unlink(\Yii::$app->basePath.Helper::params('companyCompanyGallery').$file->file_path);
		    $file->delete();
		    return true;
	    }
	    return false;
    }
}
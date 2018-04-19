<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "tn_file_uploads".
 *
 * @property int $id
 * @property string $object_type
 * @property int $object_id
 * @property string $file_path
 * @property string $file_name
 * @property string $file_type
 * @property string $created_at
 * @property int $created_by
 * @property int $is_deleted
 */
class FileUploads extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tn_file_uploads';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['object_type', 'object_id'], 'required'],
            [['object_id', 'created_by', 'is_deleted'], 'integer'],
            [['created_at'], 'safe'],
            [['object_type'], 'string', 'max' => 50],
            [['file_type'], 'string', 'max' => 10],
            [['file_path'], 'string', 'max' => 155],
            [['file_name'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'object_type' => 'Object Type',
            'object_id' => 'Object ID',
            'file_path' => 'File Path',
            'file_name' => 'File Name',
            'file_type' => 'File Type',
            'created_at' => 'Created At',
            'created_by' => 'Created By',
            'is_deleted' => 'Is Deleted',
        ];
    }
}

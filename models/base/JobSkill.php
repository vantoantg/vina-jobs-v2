<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "tn_job_skill".
 *
 * @property int $id
 * @property int $categories_id
 * @property string $name
 */
class JobSkill extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tn_job_skill';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['categories_id'], 'required'],
            [['categories_id'], 'integer'],
            [['name'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'categories_id' => 'Categories ID',
            'name' => 'Name',
        ];
    }
}

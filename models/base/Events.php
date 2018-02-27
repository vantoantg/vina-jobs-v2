<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "tn_events".
 *
 * @property integer $id
 * @property integer $user_id
 * @property integer $type_id
 * @property string $title
 * @property string $description
 * @property string $slug
 * @property integer $all_day
 * @property string $start
 * @property string $end
 * @property string $url
 * @property string $className
 * @property integer $editable
 * @property integer $startEditable
 * @property integer $durationEditable
 * @property integer $resourceEditable
 * @property string $rendering
 * @property integer $overlap
 * @property string $constraint
 * @property string $source
 * @property string $color
 * @property string $backgroundColor
 * @property string $borderColor
 * @property string $textColor
 * @property integer $status
 */
class Events extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tn_events';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'type_id', 'all_day', 'editable', 'startEditable', 'durationEditable', 'resourceEditable', 'overlap', 'status'], 'integer'],
            [['description'], 'string'],
            [['start', 'end'], 'safe'],
            [['title', 'slug'], 'string', 'max' => 255],
            [['url', 'className', 'rendering', 'constraint', 'source'], 'string', 'max' => 155],
            [['color', 'backgroundColor', 'borderColor', 'textColor'], 'string', 'max' => 55],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => 'User ID',
            'type_id' => 'Type ID',
            'title' => 'Title',
            'description' => 'Description',
            'slug' => 'Slug',
            'all_day' => 'All Day',
            'start' => 'Start',
            'end' => 'End',
            'url' => 'Url',
            'className' => 'Class Name',
            'editable' => 'Editable',
            'startEditable' => 'Start Editable',
            'durationEditable' => 'Duration Editable',
            'resourceEditable' => 'Resource Editable',
            'rendering' => 'Rendering',
            'overlap' => 'Overlap',
            'constraint' => 'Constraint',
            'source' => 'Source',
            'color' => 'Color',
            'backgroundColor' => 'Background Color',
            'borderColor' => 'Border Color',
            'textColor' => 'Text Color',
            'status' => 'Status',
        ];
    }
}

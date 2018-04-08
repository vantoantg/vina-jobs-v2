<?php

namespace app\models;

use app\models\base\Jobs;

class Job extends Jobs
{

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['categories_id', 'title', 'salary', 'address'], 'required'],
            [['categories_id', 'company_id', 'created_by', 'updated_by', 'approved_by', 'arrange', 'star', 'status'], 'integer'],
            [['description', 'content'], 'string'],
            [['created_at', 'updated_at', 'effect_date', 'end_date', 'approved_at'], 'safe'],
            [['title', 'name', 'tags', 'keyword', 'salary', 'address'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'title' => 'Tên việc làm',
            'categories_id' => 'Danh mục',
	        'name' => 'Tên',
	        'description' => 'Mô tả',
	        'content' => 'Chi tiết thông tin cần tuyển',
	        'tags' => 'Kỹ năng',
	        'keyword' => 'Keyword',
	        'salary' => 'Mức lương',
	        'address' => 'Nơi làm việc',
	        'created_by' => 'Created By',
	        'updated_by' => 'Updated By',
	        'created_at' => 'Created At',
	        'updated_at' => 'Updated At',
	        'effect_date' => 'Effect Date',
	        'end_date' => 'End Date',
	        'approved_at' => 'Approved At',
	        'approved_by' => 'Approved By',
	        'arrange' => 'Arrange',
	        'star' => 'Star',
	        'status' => 'Status',
        ];
    }
}

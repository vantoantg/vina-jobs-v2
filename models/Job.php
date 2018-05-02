<?php

namespace app\models;

use app\library\helper\Common;
use app\models\base\Jobs;
use yii\db\Query;

class Job extends Jobs
{

    const
        STATUS_WAITING_APPROVE = 0,
        STATUS_ACTIVE = 1,

        STATUS_CLIENT_PUBLISH = 7,
        STATUS_CLIENT_DRAFT = 8;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['categories_id', 'title', 'salary', 'address'], 'required'],
            [['categories_id', 'company_id', 'created_by', 'updated_by', 'approved_by', 'arrange', 'star', 'client_status', 'status'], 'integer'],
            [['description', 'content'], 'string'],
            [['created_at', 'updated_at', 'effect_date', 'end_date', 'approved_at'], 'safe'],
            [['title', 'slug', 'tags', 'keyword', 'salary', 'address'], 'string', 'max' => 255],
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
	        'slug' => 'slug',
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

	/**
	 * @param $job_id
	 * @return array|false
	 */
    public static function getJob($job_id){
    	$user_id = Common::isLoginned() ? Common::currentUsers()->getId() : 0;
	    $query = new Query();
	    $query->select([
			    'job.id',
			    'job.title',
			    'job.slug',
			    'job.content',
			    'ujob.applied',
			    'ujob.saved',
			    ]
	    )
		    ->from('tn_jobs job')
		    ->leftJoin('tn_user_jobs ujob', 'ujob.jobs_id = job.id AND ujob.user_id = :user_id AND ujob.is_deleted = 0', ['user_id' => $user_id])
	        ->where('job.id = :job_id', ['job_id' => $job_id]);

	    $command = $query->createCommand();
	    return $command->queryOne();
    }

	/**
	 * @param $user_id
	 * @return array
	 */
	public function getJobs($user_id){
		$query = new Query();
		$query->select([
				'job.id',
				'job.categories_id',
				'job.title',
				'job.slug',
				'job.content',
				'job.status',
				'job.client_status',
				'job_cat.name',
			]
		)
			->from('tn_jobs job')
			->innerJoin('tn_job_categories job_cat', 'job_cat.id = job.categories_id AND job.created_by = :user_id', ['user_id' => $user_id])
			->orderBy(['job.status' => SORT_DESC, 'job.client_status' => SORT_DESC, 'job.approved_at' => SORT_DESC, 'job.effect_date' => SORT_DESC, 'job.updated_at' => SORT_DESC, 'job.created_at' => SORT_DESC]);

		return $query->createCommand()->queryAll();
	}
}

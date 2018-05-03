<?php

namespace app\models;

use app\library\helper\Common;
use app\library\helper\Datetime;
use app\library\helper\Dropdowns;
use app\library\helper\Helper;
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
            [['categories_id', 'company_id', 'working_time', 'created_by', 'updated_by', 'approved_by', 'arrange', 'star', 'client_status', 'status'], 'integer'],
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
	        'working_time' => 'Thời gian làm việc',
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
	 * @param bool $insert
	 * @return bool
	 */
	public function beforeSave($insert)
	{
		if ($this->isNewRecord) {
			$this->approved_at = Datetime::datetimeSqlNow(); // Todo
			$this->approved_by = 1; // Todo
			$this->effect_date = Datetime::datetimeSqlNow();
			$this->created_at = Datetime::datetimeSqlNow();
			$this->updated_at = Datetime::datetimeSqlNow();
			$this->created_by = Common::currentUsers()->getId();
			$this->updated_by = Common::currentUsers()->getId();
		} else {
			$this->updated_at = Datetime::datetimeSqlNow();
			$this->updated_by = Common::currentUsers()->getId();
		}

		return parent::beforeSave($insert);
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
				'job.id AS job_id',
				'job.categories_id',
				'job.title AS job_name',
				'job.slug',
				'job.salary',
				'job.working_time',
				'job.content',
				'job.status',
				'job.created_at',
				'job.client_status',
				'job_cat.name AS cat_name',
				'loca.name AS loca_name',
			]
		)
			->from('tn_jobs job')
			->innerJoin('tn_job_categories job_cat', 'job_cat.id = job.categories_id AND job.created_by = :user_id', ['user_id' => $user_id])
			->leftJoin('tn_locations loca', 'loca.id = job.address')
			->orderBy(['job.status' => SORT_DESC, 'job.client_status' => SORT_DESC, 'job.approved_at' => SORT_DESC, 'job.effect_date' => SORT_DESC, 'job.updated_at' => SORT_DESC, 'job.created_at' => SORT_DESC]);

		$data = $query->createCommand()->queryAll();
		if($data){
			$result = [];
			foreach ($data as $k => $item){
				$item['salary'] = Dropdowns::$salary[$item['salary']];
				$item['working_time'] = Dropdowns::$working_time[$item['working_time']];
				$item['created_at'] = Datetime::sqlDatetimeDiffForHumans($item['created_at']);
				$item['url_edit'] = Helper::createUrl(['front/jobs/edit-jobs', 'id' => $item['job_id']]);
				$item['url_view'] = Helper::createUrl(['site/employeers-detail', 'slug' => $item['slug'], 'id' => $item['job_id']]);
				$result[] = $item;
			}

			return $result;
		}

		return [];
	}
}

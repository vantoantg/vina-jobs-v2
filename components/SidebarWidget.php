<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\components;

use app\library\helper\Helper;
use app\models\Company;
use app\models\Job;
use yii\base\Widget;

class SidebarWidget extends Widget
{
    public $message;

    public function init()
    {
        parent::init();
        if ($this->message === null) {
            $this->message = 'Welcome User';
        } else {
            $this->message = 'Welcome '.$this->message;
        }
    }

    /**
     * @param array $except_job_ids
     *
     * @return string|void
     */
    public function recentJobs($except_job_ids = [])
    {
        $data = Job::instance()->getRecentJobsSidebar($except_job_ids);
        if ($data) {
            return $this->render('sidebar/recent_job', [
                'data' => $data,
            ]);
        }
    }

    public function recentCompanyInfo($company_id)
    {
        $company = Company::instance()->getCompany($company_id);
        $company = $company->toArray();
        $company['logo'] = Company::getLogo($company['logo']);
	    $company['url_company_detail'] = Helper::createUrl(['front/jobs/company-detail', 'slug' => Helper::createSlug($company['name']), 'id' => Company::instance()->setCompanyCode($company['id'])]);

        return $this->render('sidebar/company_info', [
            'company' => $company,
        ]);
    }

    public function archives()
    {
        return $this->render('sidebar/archives', [
        ]);
    }

    public function categories()
    {
        return $this->render('sidebar/categories', [
        ]);
    }

    public function newsLatter()
    {
        return $this->render('sidebar/news_latter', [
        ]);
    }

    public function searchResultJobs($_url, $queryParams)
    {
        return $this->render('sidebar/search_result_jobs', [
            '_url' => $_url,
            'queryParams' => $queryParams,
        ]);
    }
}

<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\components;

use \app\library\helper\Helper;
use app\models\FileUploads;
use app\models\Job;
use Yii;
use app\forms\ApplyForm;
use yii\base\Widget;
use yii\web\UploadedFile;

class JobsWidget extends Widget
{
    public $message;
    public $attachment;

    public function init()
    {
        parent::init();
    }

    /**
     * @return string
     */
    public function applyPopup()
    {
        $form = new ApplyForm();
	    $form->redirect = Yii::$app->request->getUrl();
	    $form->job_code = Job::instance()->setJobCode(1988);

        return $this->render('jobs/apply_popup', [
            'applyForm' => $form,
        ]);
    }
}

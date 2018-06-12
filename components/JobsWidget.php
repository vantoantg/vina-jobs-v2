<?php
/**
 * Created by Tona Nguyễn
 * Date: 2/6/2018
 * Time: 6:23 PM
 */
namespace app\components;

use app\models\FileUploads;
use Yii;
use app\forms\ApplyForm;
use app\forms\LoginForm;
use yii\base\Widget;
use app\library\helper\Helper;
use yii\helpers\Html;
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

        if ($form->load(\Yii::$app->request->post())) {
            $form->new_cv = UploadedFile::getInstance($form, 'new_cv');
            if ($form->new_cv) {
                $file_type = $form->new_cv->extension;
                $file_name = $form->new_cv->baseName;
                $file_path = $form->new_cv->baseName.'-'.md5(date('dmyhis')).'.'.$file_type;
                $this->attachment = Yii::$app->basePath .'/'. Yii::$app->params['companyCandidatePath'] . $file_path;
                $form->new_cv->saveAs($this->attachment);
                FileUploads::saveFile(FileUploads::CANDIDATE, $file_path, $file_name, $file_type);
            } else {
                $this->attachment = Yii::$app->basePath .'/'. Yii::$app->params['companyCandidatePath'] . 123;
            }

            // Send email
//		    $body = $this->renderPartial('@app/mail/layouts/reset_password', ['data' => '']);
//		    Email::sendMailApply(' Chao ban abc ...', $body, '', '', $this->attachment);
        }

        return $this->render('jobs/apply_popup', [
            'applyForm' => $form,
        ]);
    }
}

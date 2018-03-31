<?php

namespace app\modules\admin\controllers;

use app\forms\LayoutForm;
use Yii;
use app\models\Tags;
use app\models\search\Tags as TagsSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * TagsController implements the CRUD actions for Tags model.
 */
class LayoutController extends AdminController
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Tags models.
     * @return mixed
     */
    public function actionFooter()
    {
        $file_id = 2;
        $files = [
            1 => [
                'id' => 1,
                'name' => 'footer.php',
                'path' => Yii::$app->getLayoutPath().'/jobs/footer.php',
            ],
            2 => [
                'id' => 2,
                'name' => 'site.css',
                'path' => Yii::$app->basePath.'/web/css/site.css',
            ]
        ];


        foreach($files as $file){
            @chmod($file, 0777);
        }

		$form = new LayoutForm();
	    $form->textarea = file_get_contents($files[$file_id]['path']);
		if($form->load(Yii::$app->request->post())){
			file_put_contents($files[$file_id]['path'], $form->textarea);
		}

        return $this->render('index', [
            'file_name' =>  $files[$file_id]['name'],
            'files' => $files,
            'model' =>  $form,
        ]);
    }
}
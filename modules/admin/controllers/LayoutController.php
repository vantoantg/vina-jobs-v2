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
        $file = Yii::$app->getLayoutPath().'/jobs/footer.php';
	    @chmod($file, 0777);

		$form = new LayoutForm();
	    $form->textarea = file_get_contents($file);
		if($form->load(Yii::$app->request->post())){
			file_put_contents($file, $form->textarea);
		}

        return $this->render('index', [
            'file_name' =>  'footer.php',
            'model' =>  $form,
            'files' =>  null,
        ]);
    }
}

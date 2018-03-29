<?php

namespace app\modules\admin\controllers;

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
    public function actionIndex()
    {
        $file = Yii::$app->getLayoutPath().'/jobs/footer.php';

        $filecontent = file_get_contents($file);

/*        $pos = strpos($filecontent, '?>');*/
//        file_put_contents($file, $filecontent);

        return $this->render('index', [
            'file_content' =>  $filecontent,
            'files' =>  null,
        ]);
    }
}

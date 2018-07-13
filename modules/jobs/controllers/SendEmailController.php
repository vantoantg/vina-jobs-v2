<?php

namespace app\modules\jobs\controllers;

use app\forms\ViewLogsForm;
use app\modules\admin\controllers\AdminController;
use Symfony\Component\Finder\Finder;
use Yii;
use app\models\SendEmail;
use app\models\search\SendEmail as SendEmailSearch;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * SendEmailController implements the CRUD actions for SendEmail model.
 */
class SendEmailController extends AdminController
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
     * Lists all SendEmail models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new SendEmailSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionTemplate($id = null){
	    $path = Yii::$app->basePath.'/assets/logs';

	    $finder = new Finder();
//	    $finder->files()->in($path);
	    echo '<pre>';
	    print_r($path);
	    echo '</pre>';
	    die;
	    $files = [];
	    $model = new ViewLogsForm();
	    foreach ($finder as $file) {
		    $name = $file->getRelativePathname().' - '.$file->getSize().'Byte';
		    $files[] = [
			    'name' => $name,
			    'realPath' => $file->getRealPath(),
		    ];

		    if($id == $file->getRealPath()){
			    $model->fileName = $name;
			    $model->textarea = $file->getContents();
		    }
	    }
	    return $this->render('template', [
		    'files' => $files,
		    'model' => $model,
	    ]);
    }

    /**
     * Displays a single SendEmail model.
     * @param string $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new SendEmail model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new SendEmail();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing SendEmail model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param string $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing SendEmail model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the SendEmail model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $id
     * @return SendEmail the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = SendEmail::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}

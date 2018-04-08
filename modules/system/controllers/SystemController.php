<?php

namespace app\modules\system\controllers;

use app\library\helper\Datetime;
use app\library\helper\Helper;
use app\modules\admin\controllers\AdminController;
use Carbon\Carbon;
use Yii;
use app\models\System;
use app\models\search\System as SystemSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * SystemController implements the CRUD actions for System model.
 */
class SystemController extends AdminController
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
     * Lists all System models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new SystemSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single System model.
     * @param integer $id
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
     * Creates a new System model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new System();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing System model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
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
     * Deletes an existing System model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the System model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return System the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = System::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

	public function actionBackupDb(){
        @ini_set('memory_limit', '2048M');
        @set_time_limit(3000);

    	$path = Yii::$app->basePath.'/web/backups';
		if(!file_exists($path)){
			mkdir($path);
		}
		@chmod($path, 0777);

		if(Yii::$app->request->isPost){
			$backup = Yii::$app->request->post('backup_db');
			if(isset($backup)){
				Helper::backupDB();
			}
		}
		if(Yii::$app->request->get('delete')){
			@unlink(Yii::$app->basePath.'/web/backups/'.Yii::$app->request->get('delete'));
			return $this->redirect(['/admin/admin/backup-db']);
		}
		$file = [];
		if ($handle = opendir(Yii::$app->basePath.'/web/backups')) {
			while (false !== ($entry = readdir($handle))) {
				if ($entry != "." && $entry != "..") {
					$time = explode('-', $entry);
					$time = str_replace('.sql', '', $time[3]);
					$file[] = [
						'name' => $entry,
						'size' => filesize($path.'/'.$entry),
						'time' => Carbon::createFromFormat(Datetime::FILE_TIME, $time)->format(Datetime::VIEW_DATETIME_dmYHis),
						'path'  => Helper::siteURL().'/web/backups/'.$entry
					];
				}
			}
			closedir($handle);
		}
		rsort($file);

		return $this->render('database', [
			'files' => $file
		]);
	}
}

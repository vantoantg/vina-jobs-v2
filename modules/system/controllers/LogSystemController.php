<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\modules\system\controllers;

use app\forms\ViewLogsForm;
use app\modules\admin\controllers\AdminController;
use Symfony\Component\Finder\Finder;
use Yii;
use app\models\LogSystem;
use app\models\search\LogSystem as LogSystemSearch;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * LogSystemController implements the CRUD actions for LogSystem model.
 */
class LogSystemController extends AdminController
{
    /**
     * {@inheritdoc}
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
     * Lists all LogSystem models.
     *
     * @return mixed
     */
    public function actionIndex($id = null)
    {
        $path = Yii::$app->basePath.'/assets/logs';

        $finder = new Finder();
        $finder->files()->in($path);

        $files = [];
        $model = new ViewLogsForm();
        foreach ($finder as $file) {
            // dumps the absolute path
//            var_dump($file->getRealPath());
            // dumps the relative path to the file, omitting the filename
//            var_dump($file->getRelativePath());
            // dumps the relative path to the file
//            var_dump($file->getRelativePathname());

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

        return $this->render('index_file', [
            'files' => $files,
            'model' => $model,
        ]);

        /*$searchModel = new LogSystemSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->pagination->pageSize = $this->setting['page_size'];

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);*/
    }

    /**
     * Displays a single LogSystem model.
     *
     * @param integer $id
     *
     * @return mixed
     *
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new LogSystem model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     *
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new LogSystem();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing LogSystem model.
     * If update is successful, the browser will be redirected to the 'view' page.
     *
     * @param integer $id
     *
     * @return mixed
     *
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
     * Deletes an existing LogSystem model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     *
     * @param integer $id
     *
     * @return mixed
     *
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the LogSystem model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     *
     * @param integer $id
     *
     * @return LogSystem the loaded model
     *
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = LogSystem::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}

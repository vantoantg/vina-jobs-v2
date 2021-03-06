<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\modules\contents\controllers;

use app\forms\LayoutForm;
use app\modules\admin\controllers\AdminController;
use Yii;
use app\models\Tags;
use yii\filters\VerbFilter;

/**
 * TagsController implements the CRUD actions for Tags model.
 */
class LayoutController extends AdminController
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
     * Lists all Tags models.
     *
     * @return mixed
     */
    public function actionPage()
    {
        $x = DIRECTORY_SEPARATOR;
        $file_id = Yii::$app->request->get('id', 1);
        $files = [
            1 => [
                'id' => 1,
                'name' => 'Home',
                'path' => Yii::$app->basePath.$x.'modules'.$x.'front'.$x.'views'.$x.'default'.$x.'index.php',
            ],
            3 => [
                'id' => 3,
                'name' => 'About',
                'path' => Yii::$app->getViewPath().$x.'site'.$x.'about.php',
            ],
            4 => [
                'id' => 4,
                'name' => 'Blog',
                'path' => Yii::$app->getViewPath().$x.'site'.$x.'blog.php',
            ],
            5 => [
                'id' => 5,
                'name' => 'Contact',
                'path' => Yii::$app->getViewPath().$x.'site'.$x.'contact.php',
            ],

            101 => [
                'id' => 101,
                'name' => 'Header',
                'path' => Yii::$app->getLayoutPath().$x.'jobs'.$x.'header.php',
            ],
            102 => [
                'id' => 102,
                'name' => 'Footer',
                'path' => Yii::$app->getLayoutPath().$x.'jobs'.$x.'footer.php',
            ],
        ];

        foreach ($files as $file) {
            @chmod($file['path'], 0777);
        }

        $form = new LayoutForm();
        $form->textarea = file_get_contents($files[$file_id]['path']);
        $form->files = $file_id;
        if ($form->load(Yii::$app->request->post())) {
            file_put_contents($files[$file_id]['path'], $form->textarea);
        }

        return $this->render('page', [
            'file_name' => $files[$file_id]['name'],
            'files' => $files,
            'model' => $form,
        ]);
    }

    /**
     * Lists all Tags models.
     *
     * @return mixed
     */
    public function actionStyle()
    {
        $x = DIRECTORY_SEPARATOR;
        $file_id = 2;
        $files = [
            1 => [
                'id' => 1,
                'name' => 'footer.php',
                'path' => Yii::$app->getLayoutPath().'/jobs'.$x.'footer.php',
            ],
            2 => [
                'id' => 2,
                'name' => 'site.css',
                'path' => Yii::$app->basePath.$x.'/web'.$x.'css'.$x.'site.css',
            ],
        ];

        foreach ($files as $file) {
            @chmod($file, 0777);
        }

        $form = new LayoutForm();
        $form->textarea = file_get_contents($files[$file_id]['path']);
        if ($form->load(Yii::$app->request->post())) {
            file_put_contents($files[$file_id]['path'], $form->textarea);
        }

        return $this->render('style', [
            'file_name' => $files[$file_id]['name'],
            'files' => $files,
            'model' => $form,
        ]);
    }
}

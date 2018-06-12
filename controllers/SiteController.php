<?php

namespace app\controllers;

use app\components\CaptchaAction;
use app\forms\ApplyForm;
use app\library\helper\Common;
use app\library\helper\Helper;
use app\models\Auth;
use app\models\Company;
use app\models\Email;
use app\models\FileUploads;
use app\models\Job;
use app\models\LoginForm;
use app\models\Post;
use app\models\search\JobCustomSearch;
use app\modules\front\controllers\FrontController;
use Yii;
use yii\filters\AccessControl;
use yii\helpers\Url;
use yii\web\BadRequestHttpException;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\ContactForm;

class SiteController extends FrontController
{
    public $successUrl;
    public $attachment;

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => '\app\components\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
            'auth' => [
                'class' => 'yii\authclient\AuthAction',
                'successCallback' => [$this, 'successCallback'],
                'successUrl' => Url::to(Helper::createUrl(['/front/user/update-candidate'])),
            ],
        ];
    }

    /**
     * @param $client
     * @return Response
     */
    public function successCallback($client)
    {
        $this->successUrl = Url::to(Helper::createUrl(['/front/user/update-candidate']));
	    Auth::instance()->detectUserType($client);
    }


    /**
     * @return string|Response
     */
    public function actionSearch()
    {
        $queryParams = Yii::$app->request->queryParams;
        // TODO: save $queryParams (JSON) to strafic user want ...?

        return $this->render('search', [
            '_url' => Yii::$app->request->getUrl(),
            'queryParams' => $queryParams,
        ]);
    }

    /**
     * @return string|Response
     */
    public function actionAjaxSearch()
    {
        $queryParams = Yii::$app->request->queryParams;
        // TODO: save $queryParams (JSON) to strafic user want ...?

        if (Yii::$app->request->isAjax && isset($queryParams['mode']) && $queryParams['mode'] == 'search-jobs') {
            $searchModel = new JobCustomSearch();
            $dataProvider = $searchModel->search($queryParams);
            $dataProvider->pagination->pageSize = 10;
            $data = [
                'datas' => $dataProvider->getModels(),
                'pagination' => $dataProvider->pagination
            ];

            return $this->asJson($data);
        }
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    /**
     * Login action.
     *
     * @return Response|string
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        }
        return $this->render('login', [
            'model' => $model,
        ]);
    }

    /**
     * Logout action.
     *
     * @return Response
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    /**
     * Displays about page.
     *
     * @return string
     */
    public function actionAboutUs()
    {
        return $this->render('about');
    }

    /**
     * Displays about page.
     *
     * @return string
     */
    public function actionJobSeekers()
    {
        return $this->render('job_seekers');
    }

    /**
     * Displays about page.
     *
     * @return string
     */
    public function actionEmployeers()
    {
        return $this->render('employeers');
    }

    /**
     * @param $slug
     * @param $id
     * @return string
     * @throws BadRequestHttpException
     */
    public function actionEmployeersDetail($slug, $id)
    {
        $job = Job::getJob($id);
        if (!$job) {
            throw new BadRequestHttpException();
        }

        $galleries = FileUploads::instance()->getGallery(FileUploads::COM_GALLERY, $job['company_id']);
        $form = new ApplyForm();

        return $this->render('employeers_detail', [
            'job' => $job,
            'galleries' => $galleries,
            'applyForm' => $form,
        ]);
    }

    /**
     * Displays blog page.
     *
     * @return string
     */
    public function actionBlog()
    {
        $searchModel = new Post();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->pagination->pageSize = 20;
        return $this->render('blog', [
            'blogs' => $dataProvider->getModels()
        ]);
    }

    /**
     * @param $slug
     * @param $id
     * @return string
     * @throws BadRequestHttpException
     */
    public function actionBlogDetail($slug, $id)
    {
        $post = Post::find()->where('status = :status', ['status' => Post::STATUS_ACTIVE])->andWhere(['id' => $id])->one();
        if (!$post) {
            throw new BadRequestHttpException();
        }

        return $this->render('blog_detail', [
            'blog' => $post
        ]);
    }

    public function actionPolicy()
    {
        return $this->render('policy');
    }

    /**
     * Displays contact page.
     *
     * @return Response|string
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post())) {
            $data = Yii::$app->request->post();
            $body = $this->renderPartial('@app/mail/layouts/contact', ['data' => $data['ContactForm']]);
            Email::instance()->sendContact($body);
            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->refresh();
        }
        return $this->render('contact', [
            'model' => $model,
        ]);
    }
}

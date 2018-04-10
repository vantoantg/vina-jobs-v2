<?php

namespace app\controllers;

use app\library\helper\Helper;
use app\models\Auth;
use app\models\LoginForm;
use app\models\Users;
use Codeception\Lib\ParamsLoader;
use Symfony\Component\Translation\Loader\FileLoader;
use Yii;
use yii\di\ServiceLocator;
use yii\filters\AccessControl;
use yii\helpers\Url;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\ContactForm;

class SiteController extends Controller
{
    public $successUrl;

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
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
            'auth' => [
                'class' => 'yii\authclient\AuthAction',
                'successCallback' => [$this, 'successCallback'],
                'successUrl' => $this->successUrl,
            ],
        ];
    }

    /**
     * @param $client
     * @return Response
     */
    public function successCallback($client)
    {
        $this->successUrl = Url::to(['/']);
        (new Auth())->detectUserType($client);
    }


    /**
     *
     */
    public function actionSearch(){
        $keys = Yii::$app->request->get('keys');
	    if(\Yii::$app->request->isAjax){
		    echo '<pre>';
		    print_r(\Yii::$app->request->queryParams);
		    echo '</pre>';
		    die;
	    }

        return $this->render('search');
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
     * Displays blog page.
     *
     * @return string
     */
    public function actionBlog()
    {
        return $this->render('blog');
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
        if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->refresh();
        }
        return $this->render('contact', [
            'model' => $model,
        ]);
    }
}

<?php

namespace app\controllers;

use app\forms\ApplyForm;
use app\library\helper\Helper;
use app\models\Auth;
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
use yii\web\UploadedFile;

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
                'class' => 'yii\captcha\CaptchaAction',
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
        (new Auth())->detectUserType($client);
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
     * Displays about page.
     *
     * @return string
     */
    public function actionEmployeersDetail($slug, $id)
    {
    	$job = Job::getJob($id);
    	$form = new ApplyForm();

	    if($form->load(Yii::$app->request->post())){
		    $form->new_cv = UploadedFile::getInstance($form, 'new_cv');
		    if ($form->new_cv) {
			    $file_type = $form->new_cv->extension;
			    $file_name = $form->new_cv->baseName;
			    $file_path = $form->new_cv->baseName.'-'.md5(date('dmyhis')).'.'.$file_type;
			    $this->attachment = Yii::$app->basePath . Yii::$app->params['companyCandidatePath'] . $file_path;
			    $form->new_cv->saveAs($this->attachment);
			    FileUploads::saveFile(FileUploads::CANDIDATE, $file_path, $file_name, $file_type);
		    }else{
			    $this->attachment = Yii::$app->basePath . Yii::$app->params['companyCandidatePath'] . 123;
		    }

		    // Send email
//		    $body = $this->renderPartial('@app/mail/layouts/reset_password', ['data' => '']);
//		    Email::sendMailApply(' Chao ban abc ...', $body, '', '', $this->attachment);
	    }

        return $this->render('employeers_detail', [
        	'job' => $job,
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
	 * Displays blog page.
	 *
	 * @return string
	 */
	public function actionBlogDetail($slug, $id)
	{
		$post = Post::findOne($id);
		if(!$post){
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
        if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->refresh();
        }
        return $this->render('contact', [
            'model' => $model,
        ]);
    }
}

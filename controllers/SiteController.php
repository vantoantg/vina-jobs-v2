<?php

namespace app\controllers;

use app\components\CaptchaAction;
use app\forms\ApplyForm;
use app\library\helper\Common;
use app\library\helper\Cons;
use app\library\helper\Helper;
use app\library\helper\Logs;
use app\library\helper\Logss;
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
use yii\data\Pagination;
use yii\filters\AccessControl;
use yii\helpers\Url;
use yii\web\BadRequestHttpException;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\ContactForm;
use yii\widgets\LinkPager;
use yii\widgets\ListView;

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
				'successUrl' => Url::to(Helper::getInstance()->createUrl(['/front/user/update-candidate'])),
			],
		];
	}

	/**
	 * @param $client
	 * @return Response
	 */
	public function successCallback($client)
	{
		$this->successUrl = Url::to(Helper::getInstance()->createUrl(['/front/user/update-candidate']));
		Auth::instance()->detectUserType($client);
	}


	/**
	 * Url: search/result.html?keywords=&mode=search-jobs
	 *
	 * @return string|Response
	 */
	public function actionSearch()
	{
		$queryParams = Yii::$app->request->queryParams;
		$queryParams['page'] = isset($queryParams['page']) ? $queryParams['page'] : 1;
		$queryParams['per-page'] = isset($queryParams['per-page']) ? $queryParams['per-page'] : Cons::getInstance()->settingSite('perPage');

		if (Yii::$app->request->isAjax &&
			isset($queryParams['mode']) &&
			$queryParams['mode'] == 'search-jobs') {

			return $this->actionAjaxSearch($queryParams);
		}

		// TODO: save $queryParams (JSON) to strafic user want ...?

		return $this->render('search_jobs', [
			'_url' => Yii::$app->request->getUrl(),
			'queryParams' => $queryParams,
		]);
	}

	/**
	 * @return string|Response
	 */
	public function actionAjaxSearch($queryParams)
	{
		// TODO: save $queryParams (JSON) to strafic user want ...?
		Logs::getInstance()->searchJobs($queryParams);

		$searchModel = new JobCustomSearch();
		$dataProvider = $searchModel->search($queryParams);
		$dataProvider->pagination->pageSize = $queryParams['per-page'];

		$pagination = new Pagination(['totalCount' => $dataProvider->totalCount, 'pageSize' => $dataProvider->pagination->pageSize]);

		ob_start();
		echo LinkPager::widget([
			'pagination' => $pagination,
		]);
		$papeLink = ob_get_contents();
		ob_end_clean();

		$data = [
			'datas' => Job::instance()->formatRecord($dataProvider->getModels()),
			'pagination' => $dataProvider->pagination,
			'papeLink' => $papeLink
		];

		return $this->asJson($data);
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
     * Url: job/detail/{slug}-{id}.html
	 * @param $slug
	 * @param $id
	 * @return string
	 * @throws BadRequestHttpException
	 */
	public function actionEmployeersDetail($slug, $id)
	{
		$job = Job::instance()->getJob(Job::instance()->getJobCode($id));
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
		$req_dump = print_r($_REQUEST, TRUE);
		Logs::getInstance()->applyEmail($req_dump);

		$model = new ContactForm();
		if ($model->load(Yii::$app->request->post())) {
			$data = Yii::$app->request->post();
			$body = $this->renderPartial('@app/mail/layouts/contact', ['data' => $data['ContactForm']]);
			Email::instance()->sendContact($body);
			Yii::$app->session->setFlash('contactFormSubmitted');

			Logs::getInstance()->contactEmail($data);

			return $this->refresh();
		}
		return $this->render('contact', [
			'model' => $model,
		]);
	}
}

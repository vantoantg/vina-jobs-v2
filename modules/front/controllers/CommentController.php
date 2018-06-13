<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\modules\front\controllers;

use app\models\Comment;
use yii\web\Controller;
use Yii;

/**
 * Default controller for the `front` module
 */
class CommentController extends FrontController
{
    /**
     * Renders the index view for the module
     *
     * @return string
     */
    public function actionIndex()
    {
        if (Yii::$app->request->isAjax && Yii::$app->request->isGet) {
            $data = Comment::instance()->getList(Yii::$app->request->get('object_id'), Yii::$app->request->get('object_type'));

            return $this->asJson($data);
        }
    }

    /**
     * Renders the index view for the module
     *
     * @return string
     */
    public function actionAdd()
    {
        if (Yii::$app->request->isAjax && Yii::$app->request->isPost) {
            $return = [];
            $post = Yii::$app->request->post();
            if (Comment::instance()->addComment($post)) {
                $return['data'] = Comment::instance()->getList($post['object_id'], $post['object_type']);
            }

            return $this->asJson($return);
        }
    }
}

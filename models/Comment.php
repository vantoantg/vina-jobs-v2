<?php

namespace app\models;

use app\library\helper\Common;
use app\library\helper\Datetime;

class Comment extends \app\models\base\Comment
{
    const BLOG = 'blog';
    /**
     * @param $object_id
     * @param $object_type
     * @return array
     */
    public function getList($object_id, $object_type)
    {
        $data = self::find()->alias('cm')
            ->select([
                'u.first_name',
                'u.last_name',
                'cm.id',
                'cm.parent_id',
                'cm.comment',
                'cm.created_at',
            ])
            ->where('object_id = :object_id AND object_type = :object_type AND is_deleted = 0', ['object_id' => $object_id, 'object_type' =>$object_type])
            ->innerJoin('tn_user_details u', 'cm.created_by = u.user_id')
            ->groupBy('cm.id')
            ->orderBy(['parent_id' => SORT_ASC, 'id' => SORT_ASC])
            ->asArray()->all();

        if ($data) {
            $return = [];
            foreach ($data as $item) {
                $item['comment_sender_name'] = $item['last_name'];
                $item['date'] = Datetime::sqlDatetimeDiffForHumans($item['created_at']);
                $return[] = $item;
            }
            return $return;
        }

        return [];
    }

    /**
     * @param $post
     * @return bool
     */
    public function addComment($post)
    {
        $comment = new self();
        $comment->parent_id = isset($post['comment_id']) ? intval($post['comment_id']) : 0;
        $comment->object_id = $post['object_id'];
        $comment->object_type = $post['object_type'];
        $comment->comment = $post['comment'];
        $comment->created_by = Common::currentUser();
        $comment->created_at = Datetime::createdAt();
        if ($comment->save()) {
            return true;
        }

        return false;
    }
}

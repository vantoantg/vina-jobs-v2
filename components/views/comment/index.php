<?php
/** @var $this \yii\web\View title */
$this->registerJsFile('/web/js/site/comment.js', ['position' => \yii\web\View::POS_END]);
?>
<h4 class="title-widget-sidebar">BÌNH LUẬN <i class="far fa-comment-dots"></i></h4>
<div id="container-comment" data-obj-id="<?= $object_id ?>" data-obj-type="<?= $object_type ?>">
    <div class="comment-form-container">
        <form class="frm-comment">
            <input type="hidden" name="comment_id" class="commentId"/>
            <div class="input-row">
            <textarea class="form-control comment" type="text" name="comment"
                      placeholder="Hãy cho ý kiến của bạn..."></textarea>
            </div>
            <div>
                <button class="btn btn-primary submitButton"><i class="fas fa-location-arrow"></i> Gửi
            </div>
        </form>
    </div>

    <div id="output-comment"></div>
</div>

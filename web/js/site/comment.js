$(function () {
    Comment.init();
});

var Comment = function(){
    var _wrapperComment = $("#container-comment");
    var _outputComment = $("#output-comment");
    var _obj_id = _wrapperComment.data('obj-id');
    var _obj_type = _wrapperComment.data('obj-type');

    var _url = 'http://localhost/comment.html';
    var _urlAdd = 'http://localhost/add-comment.html';

    return{
        init: function(){
            this.events();
            this.firstLoadfirstLoad();
        },
        events: function(){
            _outputComment.on('click', 'a.btn-reply', function (e) {
                e.preventDefault();

                var _root = $(this).closest('div');
                var _form = '<form class="frm-comment" method="post">\n' +
                    '        <input type="hidden" name="comment_id" class="commentId"/>\n' +
                    '        <div class="input-row">\n' +
                    '            <textarea class="form-control comment" type="text" name="comment"\n' +
                    '                          ></textarea>\n' +
                    '        </div>\n' +
                    '        <div>\n' +
                    '            <button class="btn btn-primary submitButton"><i class="fas fa-location-arrow"></i> Gửi</button>\n' +
                    '        </div>\n' +
                    '    </form>';
                _root.append(_form);
                _root.find('.commentId').val($(this).data('id'));
                _root.find('.comment').focus();
                $(this).hide();
            });

            _wrapperComment.on('click', '.submitButton', function (e) {
                e.preventDefault();
                var _form = $(this).closest('form');
                var commentId = _form.find('.commentId').val();
                var comments = _form.find('.comment').val();

                $.ajax({
                    url: _urlAdd,
                    data: { 'comment_id' : commentId, 'comment' : comments, 'object_id': _obj_id, 'object_type': _obj_type },
                    type: 'post',
                    success: function (response) {
                        if (response.data) {
                            _wrapperComment.find('.comment').val();
                            Comment.render(response.data);
                        } else {
                            alert("Failed to add comments !");
                        }
                    }
                });
            });
        },
        firstLoadfirstLoad: function () {
            $.get(_url + '?object_id=' + _obj_id + '&object_type=' + _obj_type, function (data) {
                Comment.render(data);
            });
        },
        render: function (data) {
            var comments = "";
            var parent = -1;
            var list = $("<ul class='outer-comment'>");
            for (var i = 0; (i < data.length); i++) {
                var commentId = data[i]['id'];
                parent = data[i]['parent_id'];

                if (parent == "0") {
                    comments = "<div class='comment-row'>" +
                        "<div class='comment-info'><span class='commet-row-label'>Từ </span> <span class='posted-by'>" + data[i]['comment_sender_name'] + " </span> <span class='commet-row-label'>lúc</span> <span class='posted-at'>" + data[i]['date'] + "</span></div>" +
                        "<div class='comment-text'>" + data[i]['comment'] + "</div>" +
                        "<a class='btn-reply' href='#' data-id='" + commentId + "'><i class=\"fas fa-reply\"></i></a>" +
                        "</div>";

                    var item = $("<li>").html(comments);
                    list.append(item);
                    var reply_list = $('<ul>');
                    item.append(reply_list);
                    Comment.listReplies(commentId, data, reply_list);
                }
            }
            _outputComment.html(list);
        },
        listReplies: function (commentId, data, list) {
            for (var i = 0; (i < data.length); i++) {
                if (commentId == data[i].parent_id) {
                    var comments = "<div class='comment-row'>" +
                        " <div class='comment-info'><span class='commet-row-label'>Từ </span> <span class='posted-by'>" + data[i]['comment_sender_name'] + " </span> <span class='commet-row-label'>at</span> <span class='posted-at'>" + data[i]['date'] + "</span></div>" +
                        "<div class='comment-text'>" + data[i]['comment'] + "</div>" +
                        "<a class='btn-reply' href='#' data-id='" + data[i]['id'] + "'><i class=\"fas fa-reply\"></i></a>" +
                        "</div>";
                    var item = $("<li>").html(comments);
                    var reply_list = $('<ul>');
                    list.append(item);
                    item.append(reply_list);
                    Comment.listReplies(data[i].id, data, reply_list);
                }
            }
        }
    }
}();
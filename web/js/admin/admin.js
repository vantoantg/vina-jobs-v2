/**
 * Login
 * Tona Nguyen
 */

$(function () {
    Admin.init();
});

var Admin = function () {
    var _TNSERVICE               = Service;
    var _settings = $('input#setting-common');
    var _rootUrl = _settings.attr('data-site');

    return {
        init: function () {
            this.events();
            this.initSlug();
            this.doCallPHPWorking();
        },
        events: function () {
            var pageCt = $("#page-content");
            if(pageCt.length){
                CKEDITOR.replace("page-content");
            }

            $(".openFinder").on('click', function () {
                var putId = $(this).attr('data-target');
                var finder = new CKFinder();
                if($(this).attr('data-type') == 'Files' || $(this).attr('data-type') == 'Images'){
                    finder.resourceType = $(this).attr('data-type');
                }
                finder.selectActionFunction = function (fileUrl) {
                    $('body').find(putId).val(fileUrl);
                };
                finder.popup();
            });
        },
        initSlug: function () {
            var timer, delay = 1000;
            $('input.createSlug').on('keyup change', function () {
                var _this = $(this);
                var _put = _this.attr('data-target');
                var _val = _this.val();
                clearTimeout(timer);
                timer = setTimeout(function() {
                    _TNSERVICE.postCallback(_rootUrl + 'admin/ajax/create-slug', {'name' : _val}, function (res) {
                        console.log(res);
                        $('body').find(_put).val(res.slug);
                    });
                }, delay);

            });
        },
        //TODO
        doCallPHPWorking: function () {
            _TNSERVICE.getCallback(_rootUrl + 'admin/ajax/php-working', function () {});
        }
    }
}();
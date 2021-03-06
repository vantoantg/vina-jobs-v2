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
            this.doSearchText();
            this.doConfirmDelete();
            this.extACE();
            this.chageSelectBoxGoToUrl();
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
            $('input.createSlug').on('keyup change', function () {
                var _this = $(this);
                var _put = _this.attr('data-target');
                var _val = _this.val();
                $('body').find(_put).val(Common.createSlug(Common.removeMark(_val)));
            });
        },
        //TODO
        doCallPHPWorking: function () {
            _TNSERVICE.getCallback(_rootUrl + 'admin/ajax/php-working', function () {});
        },
        doSearchText: function () {
            var _inpSearch = $('.search-from-list');
            if (_inpSearch.length) {
                _inpSearch.each(function () {
                    var input = $(this);
                    input.on('keyup', function () {
                        var filter, ul, li, a, i;

                        filter = Common.removeMark(input.val().toUpperCase());
                        ul = $(input.attr('data-list'));
                        li = ul.find("li");
                        for (i = 0; i < li.length; i++) {
                            a = li[i].getElementsByTagName("a")[0];
                            if (Common.removeMark(a.innerHTML.toUpperCase()).indexOf(filter) > -1) {
                                li[i].style.display = "";
                            } else {
                                li[i].style.display = "none";
                            }
                        }
                    });
                });
            }
        },
        doConfirmDelete: function () {
            var _item = $('[data-confirm-del="true"]');
            if(_item.length){
                _item.each(function () {
                   var _this = $(this);
                    _this.on('click', function (e) {
                        e.preventDefault();
                        $.confirm({
                            title: 'Confirm!',
                            content: _this.data('confirm-ms'),
                            autoClose: 'cancel|10000',
                            buttons: {
                                confirm: {
                                    text: 'DELETE',
                                    btnClass: 'btn btn-blue',
                                    keys: ['enter', 'y'],
                                    action: function() {
                                        _TNSERVICE.postCallback(_this.attr('href'), {}, function (data) {

                                        });
                                    }
                                },
                                cancel: {
                                    keys: ['n'],
                                    action: function() {

                                    }
                                }
                            }
                        });
                    });
                });
            }
        },
        extACE: function () {
            var editor_hd = $('textarea#editor_hd');
            if(editor_hd.length == 0){
                return;
            }
            ace.require("ace/ext/language_tools");
            var editor = ace.edit("editor");
            editor.session.setMode("ace/mode/twig");
            editor.setTheme("ace/theme/tomorrow");
            editor.setOptions({enableBasicAutocompletion: true});
            editor.setValue(editor_hd.val());
            // uses http://rhymebrain.com/api.html
            editor.setOptions({
                enableBasicAutocompletion: true,
                enableSnippets: true,
                enableLiveAutocompletion: true,
                showInvisibles: true
            });

            editor_hd.closest('form').on('click', 'button[type="submit"]', function () {
                editor_hd.val(editor.getValue());
            })
        },
        chageSelectBoxGoToUrl: function () {
            $('select[data-root-url]').on('change', function () {
                var url = $(this).val();
                if (url) {
                    window.location = $(this).attr('data-root-url')+url;
                }
                return false;
            });
        }
    }
}();
/**
 * Login
 * Tona Nguyen
 */

$(function () {
    Main.init();
});

var Main = function () {
    var _settings = $('input#setting-common');
    var _rootUrl = _settings.attr('data-site');
    return {
        init: function () {
            this.events();
            this.blog();
            this.initDatepicker();
            this.initCropit();
            // this.ajaxCallback();
        },
        events: function () {
            var select2 = $('.job-select2');
            if(select2.length){
                select2.each(function () {
                    var _this = $(this);
                    _this.select2({
                        placeholder: _this.data('placeholder')
                    });
                });
            }

            $(".select-tags").select2({
                tags: true,
                placeholder: 'Select an option',
                tokenSeparators: [',', ' ']
            })

            var radioCheck = $('div.iCheck input');
            radioCheck.each(function () {
                var _this = $(this);
                if(_this.attr('data-style') != undefined){
                    var _radioClass = 'iradio_square-'+_this.attr('data-style')
                }else{
                    var _radioClass = 'iradio_square-blue'
                }
                _this.iCheck({
                    checkboxClass: 'icheckbox_square',
                    radioClass: _radioClass,
                    increaseArea: '20%' // optional
                })
            });

            var inputCheck = $('input.iCheck');
            inputCheck.each(function () {
                var _this = $(this);
                _this.iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square',
                    increaseArea: '20%' // optional
                })
            });

        },
        blog: function () {

            var acc = document.getElementsByClassName("accordion");
            var i;

            for (i = 0; i < acc.length; i++) {
                acc[i].onclick = function () {
                    this.classList.toggle("active");
                    var panel = this.nextElementSibling;
                    if (panel.style.maxHeight) {
                        panel.style.maxHeight = null;
                    } else {
                        panel.style.maxHeight = panel.scrollHeight + "px";
                    }
                }
            }
        },
        initCropit: function(){
            var _image_editor = $('.image-editor');
            $('.add-img').click(function() {
                $('input.cropit-image-input').trigger('click');
            });

            $('input.cropit-image-input').change(function () {
                _image_editor.cropit();
            });

            var src = _image_editor.attr('data-default-img');
            _image_editor.cropit({
                imageState: {
                    src: src,
                },
            });


            $('.rotate-cw').click(function() {
                $('.image-editor').cropit('rotateCW');
            });
            $('.rotate-ccw').click(function() {
                $('.image-editor').cropit('rotateCCW');
            });

            $('.save-cropit').click(function() {
                var imageData = $('.image-editor').cropit('export', {
                    type: 'image/png',
                    quality: 1,
                    originalSize: true,
                });

                //Set value of hidden input to base64
                $(".hidden_base64").val(imageData);
                $(".imgs").attr('src', imageData);
            });
        },
        initDatepicker: function(){
            // Use: https://uxsolutions.github.io/bootstrap-datepicker/?markup=input&format=&weekStart=&startDate=&endDate=&startView=0&minViewMode=0&maxViewMode=4&todayBtn=false&clearBtn=false&language=en&orientation=auto&multidate=&multidateSeparator=&keyboardNavigation=on&forceParse=on#sandbox
            var inputDate = $('input.datepk');
            if (inputDate.length) {
                inputDate.each(function () {
                    var _this = $(this);

                    var attr = _this.attr('format');
                    if (typeof attr !== typeof undefined && attr !== false) {
                        var format = attr;
                    } else {
                        var format = "dd/mm/yyyy";
                    }

                    var lang = _this.attr('lang');
                    if (typeof lang !== typeof undefined && lang !== false) {
                        var language = lang;
                    } else {
                        var language = "vi";
                    }
                    _this.datepicker({
                        startView: 2,
                        format: format,
                        language: language,
                        todayHighlight: true,
                        toggleActive: true,
                        startDate: "01/01/1900",
                        endDate: new Date(),
                        clearBtn: true,
                    });
                });
            }
        },
        ajaxCallback: function () {
            var random = Math.random().toString(36).substr(1, 500);
            Service.postCallback(_rootUrl + 'front/default/callback?client='+random, {}, function (res) {
            });
        }
    }
}();
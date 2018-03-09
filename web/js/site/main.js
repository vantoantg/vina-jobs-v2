/**
 * Login
 * Tona Nguyen
 */

$(function () {
    Main.init();
});

var Main = function () {

    return {
        init: function () {
            this.events();
            this.blog();
            this.initDatepicker();
            this.initCropit();
        },
        events: function () {
            $('.job-select2').select2({
                // placeholder: 'Select an option'
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
            console.log(src);
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
                    type: 'image/jpeg',
                    quality: 1,
                    originalSize: true,
                });

                //Set value of hidden input to base64
                $("#hidden_base64").val(imageData);
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
                    console.log(new Date());
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
        }
    }
}();
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
            this.handleFormRegister();
            this.backToTop();
            this.blog();
            this.initDatepicker();
            this.initCropit();
            this.initFirstLoadSearchJobsPage();
            this.handleTopSearch();
            this.initSearchJobsPage();
            this.fixedSidebar();
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

            var select22 = $('.select-tags');
            if(select22.length){
                select22.each(function () {
                    var _this = $(this);
                    _this.select2({
                        placeholder: _this.data('placeholder'),
                        tags: true,
                        tokenSeparators: [',', '12312']
                    });
                });
            }

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

            $('.lazy').Lazy();
            if($(window).width < 768){

            }
        },
        handleFormRegister: function () {
            var _links = $('a#form-register');
            if(_links.length){
                _links.on('click', function () {
                    $('#register-modal').modal('show');
                });
            }
        },
        backToTop: function () {
            if ($('#back-to-top').length) {
                var scrollTrigger = 100, // px
                    backToTop = function () {
                        var scrollTop = $(window).scrollTop();
                        if (scrollTop > scrollTrigger) {
                            $('#back-to-top').addClass('show');
                        } else {
                            $('#back-to-top').removeClass('show');
                        }
                    };
                backToTop();
                $(window).on('scroll', function () {
                    backToTop();
                });
                $('#back-to-top').on('click', function (e) {
                    e.preventDefault();
                    $('html,body').animate({
                        scrollTop: 0
                    }, 700);
                });
            }
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
        },
        initFirstLoadSearchJobsPage: function () {
            /*var searchJobs = $('#search-jobs');
            if(searchJobs.length){
                Service.getCallback(searchJobs.attr('action'), function (data) {
                    // console.log(data);

                });
            }*/
        },
        createUrlParams: function (formData) {
            var makeUrl = {};
            if (formData) {
                $.each(formData, function (k, v) {
                    if (makeUrl[v.name]) {
                        makeUrl[v.name] = makeUrl[v.name] + ',' + v.value;
                    } else {
                        makeUrl[v.name] = v.value;
                    }
                })
            }
            return $.param(makeUrl);
        },
        handleTopSearch: function () {
            var topSearch = $('#top-search');
            if(topSearch.length){
                var action = topSearch.attr('action');
                topSearch.on('click', 'input.search', function (e) {
                    e.preventDefault();
                    var formData = topSearch.serializeArray();
                    var _hash = Main.createUrlParams(formData);
                    topSearch.attr('action', action+'?'+ _hash);
                    topSearch.submit();
                });
            }
        },
        initSearchJobsPage: function () {
            var searchJobs = $('#search-jobs');

            if(searchJobs.length){
                // var url = Common.buildUrl('http://localhost/search/result.html', 'keywords', $(this).val());
                // history.pushState(null, null, '/en/step2');

                var _timer = 500;
                searchJobs.on('change', function () {
                    search();
                });

                $('input', searchJobs).on('ifClicked', function(event){
                    search();
                });

                $('select', searchJobs).on('change', function(event){
                    search();
                });

                var search = function () {
                    var loaded = true;
                    var formData = searchJobs.serializeArray();
                    var _hash = Main.createUrlParams(formData);
                    history.pushState(null, null, '?' + _hash);
                    var newUrl = _rootUrl + 'search/load-data.html?' + _hash;
                    if (loaded) {
                        loaded = false;
                        Service.getCallback(newUrl, function (data) {
                            // console.log(data);
                            loaded = true;
                        });
                    }

                };
                search();
            }
        },
        fixedSidebar: function () {
            var sidebarfx = $("#sidebarfx");
            if(sidebarfx.length){
                var offset = sidebarfx.offset();
                var topPadding = 15;
                var tartgetHeight = sidebarfx.data('follow-scroll')
                var contentHeight = $(tartgetHeight).height();
                $(window).scroll(function() {
                    var wdTop = $(window).scrollTop();
                    if($(window).width() >= 768 && wdTop + 400 < contentHeight){
                        Main.doFixedSidebar(sidebarfx, offset, topPadding);
                    }
                });
            }
        },
        doFixedSidebar: function (sidebarfx, offset, topPadding) {
            if ($(window).scrollTop() > offset.top) {
                sidebarfx.stop().animate({
                    marginTop: $(window).scrollTop() - offset.top + topPadding
                }, 300);
            } else {
                sidebarfx.stop().animate({
                    marginTop: 0
                });
            };
        }
    }
}();
$(function () {
    Jobs.init();
});

var Jobs = function(){
    var Page = $('body.site-search');
    var site_employeers_detail = $('body.site-employeers-detail');
    var site_index = $('body.default-index');

    var applyModal = $('#apply-modal');
    var _callToPreApply = false;
    var _dataPreApply = [];
    var _isAddedFile = false;

    return{
        init: function(){
            this.events();

            if(applyModal.length){
                this.loadBtnApplyPopup();
            }
            if(site_employeers_detail.length){
                this.siteEmployeersDetail();
                this.handleActiveImgWhenClickShowPopupGellery();
            }
            if(site_index.length){
                this.siteIndex();
            }
        },
        events: function(){
            var _timer = 2000;

            /*Form.on('change', function () {
                clearTimeout($.data(this, 'timer'));
                $(this).data('timer', setTimeout(search, _timer));
            });*/

            /*function search() {
                Service.postCallback(siteUrl+'search-jobs.html', {'data': Form.serialize()}, function (data) {
                    console.log(data);
                });
            }*/
        },
        siteEmployeersDetail: function () {
            var jobsDetail = site_employeers_detail.find('.ft-jobs-detail');
            site_employeers_detail.on('click', '.ft-jobs-detail button.save-jobs', function () {
                var _btn = $(this);
                Service.postCallback(jobsDetail.data('href'), {'action': $(this).data('action')}, function (res) {
                    if(res.favorite == 1){
                        _btn.addClass('_saved').find('span').html('Tin đã lưu');
                    }else{
                        _btn.removeClass('_saved').find('span').html('Lưu tin này');
                    }
                });
            });
        },
        loadBtnApplyPopup: function(){
            $('div.container').on('click', '.apply-job', function (e) {
                e.preventDefault();
                if(_callToPreApply === false){
                    var _btn = $(this);
                    Service.postCallback(_btn.data('href'), {'action': 'applỵ'}, function (res) {
                        _dataPreApply = res;
                        renderPopupApply(_dataPreApply);
                        _callToPreApply = true;
                    });
                }else {
                    renderPopupApply(_dataPreApply);
                }

                applyModal.on('click', 'ul li input[type="radio"]', function () {
                    if ($(this).val() == 'upload') {
                        applyModal.find('ul li.file').removeClass('hide');
                    } else {
                        applyModal.find('ul li.file input').val('');
                        applyModal.find('ul li.file').addClass('hide');
                    }
                });
                applyModal.find('ul li.file input').change(function () {
                    _isAddedFile = $(this).val();
                });

                applyModal.on('click', '[name="apply"]', function (e) {
                    if($('ul.cv-new li.radio label input').is(':checked') && !_isAddedFile) {
                        e.preventDefault();
                        applyModal.find('ul li.file > div').addClass('has-error');
                        applyModal.find('ul li.file div.help-block').show().html('Vui lòng chọn tệp tải lên');
                    }
                });
            });

            var renderPopupApply = function (_data) {
                if(_data.data.length){
                    var html = _.template($('#cv-list').html())({list : _data.data });
                    $('#tabs-cv-valid ul.cv-list').html(html);
                }else{
                    $('ul.cv-new li.radio label input').click();
                }
            };
        },
        handleActiveImgWhenClickShowPopupGellery: function(){
            var myCarousel = $('#myCarousel');
            $('div.gallery').on('click', 'div.row div a[data-toggle="modal"]', function (e) {
                var _no = $(this).data('num');
                myCarousel.find('.carousel-indicators .active').removeClass('active');
                myCarousel.find('[data-slide-to="' + _no + '"]').addClass('active');

                myCarousel.find('.carousel-inner .active').removeClass('active');
                myCarousel.find('[data-num="' + _no + '"]').addClass('active');
            });
        },
        siteIndex: function () {
            var jobsTop = $('#top-jobs');
            Service.getCallback(jobsTop.data('url'), function (data) {
                var html = _.template($('#template-top-list').html())({data: data});
                $('#container-top-list').html(html);
            });
        }
    }
}();
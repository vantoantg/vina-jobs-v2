$(function () {
    Jobs.init();
});

var Jobs = function(){
    var Page = $('body.site-search');
    var site_employeers_detail = $('body.site-employeers-detail');

    return{
        init: function(){
            this.events();
            if(site_employeers_detail.length){
                this.siteEmployeersDetail();
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

            site_employeers_detail.on('click', '.ft-jobs-detail button.apply-job', function () {
                var _btn = $(this);
                Service.postCallback(_btn.data('href'), {'action': 'applỵ'}, function (res) {
                    if(res.data.length){
                        var html = _.template($('#cv-list').html())({list : res.data });
                        $('#tabs-cv-valid ul').html(html);
                    }else{
                        $('a[href="#tabs-cv-valid"]').hide();
                    }
                });
            });
        }
    }
}();
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
            site_employeers_detail.on('click', '.ft-jobs-detail button', function () {
                Service.postCallback(jobsDetail.data('href'), {'action': $(this).data('action')}, function () {

                });
            });
        }
    }
}();
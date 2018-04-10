$(function () {
    Search.init();
});

var Search = function(){
    var Page = $('body.site-search');
    var Form = $('form#search-jobs');
    var siteUrl = $('input#setting-common').attr('data-site');
    return{
        init: function(){
            if(Page.length > 0){
                this.events();
            } else {
                return;
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
        }
    }
}();
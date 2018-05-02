$(function () {
    userMember.init();
});

var userMember = function(){
    var Page = $('body.site-search');
    var Form = $('form#search-jobs');
    var siteUrl = $('input#setting-common').attr('data-site');
    return{
        init: function(){
            this.events();
        },
        events: function(){

        }
    }
}();
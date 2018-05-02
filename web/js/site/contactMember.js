$(function () {
    contactMember.init();
});

var contactMember = function(){
    var profileContact = $('#profile_contact');
    var contactInfos = $('#profile_contact #contact_infos');
    var siteUrl = $('input#setting-common').attr('data-site');

    return{
        init: function(){
            this.events();
            if(contactInfos.length){
                this.profileContactPage();
            }
        },
        events: function(){
        },
        profileContactPage: function () {
            var url = contactInfos.attr('data-url');
            contactInfos.on('click', 'li a[aria-controls]', function () {
                var _url = url + '?info=' + $(this).attr('aria-controls');
                Service.getCallback(_url,function (res) {
                    console.log(res);
                });
            });
        }
    }
}();
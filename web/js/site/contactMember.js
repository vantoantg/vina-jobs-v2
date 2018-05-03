$(function () {
    contactMember.init();
});

var contactMember = function(){
    var profileContact = $('#profile_contact');
    var contactInfos = $('#profile_contact #contact_infos');
    var siteUrl = $('input#setting-common').attr('data-site');
    var _PROFILES = [];

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
                var _type = $(this).attr('aria-controls');
                var _url = url + '?info=' + _type;
                if(_type != 'profile'){
                    if(_PROFILES[_type] == undefined){
                        load(_type, _url);
                    }else{
                        render(_type, _PROFILES[_type]);
                    }
                }
            });

            var load = function (_type, _url) {
                Service.getCallback(_url,function (res) {
                    _PROFILES[_type] = res;
                });
            };

            var render = function (_type, datas) {

            };

        }
    }
}();
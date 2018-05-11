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
                this.uploadGallery();
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
                    render(_type, _PROFILES[_type]);
                });
            };

            var render = function (_type, datas) {
                console.log(datas);
                var html = _.template($('#template-' + _type).html())({ data : datas });
                $('#container-' + _type).html(html);
            };
        },
        uploadGallery: function () {
            profileContact.on('change', '#imageonlyform-image', function () {
                var _form = $(this).closest('form');
                var _upload = _form.find('.upload-img');
                if($(this).val() != ''){
                    _upload.attr('disabled', false);
                }else{
                    _upload.attr('disabled', true);
                }
            });

            profileContact.on('click', 'button.upload-img', function (e) {
                e.preventDefault();
                $(this).attr('disabled', true);

                var _form = $(this).closest('form');
                var formData = _form.serializeFiles();
                _doUpload(_form.attr('action'), formData)
            });

            console.log(_PROFILES);
            var _doUpload = function (_url, formData) {
                $.ajax({
                    url: _url,
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (res) {
                        if(res['status']){
                            delete _PROFILES.company;
                            aler(121111);
                            console.log(_PROFILES);
                        }
                    }
                });
            };
        }
    }
}();
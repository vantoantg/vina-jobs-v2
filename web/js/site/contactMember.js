$(function () {
    contactMember.init();
});

var contactMember = function () {
    var profileContact = $('#profile_contact');
    var contactInfos = $('#profile_contact #contact_infos');
    var siteUrl = $('input#setting-common').attr('data-site');
    var urlContactInfos = contactInfos.attr('data-url');
    var urlDelGallery = contactInfos.attr('data-url-del-gallery');
    var _Sv = Service;
    var _PROFILES = [];

    return {
        init: function () {
            this.events();
            if (contactInfos.length) {
                this.profileContactPage();
                this.uploadGallery();
            }
        },
        events: function () {
        },
        profileContactPage: function () {
            contactInfos.on('click', 'li a[aria-controls]', function () {
                var _type = $(this).attr('aria-controls');
                contactMember.doLoadProfile(_type);
            });

            $('#container-company').on('click', 'ul.com-gallery li > a', function (e) {
                e.preventDefault();
                var _id = $(this).data('id');
                contactMember.deleteGalleryImg(_id);
            });
        },
        doLoadProfile: function (_type) {
            var _url = urlContactInfos + '?info=' + _type;
            if (_type != 'profile') {
                if (_PROFILES[_type] == undefined) {
                    _load(_type, _url);
                } else {
                    _render(_type, _PROFILES[_type]);
                }
            }

            function _load(_type, _url) {
                Service.getCallback(_url, function (res) {
                    _PROFILES[_type] = res;
                    _render(_type, _PROFILES[_type]);
                });
            };

            function _render(_type, datas) {
                var html = _.template($('#template-' + _type).html())({data: datas});
                $('#container-' + _type).html(html);
            };
        },
        deleteGalleryImg: function (id) {
            _Sv.postCallback(urlDelGallery, {imgId: id}, function (res) {
                if(res.status){
                    delete _PROFILES['company'];
                    contactMember.doLoadProfile('company');
                }
            });
        },
        uploadGallery: function () {
            $('#uploadGallery').on('change', '#imageonlyform-image', function () {
                var _form = $(this).closest('form');
                var _upload = _form.find('.upload-img');
                if ($(this).val() != '') {
                    _upload.attr('disabled', false);
                } else {
                    _upload.attr('disabled', true);
                }
            });

            $('#uploadGallery').on('click', 'button.upload-img', function (e) {
                e.preventDefault();
                $(this).attr('disabled', true);

                var _form = $(this).closest('form');
                var formData = _form.serializeFiles();
                _doUpload(_form.attr('action'), formData)
            });

            var _doUpload = function (_url, formData) {
                $.ajax({
                    url: _url,
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (res) {
                        var _type = 'company';
                        if (res['status']) {
                            delete _PROFILES[_type];
                            $('#uploadGallery').modal('hide');
                            contactMember.doLoadProfile(_type);
                        }
                    }
                });
            };
        }
    }
}();
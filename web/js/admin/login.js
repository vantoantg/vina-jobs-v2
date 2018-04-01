/**
 * Login
 * Tona Nguyen
 */

$(function () {
    Login.init();
});

var Login = function () {
    var _body = 'body.login-page';
    var _form = 'body.login-page form';

    return {
        init: function () {
            this.events();
        },
        events: function () {
            setTimeout(function () {
                $('form input').val('');
            }, 300);
            $(_form).on('click', 'button#login', function (e) {
                e.preventDefault();
                Login.ajaxSubmitForm($(this).closest('form'));
            });
        },
        ajaxSubmitForm: function (form) {
            Service.postCallback(form.attr('action'), form.serialize(), function (respone) {
                if(respone.error == true){
                    Login.showError(respone.message);
                }else{
                    Login.hideError();
                }
            });
        },
        showError: function (message) {
            $(_form).find('.error-login').removeClass('hide');
            $(_form).find('.error-login .text-danger').html(message);

        },
        hideError: function () {
            $(_form).find('.error-login').addClass('hide');
            $(_form).find('.error-login .text-danger').html('');
        }
    }
}();
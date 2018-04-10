/**
 * Login
 * Tona Nguyen
 */

$(function () {
    Login.init();
});

var Login = function () {
    var _body = 'body.login-page';
    var _form = '#login-modal form';

    return {
        init: function () {
            this.events();
        },
        events: function () {
            $(_form).on('click', '#login', function (e) {
                e.preventDefault();
                Login.ajaxSubmitForm($(this).closest('form'));
                return false;
            });
            $(_form).on('change', 'input', function (e) {
                Login.hideError();
            });
        },
        ajaxSubmitForm: function (form) {
            Service.postCallback(form.attr('action'), form.serialize(), function (respone) {
                if(respone.error == true && !form.find('.required').hasClass('has-error')){
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
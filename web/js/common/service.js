var Service = {
    getCallback: function (url, callback) {
        $.ajax({
            method: "GET",
            url: url
        }).done(function (data) {
            return callback(data);
        }).fail(function () {

        });
    },
    postCallback: function (url, params, callback, callback_error) {
        $.ajax({
            method: "POST",
            url: url,
            data: params
        }).done(function (data) {
            return callback(data);
        }).fail(function (e) {
            if (callback_error != undefined){
                return callback_error(true);
            }
        });
    }
};
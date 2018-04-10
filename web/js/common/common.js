var Common = {
	clickGoToUrl: function(){
		$('[data-to="href"]').on("click", function() {
			document.location = $(this).attr('data-href');
            return false;
		});
	},
    aPreventDefault: function(){
        $('a.preventDefault').on('click',function(e){
            e.preventDefault();
        });
    },
    datePicker: function(){
        $('.datepicker-birthday').datepicker({
            defaultViewDate: { year: 1988, month: 1, day: 1 }
        });
    },
    showErrorForm: function(form, error, time){
        if(time == undefined){
            var time = 5000;
        }
        var html    = '<div class="alert alert-danger">';
        html += error;
        html += '</div>';
        form.find('.error').html(html);
        setTimeout(function(){
            form.find('.error > div').slideUp();
        }, time);
    },
    showSuccessForm: function(form, error, time){
        if(time == undefined){
            var time = 5000;
        }
        var html    = '<div class="alert alert-success">';
        html += error;
        html += '</div>';
        form.find('.error').html(html);
        setTimeout(function(){
            form.find('.error > div').slideUp();
        }, time);
    },
    addTagsForInput: function(data, _tag){
        if(_tag == undefined){
            _tag = $('.tag-input');
        }
        if(data == undefined){
            data = [
                { tag: 'dog' },
                { tag: 'cat' },
                { tag: 'fish' },
                { tag: 'catfish' },
                { tag: 'dogfish' }
            ];
        }
        var tags = new Bloodhound({
            datumTokenizer: function(d) { return Bloodhound.tokenizers.whitespace(d.tag); },
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            local: data
        });

        tags.initialize();
        /*// Set up an on-screen console for the demo
        var screenConsole = $('#console');

        // Write callback data to the screen when tags are added or removed in demo inputs
        var logCallbackDataToConsole = function(added, removed) {
            screenConsole.append('Tag Data: ' + (this.val() || null) + ', Added: ' + added + ', Removed: ' + removed + '\n');
        };*/


        // Create typeahead-enabled tag inputs
        _tag.tagInput({
            allowDuplicates: false,
            typeahead: true,
            typeaheadOptions: {
                highlight: true
            },
            typeaheadDatasetOptions: {
                displayKey: 'tag',
                source: tags.ttAdapter()
            }
            //onTagDataChanged: logCallbackDataToConsole
        });
    },
    removeMark: function (str) {
        str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
        str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
        str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
        str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
        str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
        str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
        str = str.replace(/đ/g, "d");
        str = str.replace(/À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ/g, "A");
        str = str.replace(/È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ/g, "E");
        str = str.replace(/Ì|Í|Ị|Ỉ|Ĩ/g, "I");
        str = str.replace(/Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ/g, "O");
        str = str.replace(/Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ/g, "U");
        str = str.replace(/Ỳ|Ý|Ỵ|Ỷ|Ỹ/g, "Y");
        str = str.replace(/Đ/g, "D");
        return str;
    },
    createSlug: function (str) {
        str = str.replace(/\W+/g, ' ');
        str = str.replace(/\s/g, '-');
        return str;
    },
    buildUrl: function(base, key, value) {
        var sep = (base.indexOf('?') > -1) ? '&' : '?';
        return base + sep + key + '=' + value;
    }

};

(function($) {
    $.fn.serializeFiles = function() {
        var obj = $(this);
        /* ADD FILE TO PARAM AJAX */
        var formData = new FormData();
        $.each($(obj).find("input[type='file']"), function(i, tag) {
            $.each($(tag)[0].files, function(i, file) {
                formData.append(tag.name, file);
            });
        });
        var params = $(obj).serializeArray();
        $.each(params, function (i, val) {
            formData.append(val.name, val.value);
        });
        return formData;
    };
})(jQuery);

var isMobile = {
    Android: function() {
        return navigator.userAgent.match(/Android/i);
    },
    BlackBerry: function() {
        return navigator.userAgent.match(/BlackBerry/i);
    },
    iOS: function() {
        return navigator.userAgent.match(/iPhone|iPad|iPod/i);
    },
    Opera: function() {
        return navigator.userAgent.match(/Opera Mini/i);
    },
    Windows: function() {
        return navigator.userAgent.match(/IEMobile/i);
    },
    any: function() {
        return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
    }
};

$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
    Common.clickGoToUrl();
});

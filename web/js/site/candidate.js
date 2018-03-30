$(function () {
    var candidate = new Candidate();
    candidate.init();
});

var Candidate = function(){
    var Page = $('#register-candidate');
    return{
        init: function(){
            if(Page.length <= 0){
                return true;
            } else {
                this.events();
            }
        },
        events: function(){
            Page.on('change', '#candidate-job_category_id', function(){
                var category = $(this).val();
                var html = _.template($('#skill-template').html())({list : keyTest[category]});
                $('#candidate-skill').html(html).select2({});
            })
        }
    }
}
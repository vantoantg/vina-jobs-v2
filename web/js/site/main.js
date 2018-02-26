/**
 * Login
 * Tona Nguyen
 */

$(function () {
    Main.init();
});

var Main = function () {

    return {
        init: function () {
            this.events();
            this.blog();
        },
        events: function () {
            $('.job-select2').select2({
                // placeholder: 'Select an option'
            });
        },
        blog: function () {

            var acc = document.getElementsByClassName("accordion");
            var i;

            for (i = 0; i < acc.length; i++) {
                acc[i].onclick = function() {
                    this.classList.toggle("active");
                    var panel = this.nextElementSibling;
                    if (panel.style.maxHeight){
                        panel.style.maxHeight = null;
                    } else {
                        panel.style.maxHeight = panel.scrollHeight + "px";
                    }
                }
            }
        }
    }
}();
module.exports = function(grunt) {
    grunt.initConfig({
        concat: {
            mergecss: {
                src: [
                    // 'http://fonts.googleapis.com/css?family=Roboto',
                    // 'http://fonts.googleapis.com/css?family=Lato:400,700',
                    'web/template/jobs/fontawesome-free-5.0.10/web-fonts-with-css/css/fontawesome-all.css',
                    'web/template/jobs/css/gg-opensans/css.css',
                    'web/template/jobs/css/normalize.css',
                    'web/template/jobs/css/fontello.css',
                    'web/template/jobs/css/animate.css',
                    'web/template/jobs/css/bootstrap.min.css',
                    'web/template/admin/assets/css/theme-default/libs/bootstrap-datepicker/datepicker3.css',
                    'web/template/jobs/css/owl.carousel.css',
                    'web/template/jobs/css/owl.theme.css',
                    'web/template/jobs/css/owl.transitions.css',
                    'vendor/bower-asset/select2/dist/css/select2.min.css',
                    'vendor/bower-asset/iCheck/skins/all.css',
                    'web/template/jobs/style.css',
                    'web/template/jobs/responsive.css',
                    'web/template/jobs/less/my-site.css',
                ],
                dest: 'web/template/jobs/prod/css/all.css'
            },

            mergejs: {
                src: [
                    // 'web/template/jobs/js/vendor/modernizr-2.6.2.min.js',
                    'web/template/jobs/js/bootstrap.min.js',
                    'web/template/admin/assets/js/libs/jquery-ui/jquery-ui.min.js',
                    'web/template/admin/assets/js/libs/bootstrap-datepicker/bootstrap-datepicker.js',
                    'web/template/admin/assets/js/libs/bootstrap-datepicker/locales/bootstrap-datepicker.vi.js',
                    'web/template/jobs/js/owl.carousel.min.js',
                    'web/template/jobs/js/wow.js',
                    'vendor/bower-asset/iCheck/icheck.min.js',
                    'vendor/bower-asset/cropit/dist/jquery.cropit.js',
                    'vendor/bower-asset/jquery-lazy/jquery.lazy.min.js',
                    'web/template/jobs/js/main.js',
                    'web/template/jobs/js/underscore-min.js',
                    'web/js/common/service.js',
                    'web/js/common/common.js',
                    'web/js/site/login.js',
                    'web/js/site/main.js',
                    'web/js/site/candidate.js',
                    'web/js/site/jobs.js',
                    'web/js/site/search.js',
                    'web/js/site/contactMember.js',
                    'web/js/site/userMember.js',
                    'web/js/site/loadLast.js',
                ],
                dest: 'web/template/jobs/prod/js/all.js'
            },
        },
        cssmin: {
            minimumcss: {
                src:    'web/template/jobs/prod/css/all.css',
                dest:   'web/template/jobs/prod/css/all.min.css'
            },

        },
        uglify: {
            minimumjs: {
                src:    'web/template/jobs/prod/js/all.js',
                dest:   'web/template/jobs/prod/js/all.min.js',
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-uglify');

    grunt.registerTask('default', ['concat', 'cssmin', 'uglify']);
};
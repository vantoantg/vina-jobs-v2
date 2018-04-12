module.exports = function(grunt) {
    grunt.initConfig({
        concat: {
            gopcss: {
                src: [
                    'web/template/jobs/less/my-site.css',
                    'web/css/style.css',
                ],
                dest: 'web/css/test-grunt.css'
            },

            /*gopjs: {
                src: [
                    'js/jquery.js',
                    'js/hoangweb.js',

                ],
                dest: 'js/hoangweb.js'
            },*/
        },
        cssmin: {
            nencss: {
                src: 'web/css/test-grunt.css',
                dest: 'web/css/test-grunt.min.css'
            },

        },
        uglify: {
            nenjs: {
                /*src: 'js/hoangweb.js',
                dest: 'js/hoangweb.min.js',*/
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-uglify');

    grunt.registerTask('default', ['concat', 'cssmin', 'uglify']);
};
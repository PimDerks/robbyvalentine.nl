var gulp = require('gulp'),
    config = require('./gulp.config'),
    rest = require('gulp-rest-emulator');

module.exports.run = function(){

    // Options not require
    var options = {
        port: 8000,
        root: ['./'],
        rewriteNotFound: false,
        rewriteTemplate: 'index.html',
        corsEnable: false, // Set true to enable CORS
        corsOptions: {}, // CORS options, default all origins
        headers: {} // Set headers for all response, default blank
    };

    return gulp.src(config.roots.api + '/**/*.js')
        .pipe(rest(options));

};

module.exports.watch = function(){
    gulp.watch(config.roots.api + '/**/*.js', ['api-start']);
};
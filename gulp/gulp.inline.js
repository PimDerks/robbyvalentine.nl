var gulp = require('gulp'),
    config = require('./gulp.config'),
    inlinesource = require('gulp-inline-source');

module.exports = function(){

    var src = config.roots.www + '/**/*.html',
        dest = config.roots.dest;

    var options = {
        compress: false,
        attribute: 'data-inline'
    };

    return gulp.src(src)
        .pipe(inlinesource(options))
        .pipe(gulp.dest(dest));

};
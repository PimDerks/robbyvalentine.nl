var gulp = require('gulp'),
    gutil = require('gulp-util'),
    watch = require('gulp-watch'),
    sass = require('gulp-sass'),
    scsslint = require('gulp-scss-lint'),
    sourcemaps = require('gulp-sourcemaps'),
    autoprefixer = require('gulp-autoprefixer'),
    config = require('./gulp.config'),
    plumber = require('gulp-plumber'),
    util = require('gulp-util'),
    debug = require('gulp-debug');

module.exports.copy = function() {

    var src = [];
    src.push(config.roots.src + '/**/scss/*.scss');
    src.push('!' + config.roots.src + '/**/_*.scss');
    src.push('!' + config.roots.src + '/**/all.scss');

    var dest = config.roots.www;

    // all files in root of /scss/
    return gulp.src(src)
        .pipe(plumber(function(error) {
            gutil.log(gutil.colors.red(error.message));
            this.emit('end');
        }))
        //.pipe(debug())
        .pipe(sourcemaps.init())
        .pipe(sass({outputStyle: 'compressed'}))
        .pipe(autoprefixer('last 1 version', '> 5%', 'ie 9'))
        .pipe(sourcemaps.write('.'))
        .pipe(plumber.stop())
        .pipe(gulp.dest(dest));

};

module.exports.lint = function(){

    var src = [];
    src.push(config.roots.src + '/**/*.scss');
    src.push('!' + config.roots.src + '/' + config.paths.ui + '/base/scss/03-base/_normalize.scss');

    return gulp.src(src)
        .pipe(scsslint({
            'config': './.scss-lint.yml',
            'maxBuffer': 1024*1024
        }));

};

module.exports.watch = function(){

    var tasks = ['output-sass'];
    if(!util.env.killlint) {
        tasks.push('lint-sass');
    }

    // watch sass files
    gulp.watch(config.roots.src + '/**/*.scss', tasks);

};
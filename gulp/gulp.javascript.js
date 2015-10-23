var gulp = require('gulp'),
    rename = require('gulp-rename');
    sourcemaps = require('gulp-sourcemaps'),
    config = require('./gulp.config'),
    jshint = require('gulp-jshint'),
    jscs = require('gulp-jscs'),
    util = require('gulp-util');

module.exports.copy = function(){

    var src = [];
        src.push(config.roots.src + '/**/*.js');
        src.push('!' + config.roots.src + '/**/*Spec.js');
        src.push('!' + config.roots.src + '/' + config.paths.ui);
        src.push('!' + config.roots.src + '/' + config.paths.ui + '/**/*');
        src.push('!' + config.roots.src + '/' + config.paths.prototype + '/' + config.paths.static + '/' + config.paths.js + '/' + config.paths.shim);
        src.push('!' + config.roots.src + '/' + config.paths.prototype + '/' + config.paths.static + '/' + config.paths.js + '/' + config.paths.shim + '/**/*');

    var dest = config.roots.www;

    // all files in root of /scss/
    return gulp.src(src)
        .pipe(gulp.dest(dest));

};

module.exports.copyModules = function() {

    var src = [];
        src.push(config.roots.src + '/' + config.paths.ui + '/**/*.js');
        src.push('!' + config.roots.src + '/' + config.paths.ui + '/**/*Spec.js');

    var dest = config.roots.www + '/' + config.paths.prototype + '/' + config.paths.static + '/' + config.paths.js;

    // restructure
    var restructure = rename(function (path) {

        // remove 00- from dir-name
        path.dirname = path.dirname.replace(/[0-9]{2}-+/ig,'');

        // remove /js/'s from dir-name (ugly work-around for windows for now)
        path.dirname = path.dirname.replace(/\/js/ig, '');
        path.dirname = path.dirname.replace(/\\js/ig, '');

    });

    // all files in root of /scss/
    return gulp.src(src)
        .pipe(restructure)
        .pipe(gulp.dest(dest));

};

module.exports.watch = function() {

    var tasks = ['output-js', 'output-js-modules'];
    if(!util.env.killlint) {
        tasks.push('lint-js');
    }

    // Watch js files. Tasks are defined in the main gruntfile.
    gulp.watch(config.roots.src + '/**/*.js', tasks);

};

module.exports.lint = function(){

    var src = [];
    src.push(config.roots.src + '/**/*.js');
    src.push('!' + config.roots.src + '/**/*Spec.js');
    src.push('!' + config.roots.src + '/' + config.paths.ui + '/base/js/00-vendor/**/*.js');
    src.push('!' + config.roots.src + '/' + config.paths.prototype + '/' + config.paths.static + '/vendor/**/*.js');
    src.push('!' + config.roots.src + '/' + config.paths.prototype + '/' + config.paths.static + '/' + config.paths.js + '/shim/**/*.js');
    src.push('!' + config.roots.src + '/' + config.paths.prototype + '/' + config.paths.static + '/' + config.paths.js + '/initial.js');

    return gulp.src(src)
        .pipe(jscs({}))
        .pipe(jshint())
        .pipe(jshint.reporter('jshint-stylish'));

};
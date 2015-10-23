var gulp = require('gulp'),
    clean = require('gulp-clean'),
    config = require('./gulp.config');

module.exports = function(){

    // empty and remove www and dest directories
    var src = [];
    src.push(config.roots.www);
    src.push(config.roots.dest);

    return gulp.src(src)
        .pipe(clean({
            read: false, // do not read files, just remove
            force: true // force files for Windows
        }));
};
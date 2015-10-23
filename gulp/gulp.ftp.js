var gulp = require('gulp'),
    util = require( 'gulp-util' ),
    ftp = require( 'vinyl-ftp' );

module.exports = function(){

    var src = config.roots.dest,
        conn = ftp.create({
            host:     '',
            user:     '',
            password: '',
            parallel: 10,
            log:      util.log
        });

    // using base = '.' will transfer everything to /public_html correctly
    // turn off buffering in gulp.src for best performance

    return gulp.src(src, { base: '.', buffer: false })
        .pipe(conn.newer('/TEST')) // only upload newer files
        .pipe(conn.dest('/TEST'));

};
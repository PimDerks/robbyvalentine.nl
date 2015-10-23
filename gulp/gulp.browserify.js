var gulp = require('gulp'),
    watchify = require('watchify'),
    browserify = require('browserify'),
    source = require("vinyl-source-stream"),
    _ = require('lodash');

function bundle() {
    var dest = config.roots.www + '/' + config.paths.prototype + '/' + config.paths.static + '/' + config.paths.js;
    return b.bundle()
        .pipe(source('browserify.js'))
        .pipe(gulp.dest(dest));
}

// add custom browserify options here
var customOpts = {
    entries: ['./src/ui/main.js'],
    debug: true,
    poll: 100
};

var opts = _.assign({}, watchify.args, customOpts);
var b = watchify(browserify(opts));
b.on('update', function() {
    bundle();
});

module.exports = bundle;
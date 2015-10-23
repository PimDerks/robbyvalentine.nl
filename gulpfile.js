var gulp = require('gulp'),
    config = require('./gulp/gulp.config'),
    bs = require('browser-sync').create(),
    seq = require('run-sequence'),
    server = require('karma').Server,
    exec = require('child_process').exec;

// require
var api = require('./gulp/gulp.rest'),
    modules = require('./gulp/gulp.styleguide'),
    styleguide = require('./gulp/gulp.styleguide'),
    ui = require('./gulp/gulp.ui'),
    clean = require('./gulp/gulp.clean'),
    concat = require('./gulp/gulp.concat'),
    inline = require('./gulp/gulp.inline'),
    watchWWW = require('./gulp/gulp.watchWWW')(bs),
    sass = require('./gulp/gulp.sass'),
    swig = require('./gulp/gulp.swig'),
    minify = require('./gulp/gulp.minify'),
    base64 = require('./gulp/gulp.base64'),
    copy = require('./gulp/gulp.copy'),
    ftp = require('./gulp/gulp.ftp'),
    browserSync = require('./gulp/gulp.browsersync')(bs),
    js = require('./gulp/gulp.javascript');
browserify = require('./gulp/gulp.browserify'),
    critical = require('./gulp/gulp.critical'),
    docs = require('./gulp/gulp.docs');

// Testing
gulp.task('test-js', function (done) {
    new server({
        configFile: __dirname + '/karma.conf.js',
        singleRun: false
    }, done).start();
});

// Linting
gulp.task('lint-sass', sass.lint);
gulp.task('lint-js', js.lint);
gulp.task('lint-html', swig.lint);
gulp.task('lint', ['lint-sass', 'lint-js', 'lint-html']);

// Outputting DEV
gulp.task('output-js', js.copy);
gulp.task('output-js-modules', js.copyModules);
gulp.task('output-sass', sass.copy);
gulp.task('output-html', swig.copy);
gulp.task('output', ['output-js', 'output-js-modules', 'output-sass', 'output-html']);

// Outputting DOCS
gulp.task('output-ui', ui.render);
gulp.task('output-styleguide', styleguide.render);
gulp.task('output-docs', docs.render);
gulp.task('output-doc', ['output-ui', 'output-styleguide', 'output-docs']);

// Copy task
gulp.task('copy-assets', copy.copyAssets);
gulp.task('copy-media', copy.copyMedia);
gulp.task('copy-www-html', copy.copyBuildHTML);
gulp.task('copy-www-static', copy.copyBuildStatic);
gulp.task('copy-www-media', copy.copyBuildMedia);
gulp.task('copy-unminified', copy.copyUnminifiedAssets);
gulp.task('copy', ['copy-assets', 'copy-media']);
gulp.task('copy-build', ['copy-www-static', 'copy-www-media', 'copy-unminified']);

// Watching DEV
gulp.task('watch-api', api.watch);
gulp.task('watch-js', js.watch);
gulp.task('watch-sass', sass.watch);
gulp.task('watch-html', swig.watch);
gulp.task('watch-www', watchWWW);
gulp.task('watch', ['watch-api', 'watch-modules', 'watch-js', 'watch-sass', 'watch-html', 'watch-www']);

// Watching DOC
gulp.task('watch-modules', ui.watch);
gulp.task('watch-docs', docs.watch);
gulp.task('watch-styleguide', styleguide.watch);
gulp.task('watch-doc', ['watch-docs', 'watch-modules', 'watch-modules', 'watch-styleguide']);

// Start API
gulp.task('api-start', api.run);

// Browserify
gulp.task('browserify', browserify);

// Automatically update files in browser
gulp.task('browser-sync', browserSync);

// Remove temp/www dir
gulp.task('clean', clean);

// Concat shims
gulp.task('shim', concat.shim);

// Inline assets
gulp.task('inline', inline);

// Inline assets
gulp.task('base64', base64);

// Minify CSS, JS and images
gulp.task('minify-css', minify.minifyCSS);
gulp.task('minify-js', minify.minifyJS);
gulp.task('minify-img', minify.minifyImg);
gulp.task('minify', ['minify-css', 'minify-js', 'minify-img', 'copy-unminified']);

// Critical CSS
gulp.task('critical', critical);

// Deploy
gulp.task('deploy', ftp);

/*
 *
 * Shortcuts. These are the tasks you should use.
 *
 */

// Initial build. Run this once before starting development.

gulp.task('initial', function() {

    seq('clean', 'output-js', 'output-js-modules', 'output-sass', 'output-html', 'shim', 'copy-assets', 'copy-media', 'output-styleguide', 'output-ui', function(){

        // We use a timeout around this because the styleguide and modules tasks
        // don't return a stream, so Gulp doesn't know when they are finished.
        setTimeout(function(){
            exec('gulp output-doc'); // render the index
        }, 100);

        console.log("Initial task finished. Now run 'gulp dev' to start developing.");
    });

});

// Run this when you want to start working on docs
gulp.task('docs', function(){
    seq('output-doc', 'watch-doc');
});

// Run this when you want to start developing.

gulp.task('dev', function() {
    seq('api-start', 'watch', 'browserify', 'browser-sync');
});

// Build project

gulp.task('build', function() {
    seq('copy-www-static', 'copy-www-media', 'minify', 'inline', 'base64', function(){
        process.exit(0);
    });
});

// Test and lint code. Please note that the test-js task runs on the /www/ folder (for now).

gulp.task('test', function() {
    seq('lint', 'test-js', function(){
        console.log('Test completed.');
        process.exit(0);
    });
});
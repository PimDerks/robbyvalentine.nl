var gulp = require('gulp'),
    swig = require('swig'),
    gulpSwig = require('gulp-swig'),
    data = require('gulp-data'),
    markedSwig = require('swig-marked'),
    path = require('path'),
    config = require('./gulp.config'),
    utils = require('./gulp.utils'),
    fs = require('fs');

    require('swig-highlight').apply(swig);

    markedSwig.useFilter(swig);
    markedSwig.useTag(swig);

module.exports.render = function() {

    var src = [];
    src.push(config.roots.src + '/' + config.paths.styleguide + '/**/*.swig');

    var dest = config.roots.www + '/' + config.paths.styleguide;

    function getData(){

        var data = {
            data: {}
        };

        // get data files
        utils.walk(path.join(config.roots.src, config.paths.data), function(path){

            var name = utils.stripExtension(utils.getFileName(path)),
                ext = utils.getExtension(path);

            if(ext === 'json'){
                // read file
                data.data[name] = JSON.parse(fs.readFileSync(path, 'utf8'));
            }

        });

        data.pages = getPages();

        return data;

    }

    function getPages(){

        var result = [];

        // read files from subdirectory
        var root = config.roots.src + '/' + config.paths.styleguide;
        utils.walk(root, function(f){

            if(path.extname(f) === '.swig'){

                var fmData = utils.getFrontMatterData(f);

                // fill object
                var obj = {
                    url: f.replace('src/','/').replace('.swig','.html'),
                    fm: fmData.attributes
                };

                result.push(obj);

            }

        });

        return result;

    }

    return gulp.src(src)
        .pipe(gulpSwig({
            defaults: {
                cache: false
            },
            data: getData()
        }))
        .pipe(gulp.dest(dest));

};

module.exports.watch = function() {

    var src = [];
    src.push(config.roots.src + '/' + config.paths.styleguide + '/**/*.swig');
    src.push(config.roots.src + '/' + config.paths.layouts + '/' + config.paths.styleguide + '/**/*.swig');
    src.push(config.roots.src + '/' + config.paths.data + '/**/*');

    gulp.watch(src, ['output-styleguide']);

};
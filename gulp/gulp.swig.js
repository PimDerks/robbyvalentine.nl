var gulp = require('gulp'),
    swig = require('swig'),
    path = require('path'),
    config = require('./gulp.config'),
    utils = require('./gulp.utils'),
    fs = require('fs'),
    fse = require('fs-extra'),
    htmlhint = require("gulp-htmlhint"),
    w3cjs = require('gulp-w3cjs'),
    util = require('gulp-util'),
    through2 = require('through2');

var methods = {

    copy: function(src, dest){

        return new Promise(function(resolve, error){

            fse.copy(src, dest, function(err){
                if(err){
                    error();
                }
                resolve();
            })

        });

    },

    getPages: function(){

        var result = [];

        // Please note that modules get directly rendered from the src directory, There's no need for pre-rendering.

        utils.walk(path.join(config.roots.src, config.paths.prototype), function(path){

            var ext = utils.getExtension(path);

            switch(ext) {
                case 'swig':
                    result.push(path);
            }

        });

        return result;

    },

    getComponents: function(){

        var result = [];

        utils.walk(path.join(config.roots.src, config.paths.ui), function(path){

            if(utils.getExtension(path) === 'swig' && path.indexOf('components') > 0){
                result.push(path);
            }

        });

        return result;

    },

    getData: function(src){

        var data = {
            data: {
            }
        };

        // get data files from /data/ directory
        utils.walk(path.join(config.roots.src, config.paths.data), function(path){

            var name = utils.stripExtension(utils.getFileName(path)),
                ext = utils.getExtension(path);

            if(ext === 'json'){
                // read file
                data.data[name] = JSON.parse(fs.readFileSync(path, 'utf8'));
            }

        });

        // get data files from /components/
        utils.walk(path.join(config.roots.src, config.paths.ui, 'components'), function(path){

            var name = utils.stripExtension(utils.getFileName(path)),
                ext = utils.getExtension(path);

            if(ext === 'json'){
                // read file
                data.data[name] = JSON.parse(fs.readFileSync(path, 'utf8'));
            }

        });

        return data;

    },

    renderComponents: function(){

        return new Promise(function(resolve, reject){

            var components = methods.getComponents();

            components.forEach(function(component, index){
                methods.renderSwigFile(component, config.roots.tmp);
                if(index === (components.length - 1)){
                    console.log('Successfully rendered ' + components.length + ' components.');
                    setTimeout(function() {
                        resolve();
                    }, 10);
                }
            });

        });

    },

    renderPrototype: function(){

        return new Promise(function(resolve, reject){

            var pages = methods.getPages();

            pages.forEach(function (page, index) {

                methods.renderSwigFile(page, config.roots.www);

                if (index === (pages.length - 1)) {
                    console.log('Successfully rendered ' + pages.length + ' pages.');
                    setTimeout(function() {
                        // resolve();
                    });
                }
            });

        });

    },

    renderSwigFile: function(src, targetDir){

        // strip extension from file
        var name = src.substr(0, src.indexOf('.swig')),
            json = name + '.json';

        // get site-wide data
        var data = methods.getData() || {};

        // check is a JSON file exists with the same file in the same directory
        var local = fse.readJsonSync(json, { throws: false });
        if(local){
            data.data['local'] = local;
        }

        // get FontMatter data
        var fmData = utils.getFrontMatterData(src);

        // get front matter attributes
        data.data['fm'] = fmData.attributes;

        var oldSrc = src;
        src = fmData.body;

        // invalidate the swig cache
        swig.invalidateCache();

        // render template using swig
        var swiggedContent = swig.render(src, { locals: data, filename: oldSrc });

        // strip /src/ dir from filename (ugly work around)
        var removeDir = config.roots.src.replace('./','');
        name = name.replace(removeDir + path.sep, '');

        // write rendered template to file

        var dest = targetDir ? targetDir : config.roots.www;

        utils.writeFile(path.join(dest, name, 'index.html'), swiggedContent, function(err){
            if(err){
                // console.log("Unable to render component: " + oldSrc);
                return;
            }

            // console.log("Succesfully rendered component: " + oldSrc);

        });

    }

};

module.exports.copy = function() {

        // log rendering components
        // console.log('Rendering components...');

        methods.renderComponents();

        // log rendering pages
        // console.log('Rendering pages...');

        methods.renderPrototype();

};

var ignoredErrors = [];
ignoredErrors.push('A “meta” element with an “http-equiv” attribute whose value is “X-UA-Compatible” must have a “content” attribute with the value “IE=edge”.');

module.exports.lint = function(){
    return gulp.src(config.roots.www + '/**/*.html')
        .pipe(w3cjs())
        .pipe(through2.obj(function(file, enc, cb){
            cb(null, file);
            if (!file.w3cjs.success){
                file.w3cjs.messages.forEach(function(m){
                    if(ignoredErrors.indexOf(m.message) === -1){
                        console.log(m.message + ': ' + m.extract);
                    }
                });
            }
        }))
        .pipe(htmlhint())
        .pipe(htmlhint.failReporter());
};

module.exports.watch = function(){

    var src = [];

    // swig
    src.push(config.roots.src + '/' + config.paths.prototype + '/**/*.swig');
    src.push(config.roots.src + '/' + config.paths.layouts + '/**/*.swig');
    src.push(config.roots.src + '/' + config.paths.ui + '/**/*.swig');

    // data
    src.push(config.roots.src + '/'     + config.paths.prototype + '/**/*.json');
    src.push(config.roots.src + '/' + config.paths.data + '/**/*.json');
    src.push(config.roots.src + '/' + config.paths.ui + '/**/*.json');

    var tasks = ['output-html'];
    if(!util.env.killlint) {
        tasks.push('lint-html');
    }

    // watch data
    gulp.watch(src, tasks);

};
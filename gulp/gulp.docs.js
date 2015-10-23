var gulp = require('gulp'),
    swig = require('swig'),
    markedSwig = require('swig-marked'),
    path = require('path'),
    config = require('./gulp.config'),
    utils = require('./gulp.utils'),
    fs = require('fs');

require('swig-highlight').apply(swig);

markedSwig.useFilter(swig);
markedSwig.useTag(swig);

var methods = {

    getFiles: function(dir){

        var result = [],
            directory = path.join(config.roots.www, dir);

        if(fs.existsSync(directory)) {
            utils.walk(directory, function (file) {

                if (path.extname(file) === '.html') {
                    result.push(file);
                }

            });
        }

        return result;

    },

    getModules: function(){

        var result = [],
            directory = path.join(config.roots.www, config.paths.ui);

        if(fs.existsSync(directory)) {
            utils.walk(directory, function (file) {

                if (path.extname(file) === '.html' && file.indexOf('/preview/') < 0 && file.indexOf('index.html') < 0) {
                    result.push(file);
                }

            });
        }

        return result;

    },


    getData: function(){

        var data = {
            'pages': methods.getFiles(config.paths.prototype),
            'components': methods.getModules(),
            'styleguide': methods.getFiles(config.paths.styleguide)
        };
        return data;

    },

    extractData: function(file){

        var data = fs.readFileSync(file, 'utf-8'),
            title = null;

        // extract title from HTML
        var title = data.match(/<title>([^<]+)<\/title>/)[1];

        // replace site title (e.g. "Page Title - Google.com" ==> "Page Title");
        var hasSiteName = title.indexOf(' - ');
        if(hasSiteName){
            title = title.substr(0, hasSiteName);
        }

        // replace 'www' in url
        var url = file.replace(config.roots.www.replace('./', ''), '');

        var obj = {
            title: title,
            url: url
        };

        return obj;

    },

    renderIndex: function(){
        var data = methods.getData();

        var obj = {
            pages: [],
            components: [],
            modules: [],
            styleguide: []
        };

        // extract title from files
        data.pages.forEach(function(page){
            obj['pages'].push(methods.extractData(page));
        });

        data.styleguide.forEach(function(page){
            obj['styleguide'].push(methods.extractData(page));
        });

        data.components.forEach(function(page){
            obj['components'].push(methods.extractData(page));
        });

        // invalidate the swig cache
        swig.invalidateCache();

        // render template using swig
        var swiggedContent = swig.renderFile(path.join(config.roots.src, 'index.swig'), obj);

        // destination
        var dest = path.join(config.roots.www, 'index.html');

        // write file
        utils.writeFile(dest, swiggedContent, function (err) {
            if (err) {
                console.log("Unable to render index.");
                return;
            }

            console.log("Succesfully rendered index.");

        });

    }

};

module.exports.render = function() {

    methods.renderIndex();

};

module.exports.watch = function() {

    gulp.watch(config.roots.src + '/index.swig', ['output-doc']);

};
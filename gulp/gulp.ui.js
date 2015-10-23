var gulp = require('gulp'),
    swig = require('swig'),
    markedSwig = require('swig-marked'),
    path = require('path'),
    config = require('./gulp.config'),
    utils = require('./gulp.utils'),
    fs = require('fs'),
    fse = require('fs-extra');

    require('swig-highlight').apply(swig);

    markedSwig.useFilter(swig);
    markedSwig.useTag(swig);

var methods = {

    getComponentName: function(file){
        return path.basename(file).replace(path.extname(file), '');

    },

    getDocumentation: function(file){

        // get directory
        var base = path.dirname(file);

        // get filename
        var name = methods.getComponentName(file);

        // expected .md file
        var md = path.join(base, name + '.md');

        // check if path exists
        return fs.existsSync(md) ? md : null;

    },

    getComponentHierarchy: function(file){

        // replace 'src/modules'
        file = file.replace(config.roots.src.replace('./', '') + path.sep + config.paths.ui + path.sep, '');

        // replace 'components'
        file = file.replace('components' + path.sep, '');

        // replace extension
        file = file.replace(path.extname(file), '');

        // split
        var split = file.split(path.sep);

        var obj = {
            'module': split[0],
            'component': split[1],
            'subcomponent': split[2]
        };
         //console.log(obj)
        // replace dirs
        return obj;

    },

    getData: function(file){

        var result;

        // get directory
        var base = path.dirname(file);

        // get filename
        var name = methods.getComponentName(file);

        // expected .json file
        var json = path.join(base, name + '.json');

        // check if path exists
        return fs.existsSync(json) ? json : null;

    },

    getFile: function(file, componentName){

        var obj = {
            url: file,
            name: file.slice(file.indexOf(componentName)),
            contents: fs.readFileSync(file, 'utf8')
        };

        return obj;
    },

    getDependencies: function(file, dir){

        var result = [];

        // get filename
        var filename = path.basename(file);
        filename = filename.replace(path.extname(filename), '');

        // get directory
        var base = path.dirname(file);

        // get component baseName
        var component = base.split(path.sep);
        component = component[component.length-1];

        // get subdirectory
        var subdir = path.join(base, dir);

        if(fs.existsSync(subdir)){

            // read files from subdirectory
            utils.walk(subdir, function(f){

                var temp = path.basename(f);
                temp = temp.replace(path.extname(temp), '');

                // base module gets all dependencies
                // submodules only get dependencies which match filename
                if(filename === component || temp === filename) {
                    var r = methods.getFile(f, component);
                    result.push(r);
                //
                }

            });

        }

        return result;

    },

    getComponent: function(c){

        var temp = {};

        var name = methods.getComponentName(c);

        // save url
        temp['url'] = c;

        // get component name
        temp['name'] = name;

        // remove directories from path
        temp['hierarchy'] = methods.getComponentHierarchy(c);

        // dependencies
        temp['code'] = {};

        // get related JavaScript
        temp['code']['js'] = methods.getDependencies(c, config.paths.js);

        // get related SCSS
        temp['code']['css'] = methods.getDependencies(c, config.paths.sass);

        // get related HTML
        temp['code']['html'] = [methods.getFile(c, name)];

        // get expected data-format
        temp['data'] = methods.getData(c, name) ? methods.getFile(methods.getData(c), name) : null;

        // get documentation
        temp['doc'] = methods.getDocumentation(c) ? methods.getFile(methods.getDocumentation(c), name) : null;

        return temp;

    },

    getComponents: function(){

        var result = {},
            temp = {};

        utils.walk(path.join(config.roots.src, config.paths.ui, 'components'), function(file){

            if(path.extname(file) === '.swig'){

                // get component baseName
                var base = path.dirname(file).split(path.sep);
                base = base[base.length-1];

                if(!temp[base]){
                    temp[base] = [];
                }

                temp[base].push(methods.getComponent(file));

            }

        });

        // loop through result
        result['components'] = [];
        for(var c in temp){

            var obj = {};
            obj['name'] = c;
            obj['sub'] = temp[c];
            result['components'].push(obj);

        }

        return result;

    },

    getPreviewData: function(){

        var data = {
            data: {}
        };

        // get data files
        utils.walk(path.join(config.roots.src, config.paths.data), function(f){

            var name = utils.stripExtension(utils.getFileName(f)),
                ext = utils.getExtension(f);

            if(ext === 'json'){
                // read file
                data.data[name] = JSON.parse(fs.readFileSync(f, 'utf8'));
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



    renderPreviews: function(data){

        // template of styleguide
        var template = path.join(config.roots.src, config.paths.layouts, config.paths.ui, 'preview.swig');

        // loop through components§
        data.components.forEach(function(c){

            c.sub.forEach(function(s) {

                // invalidate the swig cache
                swig.invalidateCache();

                // destination
                var dest = path.join(config.roots.www, config.paths.ui, 'preview', c.name, s.name + '.html');

                // data
                var compiledData = methods.getPreviewData(); // site wide data
                compiledData['url'] = s.url; // path for the include

                // strip extension from file
                var name = s.url.substr(0, s.url.indexOf('.swig')),
                    json = name + '.json';

                // check is a JSON file exists with the same file in the same directory
                var local = fse.readJsonSync(json, { throws: false });
                if(local){
                    compiledData.data['local'] = local;
                }

                // get FrontMatter data
                var fmData = utils.getFrontMatterData(compiledData.url);

                // get front matter attributes
                compiledData.data['fm'] = fmData.attributes;

                // render component
                compiledData['previewHTML'] =  swig.render(fmData.body, { locals: compiledData, filename: s.url });

                // render template using swig
                var swiggedContent = swig.renderFile(template, compiledData);

                // write file
                utils.writeFile(dest, swiggedContent, function (err) {
                    if (err) {
                        // console.log("Unable to render component: " + src);
                        return;
                    }

                    // console.log("Succesfully rendered component: " + src);

                });

            });

        });



    },

    renderComponents: function(data){

        // template of styleguide
        var template = config.roots.src + path.sep + config.paths.layouts + path.sep + config.paths.ui + path.sep + 'component.swig';

        // loop through components
        data.components.forEach(function(c){

            // invalidate the swig cache
            swig.invalidateCache();

            // destination
            var dest = path.join(config.roots.www, config.paths.ui, 'components', c.name + '.html');

            // data
            var compiledData = {};
            compiledData['component'] = c;
            compiledData['src'] = data;

            // get FontMatter data
            var fmData = utils.getFontMatterData(compiledData.component.sub[0].url);

            // get front matter attributes
            compiledData['fm'] = fmData.attributes;

            // render template using swig
            var swiggedContent = swig.renderFile(template, compiledData);

            // write file
            utils.writeFile(dest, swiggedContent, function(err){
                if(err){
                    // console.log("Unable to render component: " + src);
                    return;
                }

                // console.log("Succesfully rendered component: " + src);

            });

        });

    },

    renderUI: function(data){

        // render preview for each component
        methods.renderPreviews(data);

        // render documentation for each component
        methods.renderComponents(data);

    }

};

module.exports.render = function() {

    // render components
    var components = methods.getComponents();
        // modules = methods.getModules();

    methods.renderUI(components);
    // console.log(components)

};

module.exports.watch = function() {

    // gulp.watch(config.roots.src + '/' + config.paths.ui + '/**/*', ['output-styleguide']);

};
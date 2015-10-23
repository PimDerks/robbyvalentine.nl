'use strict';

// require monitors for conditioner
require('./base/js/00-vendor/conditioner/monitors/connection');
require('./base/js/00-vendor/conditioner/monitors/element');
require('./base/js/00-vendor/conditioner/monitors/media');
require('./base/js/00-vendor/conditioner/monitors/pointer');
require('./base/js/00-vendor/conditioner/monitors/window');

// require modules/components

var Conditioner = require('./base/js/00-vendor/conditioner/conditioner'),
    modernizr = require('./base/js/00-vendor/modernizr/modernizr');

Conditioner.setOptions({
    paths:{
        monitors:'./base/js/00-vendor/conditioner/monitors/'
    },
    loader:{
        require:function(paths,callback){

            // replace paths from 'components/Editor' to './components/Editor/Editor'

            paths.forEach(function(p, index){

                // split on slash
                var split = p.split('/');

                // duplicate last part
                split[split.length] = split[split.length - 1];

                // join
                paths[index] = './' + split.join('/');

            });

            var module = require(paths);
            callback(module);

        },
        config:function(path,options){

        },
        toUrl:function(path){
        }
    }
});

Conditioner.init(config.conditioner);

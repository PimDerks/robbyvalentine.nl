module.exports = (function(){

    return {

        // roots
        roots: {
            src: './src',
            www: './www',
            dest: './dest',
            tmp: './tmp',
            api: './api'
        },

        // path
        paths: {
            prototype: 'prototype',
            data: '_data',
            ui: 'ui',
            assets: 'assets',
            static: 'static',
            staticMin: 'static-min',
            sass: 'scss',
            css: 'css',
            js: 'js',
            includes: 'includes',
            img: 'img',
            fonts: 'fonts',
            icons: 'icons',
            layouts: '_layouts',
            shim: 'shim',
            media: 'media',
            styleguide: 'styleguide'
        },

        // server
        server: {
            port: 4444
        },

        // regex
        regex: {
            template: "{\\% extends '[a-z/]+\\.swig' \\%}"
        },

        // strings to replace
        strings: {
            templateStart: "{% extends '",
            templateEnd: "' %}"
        }

    }

}());
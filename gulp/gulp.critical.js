var gulp = require('gulp'),
    critical = require('critical');

module.exports = function () {

    critical.generate({
        base: 'www/prototype/',
        src: 'case.html',
        css: ['www/prototype/static/scss/screen.css'],
        dimensions: [{
            width: 320,
            height: 480
        },{
            width: 768,
            height: 1024
        },{
            width: 1280,
            height: 960
        }],
        dest: 'www/prototype/static/scss/critical.css',
        minify: true,
        extract: false,
        ignore: ['font-face']
    });

};
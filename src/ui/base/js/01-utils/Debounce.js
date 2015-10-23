define([], function() {

    'use strict';

    var exports = function(fn, delay){
        var timer = null;
        return function () {
            var context = this,
                args = arguments;

            // clear existing timer
            clearTimeout(timer);

            // set timer
            timer = setTimeout(function(){
                fn.apply(context, args);
            }, delay);
        };
    };

    return exports;

});
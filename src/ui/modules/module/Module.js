define(['base/components/Component/Component'], function(Component) {

    'use strict';

    /**
     * Initialize module.
     * @param {element} element - The node (element) to load this module on.
     * @param {object} options - Options for this module.
     */
    var exports = function(element, options) {

        this._element = element;
        this._options = options || {};
        this._initialize();

    };

    exports.prototype = {

        /**
         * Initialize module.
         *
         * @memberof Test
         * @static
         * @private
         */
        _initialize: function() {
            console.log('Initialized modules/Module with options', this._options, 'on', new Date(), Component);
        },

        /**
         * Clean up when unloading this module.
         *
         * @memberof Test
         * @static
         * @public
         */
        unload: function() {

        }

    };

    return exports;

});
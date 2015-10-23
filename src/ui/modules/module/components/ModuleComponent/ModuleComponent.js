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
    },

    /**
     * Returns the element the node is currently active on.
     * @returns {element|*|exports._element}
     */
    getElement: function(){
        return this._element;
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

module.exports = exports;
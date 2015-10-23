"use strict";

var module = require("./Component");

describe("test", function (){

    var instance;

    beforeEach(function(){
        var node = document.createElement('div');
        instance = new module(node);
    });

    it("should be true", function (){
        var bool = true;
        assert.isTrue(bool);
    });

    it("should return an element", function(){
        var element = instance.getElement();
        expect(element.nodeName.length > 0).to.be.true;
    });

});

exports.forPoly = function (POLYFILLS) {

    // TODO: Adjust library implementations to use polyfills if provided instead of
    //       native global implementations.

    var exports = {};

    exports._ = require("lodash");
    exports.EventEmitter = require("eventemitter2").EventEmitter2;
    exports.forge = require("node-forge");

    exports.path = require("path");
    exports.fs = require("fs-extra");

    exports.traverse = require("traverse");
    exports.CJSON = {
        stringify: require("canonical-json")
    };

    exports.ccjson = require("../../../lib/ccjson");

    return exports;
}

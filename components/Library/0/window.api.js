
window.jQuery = require("../../../cores/skin/for/semantic-ui/node_modules/semantic-ui-css/node_modules/jquery/dist/jquery.js");
window.$ = window.jQuery;
window._ = require("lodash");
window.EventEmitter = require("eventemitter2").EventEmitter2;

require("../../../cores/skin/for/semantic-ui/node_modules/semantic-ui-css/semantic.js");

;({"APPEND_AS_GLOBAL":"components/Library/0/node_modules/node-forge/js/forge.min.js"});


var api = {};

module.exports = api;


function waitFor (property, whenLoaded) {
	var waitInterval = setInterval(function () {
		if (typeof window[property] === "undefined") return;
		clearInterval(waitInterval);
		return whenLoaded(window[property]);
	}, 25);
}


// Wait for appended code (at the end of this file) to be available (scheduled above)
waitFor("forge", function (forge) {
    api.forge = forge;
});


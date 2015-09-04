
function loadLib () {
    const POLYFILLS = require("./components/Polyfills/0/server.api");
    const LIBRARY = require("./components/Library/0/server.api").forPoly(POLYFILLS);
    var lib = {};
    LIBRARY._.assign(lib, POLYFILLS);
    LIBRARY._.assign(lib, LIBRARY);
    return lib;
}

const LIB = loadLib();

LIB.Promise.try(function () {

    // Boot configuration

    const BOOT_CONFIG_PATH = LIB.path.join(__dirname, "PINF.Genesis.ccjson");


    // Boot implementation

    function makeContext (type, config) {
        if (type === "config") {
            return require("./cores/config/0-server.api").forLib(LIB).then(function (exports) {
                return new exports.Context(config);
            });
        }
        throw new Error("Unknown context type '" + type + "'");
    }

    return makeContext("config", {
        env: process.env,
        path: BOOT_CONFIG_PATH
    }).then(function (configContext) {

        return configContext.adapters["pinf.genesis.config"].spin(configContext);
    });

}).catch(function (err) {
    console.error(err.stack);
    process.exit(1);
})

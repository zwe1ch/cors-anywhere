const cors_proxy = require("cors-anywhere");

const host = process.env.HOST || "0.0.0.0";
const port = process.env.PORT || 8080;

const env = (name) => process.env[name] === undefined ? [] : process.env[name].split(",").map(value => value.trim()).filter((value) => value.length !== 0);

cors_proxy.createServer({
    originBlacklist: env("ORIGIN_BLACKLIST"),
    originWhitelist: env("ORIGIN_WHITELIST"),
    removeHeaders: env("REMOVE_HEADERS"),
    requireHeader: env("REQUIRE_HEADER")
}).listen(port, host, () => console.log("listen on ".concat(host, ":", port)));
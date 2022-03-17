//const artifacts = require('artifacts');
const CryptoBirdz = artifacts.require("CryptoBirdz");

module.exports = function (deployer) {
  deployer.deploy(CryptoBirdz);
};

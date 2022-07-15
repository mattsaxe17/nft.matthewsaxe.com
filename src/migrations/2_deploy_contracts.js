const Marketplace = artifacts.require('Marketplace');
const MattSaxeGenesisCollection = artifacts.require('MattSaxeGenesisCollection');

module.exports = function (deployer) {
  deployer.deploy(Marketplace).then(function () {
    return deployer.deploy(MattSaxeGenesisCollection, Marketplace.address);
  });
};

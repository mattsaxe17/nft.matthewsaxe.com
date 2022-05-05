const HDWalletProvider = require('@truffle/hdwallet-provider');
require('dotenv').config();
const mnemonic = process.env['MNEMONIC'];
const infuraProjectId = process.env['INFURA_PROJECT_ID'];

module.exports = {
  contracts_build_directory: './src/build/polygon-contracts',
  contracts_directory: './src/contracts',

  networks: {
    development: {
      host: '127.0.0.1',
      port: 7545,
      network_id: '*',
    },
    //polygon Infura mainnet
    mainnet: {
      provider: () =>
        new HDWalletProvider({
          mnemonic: {
            phrase: mnemonic,
          },
          providerOrUrl: `https://polygon-mainnet.infura.io/v3/${infuraProjectId}`,
        }),
      network_id: 137,
      confirmations: 2,
      timeoutBlocks: 200,
      skipDryRun: true,
      chainId: 137,
    },
    //polygon Infura testnet
    testnet: {
      provider: () =>
        new HDWalletProvider({
          mnemonic: {
            phrase: mnemonic,
          },
          providerOrUrl: `https://polygon-mumbai.infura.io/v3/${infuraProjectId}`,
        }),
      network_id: 80001,
      confirmations: 2,
      timeoutBlocks: 200,
      skipDryRun: true,
      chainId: 80001,
    },
  },

  mocha: {
    timeout: 10000,
  },

  compilers: {
    solc: {
      version: '0.8.13',
    },
  },

  db: {
    enabled: true,
  },
};

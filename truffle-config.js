const infuraProjectId = process.env['INFURA_PROJECT_ID'];

module.exports = {
  contracts_build_directory: './src/build/ethereum-contracts',
  contracts_directory: './src/contracts',

  networks: {
    development: {
      host: '127.0.0.1',
      port: 7545,
      network_id: '*',
    },
    testnet: {
      host: `https://rinkeby.infura.io/v3/${infuraProjectId}`,
    },
    mainnet: {
      host: `https://mainnet.infura.io/v3/${infuraProjectId}`,
    },
  },

  mocha: {
    timeout: 10000,
  },

  compilers: {
    solc: {
      // version: "0.5.1",    // Fetch exact version from solc-bin (default: truffle's version)
      // docker: true,        // Use "0.5.1" you've installed locally with docker (default: false)
      // settings: {          // See the solidity docs for advice about optimization and evmVersion
      //  optimizer: {
      //    enabled: false,
      //    runs: 200
      //  },
      //  evmVersion: "byzantium"
      // }
    },
  },

  // Truffle DB is enabled in this project by default. Enabling Truffle DB surfaces access to the @truffle/db package
  // for querying data about the contracts, deployments, and networks in this project
  db: {
    enabled: true,
  },
};

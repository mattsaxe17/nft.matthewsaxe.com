const infuraProjectId = process.env['INFURA_PROJECT_ID'];

module.exports = {
  contracts_build_directory: './src/build/ethereum-contracts',
  contracts_directory: './src/contracts',
  migrations_directory: './src/migrations',

  networks: {
    development: {
      host: '127.0.0.1',
      port: 7545,
      network_id: 5777,
    },

    testnet: {
      host: `https://rinkeby.infura.io/v3/${infuraProjectId}`,
      network_id: 4,
      port: 443,
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
      version: '0.8.13',
    },
  },

  db: {
    enabled: true,
  },
};

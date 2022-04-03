module.exports = {
  contracts_directory: './src/contracts',
  contracts_build_directory: './src/build',

  networks: {
    development: {
      host: '127.0.0.1',
      port: 7545,
      network_id: '5777',
    },
    test: {
      host: 'https://ropsten.infura.io/v3/b8c18129593d4099883c83517301667d',
      port: 443,
      network_id: '*'
    },
    live: {
      host: 'https://mainnet.infura.io/v3/b8c18129593d4099883c83517301667d',
      port: 443,
      network_id: '*'
    }
  },

  compilers: {
    solc: {
      version: '^0.8.10',
      optimizer: {
        enabled: false,
        runs: 200,
      },
    },
  },
};

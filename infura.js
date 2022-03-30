const Web3 = require('web3');
const web3 = new Web3('HTTP://127.0.0.1:7545');

const acc2 = '0xE6364a79da2515c29B4866EcADB91d8B3006DbB2';

const tx = {
  to: acc2,
  value: web3.utils.toWei('0.34', 'ether'),
  gas: '21000',
  gasPrice: web3.utils.toWei('10', 'gwei'),
};

web3.eth.accounts.signTransaction(tx, '72d1f6d97a5e2aadae706f330c0f7ef1dbdf5927823d4a8c01ece8ad99deaad3')
.then(signedTx => {
  const sentTx = web3.eth.sendSignedTransaction(signedTx.rawTransaction);

  sentTx.on('reciept', (reciept) => {
    console.log('RECIEPT', reciept);
  });

  sentTx.on('error', (err) => {
    console.error('ERROR', err);
  });
});

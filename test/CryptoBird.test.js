const CryptoBirdz = artifacts.require('./CryptoBirdz');

contract('CryptoBirdz', (accounts) => {
  let contract;

  it('should deploy successfully', async () => {
    contract = await CryptoBirdz.deployed();
    const address = contract.address;

    expect(address).to.not.equal('');
    expect(address).to.not.equal(null);
    expect(address).to.not.equal(undefined);
    expect(address).to.not.equal(0x0);
  });

  it('should have a name', async () => {
    const name = await contract.name();
    expect(name).to.equal('CryptoBirdz');
  });

  it('should have a symbol', async () => {
    const symbol = await contract.symbol();
    expect(symbol).to.equal('CBIRDZ');
  });

  it('should create a new token', async () => {
    const result = await contract.mint('https...1');
    const event = result.logs[0].args;
    const totalSupply = await contract.totalSupply();

    expect(totalSupply.toNumber()).to.equal(1);
    expect(event._from).to.equal('0x0000000000000000000000000000000000000000');
    expect(event._to).equal(accounts[0]);
  });

  it('lists tokens', async () => {
    for (let i = 2; i <= 5; i++) {
      await contract.mint('https...' + i);
    }

    const totalSupply = await contract.totalSupply();
    let cBird;
    const results = [];

    for(let i = 0; i < totalSupply; i++) {
      cBird = await contract.tokens(i);
      results.push(cBird);
    }

    expect(results.length).to.equal(5);
    expect(results).to.deep.equal(['https...1', 'https...2', 'https...3', 'https...4', 'https...5']);
  });
});

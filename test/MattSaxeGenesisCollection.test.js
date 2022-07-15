const MattSaxeGenesisCollection = artifacts.require('MattSaxeGenesisCollection');

const gweiToEther = (gwei) => Number(gwei / 1000000000000000000);

contract('MattSaxeGenesisCollection', accounts => {
  it('Should deploy', async () => {
    const contract = await MattSaxeGenesisCollection.deployed();

    expect(!!contract).to.be.true;
  });

  it('Should get listing price', async () => {
    const contract = await MattSaxeGenesisCollection.deployed();

    const price = await contract.getListingPrice.call();
    expect(gweiToEther(price)).to.equal(1.7);
  });

  it('Should mint new tokens', async () => {
    const contract = await MattSaxeGenesisCollection.deployed();

    await contract.mint('https://images.unsplash.com/photo-1657181706325-127e210b5e38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=742&q=80');
    const supply = await contract.totalSupply.call();
    expect(Number(supply)).to.equal(1);
  });

  it('Should retrieve tokens for an address', async () => {
    const contract = await MattSaxeGenesisCollection.deployed();

    const balance = await contract.balanceOf('0xBb3Ad0aaE2936C800f1121a0C7fD574d46bE4a77');
    expect(Number(balance)).to.equal(1);

    const token = await contract.tokenOfOwnerByIndex('0xBb3Ad0aaE2936C800f1121a0C7fD574d46bE4a77', 0);
    const tokenUri = await contract.tokenURI(Number(token));
    console.log(tokenUri)
  });
});

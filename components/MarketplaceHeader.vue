<template>
  <div id="marketplace-header">
    <div id="header-logo">
      <img src="logo.svg" />
    </div>
    <div id="header-title">
      Matthew Saxe Genesis Collection (Coming Soon!)
    </div>
    <p>0 NFTs</p>
    <p id="header-description">This NFT collection is meant to be an ongoing project with the purpose of showcasing and sharpening my web3
      development skills. The code is (and will continue to be) available on my <a href="https://github.com/mattsaxe17/personal-nft-marketplace">Github</a>.
      Feel free to look around and check out the code, but I don't recommend buying one if you want to see any kind of return (:</p>
  </div>
</template>

<script>
export default {}
</script>

<style lang="scss" scoped>
#marketplace-header {
  display: flex;
  flex-direction: column;
  align-items: center;

  #header-logo {
    width: 6em;
    height: 6em;
    border-radius: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 1em;

    img {
      height: 70%;
      margin: auto;
    }
  }

  #header-title {
    font-size: 2em;
    font-weight: bold;
    margin-bottom: .5em;
    text-align: center;
  }

  #header-description {
    text-align: center;
    max-width: 60vw;
    margin: auto;
    color: var(--v-accent-lighten4);
  }
}
</style>
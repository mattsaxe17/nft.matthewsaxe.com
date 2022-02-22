<template>
  <div id="marketplace-header">
    <div id="header-logo">
      <img src="logo.svg" />
    </div>
    <div id="header-title">
      Matthew Saxe Genesis Collection
    </div>
  </div>
</template>

<script>
export default {

}
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
    border: 3px solid var(--v-background-lighten3);
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
    margin-bottom: 1em;
  }
}
</style>
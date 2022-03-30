<template>
  <div>
    <div id="content-section">
      <marketplace-header />
      <marketplace-body />
    </div>
  </div>
</template>

<script>
import MarketplaceHeader from '~/components/MarketplaceHeader.vue';
import MarketplaceBody from '~/components/MarketplaceBody.vue';

export default {
  components: {
    MarketplaceHeader,
    MarketplaceBody,
  },
};
</script>

<style lang="scss">
#content-section {
  padding-top: 8em;
}

.icon {
  height: 1.5em;
}

#app-bar {
  animation: $fade-in;
  animation-delay: -0.1s;
  transition-property: box-shadow, padding, height, top;
  transition-duration: 0.5s;
  opacity: 1 !important;
  background-color: var(--v-background-base);
  z-index: 2;
  width: 100vw;
  display: flex;
  align-items: center;
  position: fixed;
  height: 8em;
  padding: 2em;

  .logo {
    height: 100%;

    img {
      height: 100%;
      cursor: pointer;
    }
  }
}
</style>

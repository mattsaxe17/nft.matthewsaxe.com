<template>
  <div id="page-wrapper">
    <marketplace-header />
    <marketplace-body />
  </div>
</template>

<script>
import MarketplaceBody from '~/components/MarketplaceBody.vue';
import MarketplaceHeader from '~/components/MarketplaceHeader.vue';

export default {
  components: {
    MarketplaceHeader,
    MarketplaceBody
  }
};
</script>

<style lang="scss">
#page-wrapper {
  display: flex;
  flex-direction: column;
  align-items: center;
}
</style>

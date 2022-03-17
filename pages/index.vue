<template>
  <div>
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
    MarketplaceBody,
  },
};
</script>

<style></style>

<template>
  <div id="marketplace-body">
    <slot name="notifications"></slot>
    <nft-card
      v-for="token in []"
      :key="token.id"
      :name="`Matthew Saxe #${token.id}`"
      :image="token.image"
      :collection="token.collection"
      :price="token.price"
    />
  </div>
</template>

<script>
import NftCard from './NftCard.vue';

export default {
  components: {
    NftCard,
  },
};
</script>

<style lang="scss" scoped>
#marketplace-body {
  width: 100%;
  max-width: 1500px;
  display: grid;
  justify-content: center;
  gap: 1.5em;
  grid-template-columns: repeat(auto-fit, min(20em, 40%));
  margin: auto;
}
</style>

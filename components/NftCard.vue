<template>
  <div id="nft-card">
    <img :src="image" />

    <div class="nft-info">
      <div class="nft-info-block">
        <p class="nft-info-block-label">{{ collection }}</p>
        {{ name }}
      </div>

      <div class="nft-info-block">
        <p class="nft-info-block-label">Price</p>
        <v-icon small>mdi-ethereum</v-icon>{{ price }}
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    image: {
      type: String,
      required: true
    },
    name: {
      type: String,
      required: true
    },
    collection: {
      type: String,
      required: true
    },
    price: {
      type: Number,
      required: true
    }
  }
}
</script>

<style lang="scss" scoped>
#nft-card {
  border-radius: .75em;
  overflow: hidden;
  background-color: var(--v-background-lighten1);
  border: 1px solid var(--v-background-darken1);
  cursor: pointer;

  .nft-info {
    padding: .75em;
    display: flex;
    justify-content: space-between;

    .nft-info-block {
      .nft-info-block-label {
        margin: 0;
        font-size: .8em;
        color: grey;
      }

      &:nth-of-type(2) {
        text-align: right;
      }
    }
  }

  img {
    width:100%
  }
}
</style>
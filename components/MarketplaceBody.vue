<template>
  <div id="marketplace-body">
    <nft-card
      v-for="nft in nfts"
      :key="nft.id"
      :name="`Matthew Saxe #${nft.id}`"
      :image="nft.image"
      :collection="nft.collection"
      :price="nft.price"
    />
  </div>
</template>

<script>
import NftCard from './NftCard.vue';

export default {
  components: {
    NftCard
  },
  data() {
    return {
      nfts: [
        {id: 0, image: 'https://lh3.googleusercontent.com/ZF_v-oAvg6S3U4zbzGbsmUsuaqCIbu4NYkQCLfuq7F9ngW5spC4FZNSzyautEOLPpmK-bysiaHROJlqb_zIHfgdoFgAati08GPgdlg=w342', collection: 'Matt Saxe Genesis', price: 6.9},
        {id: 1, image: 'https://lh3.googleusercontent.com/ZF_v-oAvg6S3U4zbzGbsmUsuaqCIbu4NYkQCLfuq7F9ngW5spC4FZNSzyautEOLPpmK-bysiaHROJlqb_zIHfgdoFgAati08GPgdlg=w342', collection: 'Matt Saxe Genesis', price: 6.9},
        {id: 2, image: 'https://lh3.googleusercontent.com/ZF_v-oAvg6S3U4zbzGbsmUsuaqCIbu4NYkQCLfuq7F9ngW5spC4FZNSzyautEOLPpmK-bysiaHROJlqb_zIHfgdoFgAati08GPgdlg=w342', collection: 'Matt Saxe Genesis', price: 6.9},
        {id: 3, image: 'https://lh3.googleusercontent.com/ZF_v-oAvg6S3U4zbzGbsmUsuaqCIbu4NYkQCLfuq7F9ngW5spC4FZNSzyautEOLPpmK-bysiaHROJlqb_zIHfgdoFgAati08GPgdlg=w342', collection: 'Matt Saxe Genesis', price: 6.9},
        {id: 4, image: 'https://lh3.googleusercontent.com/ZF_v-oAvg6S3U4zbzGbsmUsuaqCIbu4NYkQCLfuq7F9ngW5spC4FZNSzyautEOLPpmK-bysiaHROJlqb_zIHfgdoFgAati08GPgdlg=w342', collection: 'Matt Saxe Genesis', price: 6.9},
        {id: 5, image: 'https://lh3.googleusercontent.com/ZF_v-oAvg6S3U4zbzGbsmUsuaqCIbu4NYkQCLfuq7F9ngW5spC4FZNSzyautEOLPpmK-bysiaHROJlqb_zIHfgdoFgAati08GPgdlg=w342', collection: 'Matt Saxe Genesis', price: 6.9},
        {id: 6, image: 'https://lh3.googleusercontent.com/ZF_v-oAvg6S3U4zbzGbsmUsuaqCIbu4NYkQCLfuq7F9ngW5spC4FZNSzyautEOLPpmK-bysiaHROJlqb_zIHfgdoFgAati08GPgdlg=w342', collection: 'Matt Saxe Genesis', price: 6.9},
        {id: 7, image: 'https://lh3.googleusercontent.com/ZF_v-oAvg6S3U4zbzGbsmUsuaqCIbu4NYkQCLfuq7F9ngW5spC4FZNSzyautEOLPpmK-bysiaHROJlqb_zIHfgdoFgAati08GPgdlg=w342', collection: 'Matt Saxe Genesis', price: 6.9},
        {id: 8, image: 'https://lh3.googleusercontent.com/ZF_v-oAvg6S3U4zbzGbsmUsuaqCIbu4NYkQCLfuq7F9ngW5spC4FZNSzyautEOLPpmK-bysiaHROJlqb_zIHfgdoFgAati08GPgdlg=w342', collection: 'Matt Saxe Genesis', price: 6.9},
        {id: 9, image: 'https://lh3.googleusercontent.com/ZF_v-oAvg6S3U4zbzGbsmUsuaqCIbu4NYkQCLfuq7F9ngW5spC4FZNSzyautEOLPpmK-bysiaHROJlqb_zIHfgdoFgAati08GPgdlg=w342', collection: 'Matt Saxe Genesis', price: 6.9},
        {id: 11, image: 'https://lh3.googleusercontent.com/ZF_v-oAvg6S3U4zbzGbsmUsuaqCIbu4NYkQCLfuq7F9ngW5spC4FZNSzyautEOLPpmK-bysiaHROJlqb_zIHfgdoFgAati08GPgdlg=w342', collection: 'Matt Saxe Genesis', price: 6.9},
        {id: 22, image: 'https://lh3.googleusercontent.com/ZF_v-oAvg6S3U4zbzGbsmUsuaqCIbu4NYkQCLfuq7F9ngW5spC4FZNSzyautEOLPpmK-bysiaHROJlqb_zIHfgdoFgAati08GPgdlg=w342', collection: 'Matt Saxe Genesis', price: 6.9},
        {id: 33, image: 'https://lh3.googleusercontent.com/ZF_v-oAvg6S3U4zbzGbsmUsuaqCIbu4NYkQCLfuq7F9ngW5spC4FZNSzyautEOLPpmK-bysiaHROJlqb_zIHfgdoFgAati08GPgdlg=w342', collection: 'Matt Saxe Genesis', price: 6.9},
        {id: 44, image: 'https://lh3.googleusercontent.com/ZF_v-oAvg6S3U4zbzGbsmUsuaqCIbu4NYkQCLfuq7F9ngW5spC4FZNSzyautEOLPpmK-bysiaHROJlqb_zIHfgdoFgAati08GPgdlg=w342', collection: 'Matt Saxe Genesis', price: 6.9},
        {id: 55, image: 'https://lh3.googleusercontent.com/ZF_v-oAvg6S3U4zbzGbsmUsuaqCIbu4NYkQCLfuq7F9ngW5spC4FZNSzyautEOLPpmK-bysiaHROJlqb_zIHfgdoFgAati08GPgdlg=w342', collection: 'Matt Saxe Genesis', price: 6.9},
        {id: 66, image: 'https://lh3.googleusercontent.com/ZF_v-oAvg6S3U4zbzGbsmUsuaqCIbu4NYkQCLfuq7F9ngW5spC4FZNSzyautEOLPpmK-bysiaHROJlqb_zIHfgdoFgAati08GPgdlg=w342', collection: 'Matt Saxe Genesis', price: 6.9},
        {id: 77, image: 'https://lh3.googleusercontent.com/ZF_v-oAvg6S3U4zbzGbsmUsuaqCIbu4NYkQCLfuq7F9ngW5spC4FZNSzyautEOLPpmK-bysiaHROJlqb_zIHfgdoFgAati08GPgdlg=w342', collection: 'Matt Saxe Genesis', price: 6.9},
        {id: 88, image: 'https://lh3.googleusercontent.com/ZF_v-oAvg6S3U4zbzGbsmUsuaqCIbu4NYkQCLfuq7F9ngW5spC4FZNSzyautEOLPpmK-bysiaHROJlqb_zIHfgdoFgAati08GPgdlg=w342', collection: 'Matt Saxe Genesis', price: 6.9},
        {id: 99, image: 'https://lh3.googleusercontent.com/ZF_v-oAvg6S3U4zbzGbsmUsuaqCIbu4NYkQCLfuq7F9ngW5spC4FZNSzyautEOLPpmK-bysiaHROJlqb_zIHfgdoFgAati08GPgdlg=w342', collection: 'Matt Saxe Genesis', price: 6.9},
        {id: 111, image: 'https://lh3.googleusercontent.com/ZF_v-oAvg6S3U4zbzGbsmUsuaqCIbu4NYkQCLfuq7F9ngW5spC4FZNSzyautEOLPpmK-bysiaHROJlqb_zIHfgdoFgAati08GPgdlg=w342', collection: 'Matt Saxe Genesis', price: 6.9},
        {id: 222, image: 'https://lh3.googleusercontent.com/ZF_v-oAvg6S3U4zbzGbsmUsuaqCIbu4NYkQCLfuq7F9ngW5spC4FZNSzyautEOLPpmK-bysiaHROJlqb_zIHfgdoFgAati08GPgdlg=w342', collection: 'Matt Saxe Genesis', price: 6.9},
        {id: 333, image: 'https://lh3.googleusercontent.com/ZF_v-oAvg6S3U4zbzGbsmUsuaqCIbu4NYkQCLfuq7F9ngW5spC4FZNSzyautEOLPpmK-bysiaHROJlqb_zIHfgdoFgAati08GPgdlg=w342', collection: 'Matt Saxe Genesis', price: 6.9},
        {id: 444, image: 'https://lh3.googleusercontent.com/ZF_v-oAvg6S3U4zbzGbsmUsuaqCIbu4NYkQCLfuq7F9ngW5spC4FZNSzyautEOLPpmK-bysiaHROJlqb_zIHfgdoFgAati08GPgdlg=w342', collection: 'Matt Saxe Genesis', price: 6.9},
        {id: 555, image: 'https://lh3.googleusercontent.com/ZF_v-oAvg6S3U4zbzGbsmUsuaqCIbu4NYkQCLfuq7F9ngW5spC4FZNSzyautEOLPpmK-bysiaHROJlqb_zIHfgdoFgAati08GPgdlg=w342', collection: 'Matt Saxe Genesis', price: 6.9},
      ]
    }
  }
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

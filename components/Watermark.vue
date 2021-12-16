<template>
  <div id="watermark" :class="{ darken: !$vuetify.theme.dark }">
    <slot></slot>
  </div>
</template>

<script>
export default {}
</script>

<style lang="scss" scoped>
#watermark {
  padding: 0;
  margin: 0;
  position: fixed;
  z-index: 0;
  font-size: 48vw;
  line-height: 48vw;
  bottom: -4vh;
  right: 2vw;
  color: var(--v-background-darken1);
  opacity: .125;
  font-family: monospace;
  transform: rotate(-17deg);

  &.darken {
    opacity: .2;
  }
}
</style>
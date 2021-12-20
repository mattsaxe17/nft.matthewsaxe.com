<template>
  <v-btn :text="text" :href="link" :class="{ colored }">
    <slot></slot>
  </v-btn>
</template>

<script>
export default {
  name: 'MButton',
  props: {
    text: {
      type: Boolean,
      default: false,
    },
    link: {
      type: String,
      default: null,
    },
    colored: {
      type: Boolean
    }
  },
};
</script>

<style lang="scss" scoped>
a.colored {
  background-color: var(--v-secondary-base) !important;
}
</style>

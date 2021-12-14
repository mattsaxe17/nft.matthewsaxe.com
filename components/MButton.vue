<template>
  <v-btn :text="text" @click="window.location.href = link ? link : window.location.href">
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
  },
};
</script>

<style></style>

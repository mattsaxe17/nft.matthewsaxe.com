<template>
  <a :href="href" :target="newTab ? '_blank' : ''" class="m-link">
    <slot></slot>
  </a>
</template>

<script>
export default {
  name: 'MLink',
  props: {
    href: {
      type: String,
      default: null,
    },
    newTab: {
      type: Boolean,
      default: false
    }
  },
};
</script>

<style lang="scss">
.m-link {
  text-decoration: none;
  font-weight: bold;
  color: var(--v-primary-base)
}
</style>

<template>
  <div id="nav-bar">
    <div id="desktop-menu" class="d-none d-md-block">
      <nav-menu-items />
    </div>

    <div id="mobile-menu" class="d-md-none">
      <img src="/menu.svg" alt="menu icon" @click="$emit('toggleNavDrawer')" />
    </div>
  </div>
</template>

<script>
import Vue from 'vue';
import NavMenuItems from './NavMenuItems.vue';

export default Vue.extend({
  components: {
    NavMenuItems,
  },
  props: {
    navDrawer: {
      type: Boolean
    }
  }
});
</script>

<style lang="scss" scoped>
#nav-bar {
  height: 50%;
  display: flex;
  align-items: center;

  #mobile-menu {
    height: 100%;

    img {
      height: 1.5em;
    }
  }
}
</style>

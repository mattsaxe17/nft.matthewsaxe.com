<template>
  <v-app>
    <div id="app-bar" ref="appBar">
      <nuxt-link to="/" class="menu-link logo">
        <img src="/logo.svg" alt="logo" />
      </nuxt-link>

      <v-spacer />

      <nav-menu />
    </div>
  </v-app>
</template>

<script>
import Vue from 'vue';

export default Vue.extend({
  data() {
    return {
      scrollPos: 0,
    }
  },
  mounted() {
    window.onscroll = () => {
      const currentScrollPos = window.pageYOffset
      const appBar = this.$refs.appBar;

      appBar.style.top = this.scrollPos > currentScrollPos ? '0' : '-100%'

      this.scrollPos = currentScrollPos
    }
  },
});
</script>

<style lang="scss" scoped>
* {
  cursor: default;

  #app-bar {
    width: 100%;
    display: flex;
    align-items: center;
    position: fixed;
    transition: top 0.5s;
    height: 8em;
    padding: 2em;

    .logo {
      height: 100%;

      img {
        height: 100%;
        cursor: pointer;
      }
    }
  }
}
</style>

<template>
  <v-app :style="{ background: $vuetify.theme.themes[theme].background }">
    <div id="app-bar" ref="appBar">
      <nuxt-link to="/" class="menu-link logo">
        <img src="/logo.svg" alt="logo" @click="scrollToTop"/>
      </nuxt-link>

      <v-spacer />

      <nav-menu :nav-drawer="navDrawer" @toggleNavDrawer="toggleNavDrawer" />
    </div>

    <v-navigation-drawer v-model="navDrawer" class="d-md-none" right fixed>
      <div id="mobile-menu-drawer-content">
        <img class="icon" src="/x.svg" @click="toggleNavDrawer" />
        <nav-menu-items mobile />
      </div>
    </v-navigation-drawer>

    <div id="page-content">
      <v-main>
        <Nuxt />
      </v-main>
    </div>
  </v-app>
</template>

<script>
import Vue from 'vue';

export default Vue.extend({
  name: 'DefaultLayout',
  data() {
    return {
      scrollPos: 0,
      navDrawer: null,
    };
  },
  computed: {
    theme() {
      return this.$vuetify.theme.dark ? 'dark' : 'light';
    },
  },
  mounted() {
    window.onscroll = () => {
      const currentScrollPos = window.pageYOffset;
      const appBar = this.$refs.appBar;

      appBar.style.top = this.scrollPos > currentScrollPos || currentScrollPos < 30 ? '0' : '-100%';
      appBar.style.boxShadow = currentScrollPos < 30 ? 'none' : '0 10px 30px -10px black';
      appBar.style.paddingTop = currentScrollPos < 30 ? '2em' : '1em';
      appBar.style.height = currentScrollPos < 30 ? '8em' : '6em';

      this.scrollPos = currentScrollPos;
    };
  },
  methods: {
    toggleNavDrawer() {
      this.navDrawer = !this.navDrawer;
    },
    scrollToTop() {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    },
  },
});
</script>

<style lang="scss" scoped>
* {
  cursor: default;

  body #page-content {
    z-index: 1;
    margin-top: 8em;
    padding: 2em;
  }

  .icon {
    height: 1.5em;
  }

  #mobile-menu-drawer-content {
    padding: 2em;
    z-index: 3;

    .icon {
      position: fixed;
      top: 2em;
      right: 2em;
    }
  }

  #app-bar {
    animation: $fade-in;
    animation-delay: -0.1s;
    transition-property: box-shadow, padding, height, top;
    transition-duration: 0.5s;
    opacity: 1 !important;
    background-color: var(--v-background-base);
    z-index: 2;
    width: 100vw;
    display: flex;
    align-items: center;
    position: fixed;
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

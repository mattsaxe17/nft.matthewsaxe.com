<template>
  <v-app :style="{ background: $vuetify.theme.themes[theme].background }">
    <div id="app-bar" ref="appBar">
      <a href="https://matthewsaxe.com" class="menu-link logo">
        <img src="/logo.svg" alt="logo" @click="scrollToTop" />
      </a>

      <v-spacer />

      <nav-menu />
    </div>

    <div id="page-content" class="mx-xs-0 mx-xs-md-3">
      <v-main>
        <Nuxt />
      </v-main>
    </div>

    <watermark>NFT</watermark>
  </v-app>
</template>

<script>
import Vue from 'vue';
import Watermark from '~/components/Watermark.vue';

export default Vue.extend({
  name: 'DefaultLayout',
  components: { Watermark },
  data() {
    return {
      scrollPos: 0,
    };
  },
  mounted() {
    window.onscroll = () => {
      const currentScrollPos = window.pageYOffset;
      const appBar = this.$refs.appBar;

      appBar.style.top = this.scrollPos > currentScrollPos || currentScrollPos < 30 ? '0' : '-100%';
      appBar.style.boxShadow = currentScrollPos < 30 ? 'none' : '0 10px 30px -10px black';
      appBar.style.paddingTop = currentScrollPos < 30 ? '2em' : '1.5em';
      appBar.style.paddingBottom = currentScrollPos < 30 ? '2em' : '1.5em';
      appBar.style.height = currentScrollPos < 30 ? '8em' : '6em';

      this.scrollPos = currentScrollPos;
    };
  },
  methods: {
    scrollToTop() {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    },
  },
  computed: {
    theme() {
      return this.$vuetify.theme.dark ? 'dark' : 'light';
    },
  },
});
</script>

<style lang="scss" scoped>
* {
  cursor: default;

  .icon {
    height: 1.5em;
  }
}
</style>

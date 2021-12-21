<template>
  <v-app dark>
    <div id="error-page">
      <h1 v-if="error.statusCode === 404">
        {{ pageNotFound }}
      </h1>
      <h1 v-else>
        {{ otherError }}
      </h1>
      <NuxtLink to="/">Go home</NuxtLink>
    </div>
  </v-app>
</template>

<script>
export default {
  layout: 'empty',
  props: {
    error: {
      type: Object,
      default: null,
    },
  },
  data() {
    return {
      pageNotFound: "Whoops! That page doesn't exist",
      otherError: 'Uh-oh! something went wrong!',
    };
  },
  head() {
    const title = this.error.statusCode === 404 ? this.pageNotFound : this.otherError;
    return {
      title,
    };
  },
};
</script>

<style lang="scss" scoped>
body {
  height: 100vh;
  overflow: hidden;

  .v-application {
    background-color: transparent !important;
  }

  #error-page {
    height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
  }

  #app-bar {
    display: none !important;
  }

  h1 {
    font-size: 20px;
  }
}
</style>

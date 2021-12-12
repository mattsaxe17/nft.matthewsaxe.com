<template>
  <div>
    <nav :class="{ mobile }">
      <nuxt-link to="#about" class="menu-link"><span class="prefix">01.</span>About</nuxt-link>
      <nuxt-link to="#projects" class="menu-link"><span class="prefix">02.</span>Projects</nuxt-link>
      <nuxt-link to="#contact" class="menu-link"><span class="prefix">03.</span>Contact</nuxt-link>
      <!-- <nuxt-link to="/blog">Blog</nuxt-link> -->
    </nav>
  </div>
</template>

<script>
export default {
  props: {
    mobile: {
      type: Boolean,
      default: false,
    },
  },
};
</script>

<style lang="scss">
nav {
  display: flex;
  gap: 1em;

  .menu-link {
    color: white;
    text-decoration: none;

    .prefix {
      color: $primary-color;
      font-weight: bold;

      &::after {
        content: ' ';
      }
    }
  }

  &.mobile {
    flex-direction: column;

    .menu-link {
      display: flex;
      flex-direction: column;
    }
  }
}
</style>

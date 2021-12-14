<template>
  <div>
    <nav :class="{ mobile }">
      <nuxt-link to="#about" class="menu-link"><span class="prefix">00.</span>About</nuxt-link>
      <nuxt-link to="#projects" class="menu-link"><span class="prefix">01.</span>Projects</nuxt-link>
      <nuxt-link to="#contact" class="menu-link"><span class="prefix">02.</span>Contact</nuxt-link>
      <!-- <nuxt-link to="/blog">Blog</nuxt-link> -->
      <v-switch v-model="$vuetify.theme.dark" inset color="#e4602f">
        <template #label>
          <v-icon>mdi-weather-night</v-icon>
        </template>
      </v-switch>
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
    text-decoration: none;

    .prefix {
      font-weight: bold;
      color: var(--v-primary-base);

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

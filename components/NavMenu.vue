<template>
  <div id="nav-bar">
    <nav class="d-none d-md-flex">
      <nuxt-link to="#about" class="menu-link"><span class="prefix">01.</span>About</nuxt-link>
      <nuxt-link to="#projects" class="menu-link"><span class="prefix">02.</span>Projects</nuxt-link>
      <nuxt-link to="#contact" class="menu-link"><span class="prefix">03.</span>Contact</nuxt-link>
      <!-- <nuxt-link to="/blog">Blog</nuxt-link> -->
    </nav>

    <img id="mobile-menu" class="d-inline d-md-none" src="/menu.svg" alt="menu icon" />
  </div>
</template>

<style lang="scss" scoped>
#nav-bar {
  height: 50%;

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
          content: " "
        }
      }
    }
  }

  #mobile-menu {
    height: 100%;
  }
}
</style>

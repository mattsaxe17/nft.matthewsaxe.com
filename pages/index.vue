<template>
  <div>
    <section id="hero">
      <nuxt-content :document="hero" />
    </section>

    <section id="about">
      <section-header>
        <template #number>01</template>
        About me
      </section-header>
      <nuxt-content :document="about" />
    </section>
  </div>
</template>

<script>
export default {
  async asyncData({ $content }) {
    const hero = await $content('hero').fetch();
    const about = await $content('about').fetch();

    return {
      hero,
      about,
    };
  },
};
</script>

<style lang="scss">
section {
  padding: 4em 0 8em 0;
}
#hero {
  height: calc(100vh - 8em);

  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  p,
  button {
    padding: 0.25em 0;
    animation: $fade-in;
    animation-timing-function: ease-out;
    line-height: 1em;
  }

  h1 {
    font-size: 1.25em;
    color: $primary-color;
    animation-delay: .25s;
  }

  h2 {
    animation-delay: 0.5s;
    font-size: 3em;
    color: $light-color-1;
  }

  h3 {
    animation-delay: 0.75s;
    font-size: 2.5em;
    color: $light-color-2;
    padding-bottom: 0.4em;
  }

  p {
    animation-delay: 1s;
    color: $light-color-2;
    line-height: 1.25em;
  }

  button {
    animation-delay: 1.25s;
    color: $light-color-1;
    background-color: $secondary-color;
    text-transform: none;
    padding: 0.5em 2em;
  }
}

@keyframes fadeInAnimation {
  0% {
    transform: translate(0, 0.75em);
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}
</style>

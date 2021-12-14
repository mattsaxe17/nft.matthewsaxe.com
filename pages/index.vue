<template>
  <div>
    <section id="hero">
      <nuxt-content :document="hero" />
    </section>

    <section id="about">
      <section-header>
        <template #number>00</template>
        About me
      </section-header>
      <nuxt-content :document="about" />
    </section>

    <section id="projects">
      <section-header>
        <template #number>01</template>
        My projects
      </section-header>
      <nuxt-content :document="projects" />
    </section>

    <section id="projects">
      <section-header>
        <template #number>02</template>
        Get in touch
      </section-header>
      <nuxt-content :document="contact" />
    </section>
  </div>
</template>

<script>
export default {
  async asyncData({ $content }) {
    const hero = await $content('hero').fetch();
    const about = await $content('about').fetch();
    const projects = await $content('projects').fetch();
    const contact = await $content('contact').fetch();

    return {
      hero,
      about,
      projects,
      contact
    };
  },
};
</script>

<style lang="scss">
section {
  padding: 4em 0 8em 0;
}

h1,
h2,
h3,
h4,
h5,
h6 {
  font-family: $display-font;
}

p {
  font-family: $main-font;
  color: var(--v-accent-lighten3)
}

ul {
  padding: 0 !important;
  display: flex;
  flex-wrap: wrap;
  list-style: none;

  li {
    display: flex;
    width: 50%;
    align-items: center;
    color: var(--v-accent-lighten3);

    &:before {
      content: url('/arrow.svg');
      position: relative;
      padding-right: .25em;
    }
  }
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
    color: var(--v-primary-base);
    animation-delay: 0.25s;
  }

  h2 {
    animation-delay: 0.5s;
    font-size: 3em;
  }

  h3 {
    animation-delay: 0.75s;
    font-size: 2.5em;
    padding-bottom: 0.4em;
    color: var(--v-accent-lighten3)
  }

  p {
    animation-delay: 1s;
    line-height: 1.25em;
  }

  button {
    animation-delay: 1.25s;
    background-color: var(--v-secondary-base);
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

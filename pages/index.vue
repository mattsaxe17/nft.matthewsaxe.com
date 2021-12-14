<template>
  <div>
    <section id="hero">
      <div class="section-content">
        <nuxt-content :document="hero" />
      </div>
    </section>

    <section id="about">
      <div class="section-content">
        <section-header number="00" title="About me" />
        <nuxt-content :document="about" />
      </div>
    </section>

    <section id="projects">
      <div class="section-content">
        <section-header number="01" title="My work" />
        <nuxt-content :document="projects" />
      </div>
    </section>

    <section id="contact">
      <div class="section-content">
        <section-header number="02" title="Get in touch" />
        <nuxt-content :document="contact" />
      </div>
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
      contact,
    };
  },
};
</script>

<style lang="scss">
section {
  display: flex;
  justify-content: center;
  padding: 4em 0 8em 0;

  .section-content {
    max-width: 900px;

    .nuxt-content-container {
      padding: 0 2em;
    }
  }
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
  color: var(--v-accent-lighten3);
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
      padding-right: 0.25em;
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
    padding: 0.15em 0;
    animation: $fade-in;
    animation-timing-function: ease-out;
    line-height: 1em;
  }

  h1 {
    font-size: max(1.25em, 1.75vw);
    color: var(--v-primary-base);
    animation-delay: 0.25s;
  }

  h2 {
    animation-delay: 0.5s;
    font-size: max(3em, 4.5vw);
  }

  h3 {
    animation-delay: 0.75s;
    font-size: max(2.5em, 3.5vw);
    padding-bottom: 0.4em;
    color: var(--v-accent-lighten3);
  }

  p {
    animation-delay: 1s;
    line-height: 1.25em;
    font-size: 1em;
  }

  button {
    animation-delay: 1.25s;
    background-color: var(--v-secondary-base);
    text-transform: none;
    padding: 0.5em 2em;
    font-size: 1em;
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

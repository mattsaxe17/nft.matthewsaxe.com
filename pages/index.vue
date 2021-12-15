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
  padding: 4em 0 16em 0;

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
  min-width: 300px;

  li {
    display: flex;
    align-items: center;
    color: var(--v-accent-lighten3);
    max-width: 300px;
    min-width: 150px;
    width: 50%;

    &:before {
      content: url('/arrow.svg');
      position: relative;
      padding-right: 0.25em;
    }
  }
}

#hero {
  height: 100vh;
  padding-bottom: 0;
  padding-top: 0;
  display: flex;
  align-items: center;

  .section-content {
    max-width: 1000px;
  }

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
    font-size: 1.25em;
    color: var(--v-primary-base);
    animation-delay: 0.25s;
  }

  h2 {
    animation-delay: 0.5s;
    font-size: clamp(40px, 8vw, 90px);
  }

  h3 {
    animation-delay: 0.75s;
    font-size: clamp(35px, 7vw, 80px);
    line-height: .9em;
    padding-bottom: 0.4em;
    color: var(--v-accent-lighten3);
  }

  p {
    animation-delay: 1s;
    line-height: 1.25em;
    font-size: 1em;
    padding-bottom: 2em;
    max-width: 650px;
  }

  button {
    $horizontal-padding: max(2em, 2.5vw);
    $vertical-padding: max(0.1em, 1.25vw);
    animation-delay: 1.25s;
    background-color: var(--v-secondary-base);
    text-transform: none;
    padding: $vertical-padding $horizontal-padding;
    font-size: clamp(14px, 3vw, 24px);
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

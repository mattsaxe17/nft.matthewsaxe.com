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

    <m-footer>
      <nuxt-content :document="footer" />
    </m-footer>
  </div>
</template>

<script>
export default {
  async asyncData({ $content }) {
    const hero = await $content('hero').fetch();
    const about = await $content('about').fetch();
    const projects = await $content('projects').fetch();
    const contact = await $content('contact').fetch();
    const footer = await $content('footer').fetch();

    return {
      hero,
      about,
      projects,
      contact,
      footer
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
    width: 90%;
    max-width: 1100px;

    .nuxt-content-container {
      max-width: 900px;
      padding: 0 2em;
      margin: auto;
    }
  }
}

.container {
  display: flex;
  align-items: center;
  flex-direction: column;

  @media (min-width: 960px) {
    flex-direction: row;
    align-items: flex-start;
  }

  #about-list-wrapper {
    padding: 1em;
    padding-bottom: 3em;

    ul {
      padding: 0 !important;
      display: flex;
      flex-wrap: wrap;
      list-style: none;
      width: 100%;

      li {
        display: flex;
        align-items: center;
        color: var(--v-accent-lighten3);
        width: 50%;
        padding: 0.2em 0;

        &:before {
          content: url('/arrow.svg');
          position: relative;
          padding-right: 0.25em;
        }
      }
    }
  }

  #about-image-wrapper {
    width: 350px;
    max-width: 95vw;
    border-radius: 0.6em;
    border: 3px solid var(--v-primary-base);
    margin-right: 1em;

    #about-image {
      width: 350px;
      max-width: 95vw;
      height: 100%;
      border-radius: 0.5em;
      filter: grayscale(1);
      transform: translate(1.5em, 3em);
      animation: out 0.5s backwards;
      flex-grow: 1;

      &:hover {
        animation: in 0.5s forwards;
      }
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

section#hero {
  height: 100vh;
  padding-bottom: 0;
  padding-top: 0;
  display: flex;
  align-items: center;

  .section-content {
    padding: 0;
    max-width: 100%;
    width: clamp(300px, 90vw, 1100px);
    display: flex;
    justify-content: center;

    .nuxt-content-container {
      max-width: 100%;
      width: clamp(300px, 90vw, 1100px);
    }
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
    font-size: clamp(35px, 6.5vw, 75px);
    line-height: 0.9em;
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
    font-size: clamp(14px, 3vw, 20px);
  }
}

@keyframes in {
  0% {
    transform: translate(1.5em, 3em);
  }
  100% {
    transform: translate(0.2em, 1em) scale(1.1);
    filter: grayscale(0.5);
  }
}

@keyframes out {
  0% {
    transform: translate(0.2em, 1em) scale(1.1);
    filter: grayscale(0.5);
  }
  100% {
    transform: translate(1.5em, 3em);
  }
}
</style>

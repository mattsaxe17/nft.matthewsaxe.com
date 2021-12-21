<template>
  <div id="project">
    <div id="image" :style="{ backgroundImage: `url('${image}')` }" :class="{ dark: $vuetify.theme.dark }">
      <div id="links">
        <a v-if="link" :href="link" target="_blank"><v-icon>mdi-open-in-new</v-icon></a>
        <a v-if="githubLink" :href="githubLink" target="_blank"><v-icon>mdi-github</v-icon></a>
      </div>
    </div>

    <div id="content">
      <p class="highlighted">Featured</p>
      <h3>{{ name }}</h3>
      <p class="description"><slot></slot></p>
      <p class="highlighted">{{ stack.join('&nbsp;&nbsp;&nbsp;') }}</p>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    image: {
      type: String,
      required: true,
    },
    name: {
      type: String,
      required: true,
    },
    link: {
      type: String,
      default: null,
    },
    githubLink: {
      type: String,
      default: null,
    },
    stack: {
      type: Array,
      required: true,
    },
  },
};
</script>

<style lang="scss">
#project {
  width: 100%;
  resize: horizontal;
  margin-bottom: 8em;
  box-shadow: 0px 0px 8px 2px rgba(0, 0, 0, 0.8);
  border-radius: 0.5em;

  &:hover {
    box-shadow: 0px 0px 8px 2px var(--v-accent-base);
  }

  p.description {
    font-size: 1.25em;
    color: var(--v-accent-darken3);
  }

  #image {
    position: relative;
    width: 100%;
    background-size: cover;
    padding-bottom: 52%;
    overflow: hidden;
    border-radius: 0.5em 0.5em 0 0;

    &:after {
      content: '\A';
      position: absolute;
      width: 100%;
      height: 100%;
      top: 0;
      left: 0;
      background: rgba(255, 255, 255, 0) !important;
      transition: all 0.5s;
      -webkit-transition: all 0.5s;
      -moz-transition: all 0.5s;
      z-index: 4;
    }

    &.dark {
      &:after {
        background: rgba(0, 0, 0, 0.7);
      }

      p.description {
        font-size: 1.25em;
        color: var(--v-accent-lighten3);
      }
    }

    #links {
      position: absolute;
      bottom: 0;
      right: 0;
      z-index: 10;
      padding: 0.75em;
      display: flex;
      justify-content: flex-end;

      a {
        text-decoration: none;
        margin-right: 0.25em;
        padding: 0.4em;
        border-radius: 100%;
        backdrop-filter: blur(10px);
      }
    }
  }

  #content {
    padding: 1.5em;

    h3 {
      font-size: 1.5em;
      padding-bottom: 0.5em;
    }

    p {
      &.highlighted {
        margin: 0;
        color: var(--v-primary-base);
      }
    }
  }

  #image.dark + #content {
    p.description {
      color: var(--v-accent-lighten3);
    }
  }
}
</style>

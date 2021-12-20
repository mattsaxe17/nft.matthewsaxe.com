<template>
  <div id="project">
    <div id="image" :style="{ backgroundImage: `url('${image}')` }" :class="{ dark: $vuetify.theme.dark }">
      <div id="content" class="d-none d-md-block">
        <p class="highlighted">Featured</p>
        <h3>{{ name }}</h3>
        <p class="description"><slot></slot></p>
        <p class="highlighted">{{ stack.join('&nbsp;&nbsp;&nbsp;') }}</p>
      </div>
      <div id="links">
        <a v-if="link" :href="link" target="_blank"><v-icon>mdi-open-in-new</v-icon></a>
        <a v-if="githubLink" :href="githubLink" target="_blank"><v-icon>mdi-github</v-icon></a>
      </div>
    </div>

    <div id="mobile-content" class="d-block d-md-none">
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
  box-shadow: 0px 0px 8px 2px rgba(0, 0, 0, 0.5);
  border-radius: 0.5em;

  &:hover {
    box-shadow: 0px 0px 8px 2px var(--v-accent-base);
  }

  p.description {
    font-size: 1.2em;
    color: var(--v-anchor-base);
  }

  #image {
    position: relative;
    width: 100%;
    background-size: cover;
    padding-bottom: 52%;
    border-radius: 0.5em;
    overflow: hidden;

    &:after {
      content: '\A';
      position: absolute;
      width: 100%;
      height: 100%;
      top: 0;
      left: 0;
      background: rgba(150, 150, 150, 0.2);
      transition: all 0.5s;
      -webkit-transition: all 0.5s;
      -moz-transition: all 0.5s;
      z-index: 4;
    }

    &.dark {
      &:after {
        background: rgba(0, 0, 0, 0.7);
      }
    }

    &:hover {
      opacity: 1;

      &:after {
        display: none;
      }

      #content {
        opacity: 0;
      }

      #links {
        a {
          background: rgba(255, 255, 255, 0.8);
          border-radius: 100%;

          i {
            color: black;
          }
        }
      }

      &.dark {
        opacity: .65;

        #links {
          a {
            background: rgba(0, 0, 0, 0.8);

            i {
              color: white;
            }
          }
        }
      }
    }

    #content {
      z-index: 5;
      position: absolute;
      padding: 3.5em;
      width: 100%;
      height: 100%;

      .description {
        text-shadow: 1px 1px 1px #000;
      }

      h3 {
        font-size: 2em;
        padding-bottom: 1em;
      }

      p {
        &.highlighted {
          margin: 0;
          color: var(--v-primary-base);
        }
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
      }
    }
  }

  #mobile-content {
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

    & + #image {
      margin-left: 2em;
    }
  }
}
</style>

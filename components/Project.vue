<template>
  <div id="project">
    <div id="image" :style="{ backgroundImage: `url('${image}')` }">
      <div id="content">
        <p class="highlighted">Featured</p>
        <h3>{{ name }}</h3>
        <p><slot></slot></p>
        <p class="highlighted">{{ stack.join('&nbsp;&nbsp;&nbsp;') }}</p>
      </div>
      <div id="links">
        <a v-if="link" :href="link" target="_blank"><v-icon>mdi-open-in-new</v-icon></a>
        <a v-if="githubLink" :href="githubLink" target="_blank"><v-icon>mdi-github</v-icon></a>
      </div>
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
      background: rgba(0, 0, 0, 0.7);
      transition: all 0.5s;
      -webkit-transition: all 0.5s;
      -moz-transition: all 0.5s;
      z-index: 4;
    }

    &:hover {
      opacity: 0.65;

      &:after {
        display: none;
      }

      #content {
        opacity: 0;
      }

      #links {
        a {
          background: rgba(0, 0, 0, 0.8);
          border-radius: 100%;
        }
      }
    }

    #content {
      z-index: 5;
      position: absolute;
      padding: 3.5em;
      width: 100%;
      height: 100%;

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
        padding: .4em;
      }
    }
  }
}
</style>

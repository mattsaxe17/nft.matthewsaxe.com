<template>
  <div id="social-bar" :class="{ right: position === 'right', left: position === 'left', fixed, 'd-none': desktopOnly, 'd-md-flex': desktopOnly }">
    <div>
      <a href="mailto:mattsaxe17@gmail.com" target="_blank">
        <v-icon>mdi-gmail</v-icon>
      </a>
    </div>
    <div>
      <a href="https://github.com/mattsaxe17" target="_blank">
        <v-icon>mdi-github</v-icon>
      </a>
    </div>
    <div>
      <a href="https://www.linkedin.com/in/mattsaxe17" target="_blank">
        <v-icon>mdi-linkedin</v-icon>
      </a>
    </div>
    <div>
      <a href="https://www.facebook.com/mattsaxe17" target="_blank">
        <v-icon>mdi-facebook</v-icon>
      </a>
    </div>
    <div>
      <a href="https://twitter.com/mattsaxe17" target="_blank">
        <v-icon>mdi-twitter</v-icon>
      </a>
    </div>
    <div>
      <a href="https://www.instagram.com/_mattsaxe_/" target="_blank">
        <v-icon>mdi-instagram</v-icon>
      </a>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    position: {
      type: String,
      required: true,
      validator: (val) => ['left', 'right'].includes(val),
    },
    fixed: {
      type: Boolean
    },
    desktopOnly: {
      type: Boolean
    }
  },
};
</script>

<style lang="scss">
#social-bar {
  width: 3em;
  position: absolute;
  bottom: 0;
  display: flex;
  flex-direction: column;
  align-items: center;
  z-index: 15;

  &.fixed {
    position: fixed;
  }

  &.hide {
    display: none;
  }

  a {
    text-decoration: none;
  }

  &.right {
    right: 25px;
  }

  &.left {
    left: 25px;
  }

  & > div {
    i {
      color: var(--v-accent-lighten3);
      padding: 0.35em 0;
      cursor: pointer;
    }

    &:hover {
      i {
        color: var(--v-primary-lighten2);
        font-size: 2em;
      }
    }
  }

  &:after {
    content: '';
    left: 50%;
    background-color: var(--v-accent-lighten3);
    display: block;
    width: 2px;
    height: 100px;
    margin: 0.5em auto 0 auto;
  }
}
</style>

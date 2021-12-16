<template>
  <div id="outer">
    <div id="inner" ref="inner">{{ options[currentInd] }}</div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      currentInterval: null,
      currentInd: 0,
    };
  },
  props: {
    options: {
      type: Array,
      required: true,
    },
    interval: {
      type: Number,
      default: 3000,
    },
  },
  mounted() {
    this.currentInterval = setInterval(() => {
      this.currentInd = this.currentInd === this.options.length - 1 ? 0 : this.currentInd + 1;
      this.$refs.inner.classList.remove('active');
      this.$refs.inner.classList.add('active');
    }, this.interval);
  },
  beforeDestroy() {
    this.currentInterval = null;
  },
};
</script>

<style lang="scss" scoped>
#outer {
  display: inline;
  //-webkit-perspective: 1em;
  //perspective: 1em;

  #inner {
    display: inline-block;
    position: relative;

    &.active {
      animation: rotateDownAnimation ease-in-out 3000ms infinite;
    }
  }
}

@keyframes rotateDownAnimation {
  0% {
    -webkit-transform: rotateX(90deg);
    transform: rotateX(90deg);
  }
  8% {
    -webkit-transform: rotateX(0deg);
    transform: rotateX(0deg);
  }
  92% {
    -webkit-transform: rotateX(0deg);
    transform: rotateX(0deg);
  }
  100% {
    -webkit-transform: rotateX(-90deg);
    transform: rotateX(-90deg);
  }
}
</style>

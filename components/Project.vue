<template>
  <div id="project">
    <div id="image"></div>
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
    details: {
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
  },
};
</script>

<style></style>

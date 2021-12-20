<template>
  <div class="section-header">
    <h2>
      <span class="number">
        {{ number }}.
      </span>
      {{ title }}
    </h2>
  </div>
</template>

<script>
export default {
  props: {
    number: {
      type: String,
      required: true
    },
    title: {
      type: String,
      required: true
    }
  }
}
</script>


<style lang="scss" scoped>
.section-header {
  display: flex;
  padding-bottom: 5em;

  .number {
    font-size: .8em;
  }

  h2 {
    width: 100%;
    display: flex;
    align-items: center;
    white-space: nowrap;
    gap: .5em;
    font-size: 1.75em;
    padding: 0 1em;

    span {
      color: var(--v-primary-base);
    }

    &::after {
      content: '';
      display: block;
      position: relative;
      height: 1px;
      background-color: var(--v-primary-base);
      width: 100%;
    }
  }
}
</style>

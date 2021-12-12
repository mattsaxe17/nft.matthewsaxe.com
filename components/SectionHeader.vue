<template>
  <div class="section-header">
    <h2>
      <span>
        <slot name="number"></slot>.
      </span>
      <slot></slot>
    </h2>
  </div>
</template>

<style lang="scss" scoped>
.section-header {
  display: flex;
  padding-bottom: 3em;

  h2 {
    width: 100%;
    display: flex;
    align-items: center;
    white-space: nowrap;
    gap: .5em;

    span {
      color: $primary-color;
    }

    &::after {
      content: '';
      display: block;
      position: relative;
      height: 1px;
      background-color: $medium-color;
      width: 100%;
    }
  }
}
</style>

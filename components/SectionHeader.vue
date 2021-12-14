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
      color: var(--v-primary-base);
    }

    &::after {
      content: '';
      display: block;
      position: relative;
      height: 1px;
      background-color: var(--v-medium-base);
      width: 100%;
    }
  }
}
</style>

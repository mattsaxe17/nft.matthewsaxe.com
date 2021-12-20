<template>
  <div class="container">
    <slot></slot>
  </div>
</template>

<style lang="scss">
.container {
  display: flex;
  align-items: center;
  flex-direction: column;

  @media (min-width: 960px) {
    flex-direction: row;
    align-items: flex-start;
  }
}
</style>

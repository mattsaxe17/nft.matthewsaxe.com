<template>
  <div id="nav-bar">
    <div id="menu">
      <portal-target name="wallet-header"></portal-target>

      <v-switch v-model="$vuetify.theme.dark" inset color="#e4602f">
        <template #label>
          <v-icon v-if="$vuetify.theme.dark">mdi-weather-night</v-icon>
          <v-icon v-else>mdi-white-balance-sunny</v-icon>
        </template>
      </v-switch>
    </div>
  </div>
</template>


<style lang="scss" scoped>
#nav-bar {
  height: 50%;
  display: flex;
  align-items: center;
}

#menu {
  display: flex;
  align-items: center;
  gap: 2em;
}
</style>

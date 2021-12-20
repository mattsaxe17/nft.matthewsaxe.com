<template>
  <div id="contact-container">
    <v-card elevation="4" width="100%">
      <v-card-title>By phone&nbsp;&nbsp;<v-icon>mdi-phone</v-icon></v-card-title>
      <v-card-text>{{ phoneText }}</v-card-text>
      <v-card-actions>
        <m-button :href="`tel:${phone}`" colored> Call me </m-button>
        <m-button :href="`sms:${phone}`" colored> Text me </m-button>
      </v-card-actions>
    </v-card>

    <v-card elevation="4" width="100%">
      <v-card-title>By email&nbsp;&nbsp;<v-icon>mdi-email</v-icon></v-card-title>
      <v-card-text>{{ emailText }}</v-card-text>
      <v-card-actions>
        <m-button :href="`mailto:${email}`" colored> Email me </m-button>
      </v-card-actions>
    </v-card>
  </div>
</template>

<script>
export default {
  props: {
    phone: {
      type: String,
      required: true,
    },
    email: {
      type: String,
      required: true,
    },
    phoneText: {
      type: String,
      required: true,
    },
    emailText: {
      type: String,
      required: true,
    },
  },
};
</script>

<style lang="scss" scoped>
#contact-container {
  display: flex;
  flex-direction: column;
  gap: 2em;

  button {
    background-color: var(--v-secondary-base);
  }
}
</style>

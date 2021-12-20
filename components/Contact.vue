<template>
  <m-container>
    <v-card elevation="4">
      <v-card-title>By phone&nbsp;&nbsp;<v-icon>mdi-phone</v-icon></v-card-title>
      <v-card-text>{{ phoneText }}</v-card-text>
      <v-card-actions>
        <m-button :href="`tel:${phone}`" colored> Call me </m-button>
        <m-button :href="`sms:${phone}`" colored> Text me </m-button>
      </v-card-actions>
    </v-card>

    <v-card elevation="4">
      <v-card-title>By email&nbsp;&nbsp;<v-icon>mdi-email</v-icon></v-card-title>
      <v-card-text>{{ emailText }}</v-card-text>
      <v-card-actions>
        <m-button :href="`mailto:${email}`" colored> Email me </m-button>
      </v-card-actions>
    </v-card>
  </m-container>
</template>

<script>
export default {
  props: {
    phone: {
      type: Number,
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

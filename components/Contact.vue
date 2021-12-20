<template>
  <m-container>
    <v-card elevation="4">
      <v-card-title>By phone&nbsp;&nbsp;<v-icon>mdi-phone</v-icon></v-card-title>
      <v-card-text>Call or text any time of the day. If I don't answer, please leave a message and I will get back to you as soon as I can.</v-card-text>
      <v-card-actions>
        <m-button :href="`tel:${phone}`" colored> Call me </m-button>
        <m-button :href="`sms:${phone}`" colored> Text me </m-button>
      </v-card-actions>
    </v-card>

    <v-card elevation="4">
      <v-card-title>By email&nbsp;&nbsp;<v-icon>mdi-email</v-icon></v-card-title>
      <v-card-text>Send me an email with the details of your project</v-card-text>
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
      required: true
    },
    email: {
      type: String,
      required: true
    } 
  }
};
</script>

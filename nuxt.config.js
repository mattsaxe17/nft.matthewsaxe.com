import colors from 'vuetify/es5/util/colors'

export default {
  // Target: https://go.nuxtjs.dev/config-target
  target: 'static',

  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    title: 'Matthew Saxe',
    htmlAttrs: {
      lang: 'en',
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: 'I\'m a freelance software engineer building fast, reponsive websites and applications in the Wilkes-Barre, PA area. My inbox is open, let\'s see what I can build for you.' },
      { name: 'format-detection', content: 'telephone=no' },
      { name: 'og:image', content: 'https://matthewsaxe.com/personal-site.png' },
      { name: 'og:image:type', content: 'image/png' },
      { name: 'og:description', content: 'I\'m a freelance software engineer building fast, reponsive websites and applications in the Wilkes-Barre, PA area. My inbox is open, let\'s see what I can build for you.' },
      { name: 'og:title', content: 'Matthew Saxe' },
      { name: 'og:url', content: 'https://matthewsaxe.com' },
    ],
    link: [{ rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }],
  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  css: ['~assets/scss/globals.scss'],

  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  plugins: [],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    // https://go.nuxtjs.dev/typescript
    '@nuxt/typescript-build',
    // https://go.nuxtjs.dev/vuetify
    '@nuxtjs/vuetify',
  ],

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    // https://go.nuxtjs.dev/content
    '@nuxt/content',
    '@nuxtjs/style-resources',
  ],

  styleResources: {
    scss: ['./assets/scss/*.scss'],
  },

  // Content module configuration: https://go.nuxtjs.dev/config-content
  content: {},

  // Vuetify module configuration: https://go.nuxtjs.dev/config-vuetify
  vuetify: {
    customVariables: ['~/assets/variables.scss'],
    theme: {
      dark: true,
      options: { customProperties: true },
      themes: {
        dark: {
          primary: '#EB5E28',
          accent: colors.grey.darken3,
          secondary: '#ED6D3C',
          info: colors.teal.lighten1,
          warning: colors.amber.base,
          error: colors.deepOrange.accent4,
          success: colors.green.accent3,
          background: '#252422',
          anchor: '#CCC5B9'
        },
        light: {
          primary: '#EB5E28',
          accent: colors.grey.darken4,
          secondary: '#ED6D3C',
          background: '#FFFCF2',
          anchor: '#252422',
        }
      },
    },
  },

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {},
}

module.exports = {
  root: true,
  env: {
    browser: true,
    node: true,
  },
  extends: ['@nuxtjs/eslint-config-typescript', 'plugin:nuxt/recommended', 'prettier'],
  plugins: [],
  // add your custom rules here
  rules: {},
  overrides: [
    {
      files: '*.sol',
      options: {
        printWidth: 250,
        tabWidth: 4,
        useTabs: false,
        singleQuote: true,
        bracketSpacing: false,
        explicitTypes: 'always',
      },
    },
  ],
};

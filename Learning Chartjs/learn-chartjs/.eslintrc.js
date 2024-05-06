module.exports = {
  root: true,
  env: {
    node: true
  },
  extends: [
    'plugin:vue/vue3-essential',
    '@vue/standard'
  ],
  parserOptions: {
    parser: '@babel/eslint-parser'
  },
  rules: {
    'no-console': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
    'no-debugger': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
    "vue/no-multiple-template-root":'off',
    'camelcase': 'off',
    '@typescript-eslint/camelcase': 'off',
    'eqeqeq': 'off',
    "no-tabs":"off",
    'no-irregular-whitespace': 'off',
    "space-before-function-paren": 0,
    "no-undef": "off"
  }
}

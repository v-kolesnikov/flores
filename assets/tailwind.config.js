// https://pragmaticstudio.com/tutorials/adding-tailwind-css-to-phoenix

module.exports = {
  mode: "jit",
  purge: [
    './js/**/*.js',
    '../lib/*_web/**/*.*ex'
  ],
  darkMode: false,
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}

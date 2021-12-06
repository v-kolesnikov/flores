// https://pragmaticstudio.com/tutorials/adding-tailwind-css-to-phoenix

module.exports = {
  mode: "jit",
  purge: [
    './js/**/*.js',
    '../lib/florinda_ctl/**/*.*ex',
    '../lib/florinda_web/**/*.*ex',
  ],
  darkMode: false,
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/forms'),
  ],
}

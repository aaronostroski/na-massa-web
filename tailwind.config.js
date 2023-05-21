const colors = require("tailwindcss/colors");

module.exports = {
  plugins: [require("@tailwindcss/forms"), require('@tailwindcss/aspect-ratio')],
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/javascript/**/*.js",
    "./config/initializers/heroicon.rb"
  ],
  theme: {
    container: {
      padding: '2rem'
    },
    colors: {
      ...colors,
      primary: {
        DEFAULT: '#ef4444',
        '50': '#fef2f2',  
        '100': '#fee2e2',
        '200': '#fecaca',
        '300': '#fca5a5',
        '400': '#f87171',
        '500': '#ef4444',
        '600': '#dc2626',
        '700': '#b91c1c',
        '800': '#991b1b',
        '900': '#7f1d1d',
      }
    },
  },
};

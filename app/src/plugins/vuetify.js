import Vue from 'vue'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'

Vue.use(Vuetify)

export default new Vuetify({
  icons: {
    iconfont: 'md',  // 'mdi' || 'mdiSvg' || 'md' || 'fa' || 'fa4'
  },
  theme: {
    dark: true,
  },
  themes: {
    dark: {
      "primary": "#ff7043",
      "secondary": "#424242",
      "accent": "#82B1FF",
      "error": "#FF5252",
      "info": "#2196F3",
      "success": "#4CAF50",
      "warning": "#FFC107"
    },
  },
})
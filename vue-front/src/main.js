import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'
import piniaPluginPersistedstate from 'pinia-plugin-persistedstate'

// Vuetify for Vue 3
import { createVuetify } from 'vuetify'
import 'vuetify/dist/vuetify.min.css'

// Bootstrap Vue 3
import BootstrapVue3 from 'bootstrap-vue-3'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue-3/dist/bootstrap-vue-3.css'

const app = createApp(App)
const pinia = createPinia()

pinia.use(piniaPluginPersistedstate)

// app.use(createPinia())
app.use(router)
app.use(pinia)

// Vuetify setup
const vuetify = createVuetify(/* options */)
app.use(vuetify)

// Bootstrap Vue 3 setup
app.use(BootstrapVue3);

app.mount('#app')

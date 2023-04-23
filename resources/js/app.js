import './bootstrap';

import router from './Router'
import store from './Store'
import {createApp} from 'vue'

import App from './App.vue'

const app = createApp(App)

app.use(router)
app.use(store)
app.mount('#app')

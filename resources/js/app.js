import Vue from 'vue'
import VueRouter from 'vue-router'
import VueAxios from 'vue-axios'
import axios from 'axios'
Vue.use(VueAxios, axios)
Vue.use(VueRouter)
import App from './views/App'
import Artists from './views/Artists'
import Home from './views/Home'
import Albums from './views/Albums'
import Artist from './views/Artist'

const router = new VueRouter({
    mode: 'history',
    routes: [
        {
            path: '/',
            name: 'home',
            component: Home
        },
        {
            path: '/artists',
            name: 'artists',
            component: Artists,
        },
        {
            path: '/albums',
            name: 'albums',
            component: Albums,
        }
        ,
        {
            path: '/artist/',
            name: 'artist',
            component: Artist,
        }
    ],
});

const app = new Vue({
    el: '#app',
    components: { App },
    router,
});
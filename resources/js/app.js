import Vue from 'vue'
import VueRouter from 'vue-router'
import VueAxios from 'vue-axios'
import axios from 'axios'

Vue.use(VueAxios, axios)
Vue.use(VueRouter)

import App from './views/App'
import Home from './views/Home'

import Artists from './views/Artists'
import Artist from './views/Artist'

import Albums from './views/albums/index'
import Album from './views/albums/show'
import AlbumCreate from './views/albums/create'
import AlbumEdit from './views/albums/edit'

import Song from './views/songs/show'
import SongCreate from './views/songs/create'
import SongEdit from './views/songs/edit'

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
            path: '/artist/:id',
            name: 'artist',
            component: Artist,
        },
        {
            path: '/albums',
            name: 'albums',
            component: Albums,
        },
        {
            path: '/album/:id',
            name: 'album',
            component: Album,
        },
        {
            path: '/album/create',
            name: 'albumCreate',
            component: AlbumCreate,
        },
        {
            path: '/album/edit/:id',
            name: 'albumEdit',
            component: AlbumEdit,
        },
        {
            path: '/song',
            name: 'song',
            component: Song,
        },
        {
            path: '/song/create',
            name: 'songCreate',
            component: SongCreate,
        },
        {
            path: '/song/edit/:id',
            name: 'songEdit',
            component: SongEdit,
        }
    ],
});

const app = new Vue({
    el: '#app',
    components: { App },
    router,
});
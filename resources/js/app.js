import Vue from 'vue'
import VueRouter from 'vue-router'
import VueAxios from 'vue-axios'
import axios from 'axios'

Vue.use(VueAxios, axios)
Vue.use(VueRouter)

import App from './views/App'
import Home from './views/Home'

import Artists from './views/artists/index'
import Artist from './views/artists/show'
import ArtistsCreate from './views/artists/create'

import Albums from './views/albums/index'
import Album from './views/albums/show'
import AlbumsCreate from './views/albums/create'
import AlbumEdit from './views/albums/edit'

import Song from './views/songs/show'
import SongsCreate from './views/songs/create'
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
            path: '/artists/create',
            name: 'artistCreate',
            component: ArtistsCreate,
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
            path: '/albums/create',
            name: 'albumCreate',
            component: AlbumsCreate,
        },
        {
            path: '/album/:id/edit',
            name: 'albumEdit',
            component: AlbumEdit,
        },
        {
            path: '/song/:id',
            name: 'song',
            component: Song,
        },
        {
            path: '/songs/create',
            name: 'songCreate',
            component: SongsCreate,
        },
        {
            path: '/song/:id/edit',
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
<template>
    <div>
        <h1>Milos Reviews</h1>

        <ul>
            <li><router-link :to="{ name: 'home' }">Accueil</router-link></li>
            <li><router-link :to="{ name: 'artists' }">Artistes</router-link></li>
            <li><router-link :to="{ name: 'albums' }">Albums</router-link></li>
        </ul>

        <div class="container">
            <router-view></router-view>
        </div>
        <footer><h3>Milos Reviews - Copyrights 2019</h3></footer>
    </div>
</template>
<script>
    export default {}
</script>
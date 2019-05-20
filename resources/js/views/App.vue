<template>
    <div>
        <h1>Milos Reviews</h1>

        <ul>
            <li><router-link :to="{ name: 'home' }">Home</router-link></li>
            <li><router-link :to="{ name: 'artists' }">Artists</router-link></li>
            <li><router-link :to="{ name: 'albums' }">Albums</router-link></li>
        </ul>

        <div class="container">
            <router-view></router-view>
        </div>
    </div>
</template>
<script>
    export default {}
</script>
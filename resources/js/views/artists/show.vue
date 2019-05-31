<template>
	<div class="artist-info">
        <img v-bind:src=artist.picture_src />
        <h2>{{ artist.nickname }}</h2>
        <p><i class="fas fa-map-marker-alt"></i> {{ artist.place }}</p>
        <p>{{ artist.bio }}</p>
        <h3> Albums : </h3>
        <div><router-link :to="{ name: 'albumCreate', query: { artist: artist.id }}">Ajouter un album</router-link></div>
        <div style="display:inline-block;">
          <div class="artist-album" v-for="album in artist.albums" :key="album.id">
            <a v-bind:href="'../album/'+album.id">
              <img v-bind:src=album.cover.src />
              <p>{{ album.title }}</p>
            </a>
          </div>
        </div>
        
	</div>
</template>
<script>
export default {
  data() {
    return {
      artist: null
      // autre data possible
    }
  },
  mounted () {
    this.axios
      .get(`http://127.0.0.1:8000/api/artists/${this.$route.params.id}`)
      .then(response => (this.artist = response.data))
  }
}
</script>
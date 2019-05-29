<template>
	<div class="artist-info">
        <img v-bind:src=album.cover.src />
        <h2>{{ album.title }} ({{ album.artist.nickname }})</h2>
        <h3>Morceaux : </h3>
        <a href="/song/create">Ajouter un nouveau son</a>
        <div v-for="song in album.songs" :key="song.id">
            <p>{{ song.title }}, {{ song.duration }}</p>
        </div>
	</div>
</template>
<script>
export default {
  data() {
    return {
      album: null
      // autre data possible
    }
  },
  mounted () {
    this.axios
      .get(`http://127.0.0.1:8000/api/albums/${this.$route.params.id}`)
      .then(response => (this.album = response.data))
  }
}
</script>
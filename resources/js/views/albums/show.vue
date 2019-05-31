<template>
	<div class="artist-info">
        <div id="left-album">
        <h2>{{ album.title }} ({{ album.artist.nickname }})</h2>  
        <img v-bind:src=album.cover.src />
        </div>
        <div id="album-content">
        <h3>Morceaux : </h3>
        <table>
        <tr v-for="song in album.songs" :key="song.id">
            <a :href="'../song/'+song.id"><td>{{ song.title }}</td> <td>{{ song.duration }}</td></a>
        </tr>
        </table>
        <a :href="'/songs/create?album=' + album.id + '&artist=' + album.artist.id "><span class='add-song'>Ajouter un nouveau son</span></a>
        </div>
	</div>
</template>
<script>
export default {
  data() {
    return {
      album: null
    }
  },
  mounted () {
    this.axios
      .get(`http://127.0.0.1:8000/api/albums/${this.$route.params.id}`)
      .then(response => (this.album = response.data))
  }
}
</script>
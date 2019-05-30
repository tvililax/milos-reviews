<template>
	<div class="song-info">
        <h2>{{ song.title }}</h2>
        <h3>{{ song.artist.nickname }}, {{ song.album.title }}</h3>

        <img class='cover-song' v-bind:src=song.album.cover.src />
        <h3> Paroles </h3>
        <p>{{ song.lyrics }}</p>
	</div>
</template>
<script>
export default {
  data() {
    return {
      song: null
      // autre data possible
    }
  },
  mounted () {
    this.axios
      .get(`http://127.0.0.1:8000/api/songs/${this.$route.params.id}`)
      .then(response => (this.song = response.data))
  }
}
</script>
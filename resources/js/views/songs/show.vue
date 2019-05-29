<template>
    <div class='artist-info'>
        <h2>{{ song.title }} ({{ song.duration }})</h2>
        <h3> {{ song.album.title }}, {{ song.artist.nickname }} </h3>
        <img v-bind:src=song.album.cover.src />
        <p>{{ song.lyrics }}</p>
	</div>
</template>
<script>
export default {
  data() {
    return {
      song: null
    }
  },
  mounted () {
    this.axios
      .get(`http://127.0.0.1:8000/api/songs/${this.$route.params.id}`)
      .then(response => (this.song = response.data))
  }
}
</script>
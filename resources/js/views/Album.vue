<template>
	<div class="artist-info">
        <img v-bind:src=album.cover.src />
        <h2>{{ album.title }}</h2>
        <p>{{ album.artist.nickname }}</p>
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
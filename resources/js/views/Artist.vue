<template>
	<div class="artist-info">
        <img v-bind:src=artist.picture_src />
        <h2>{{ artist.nickname }}</h2>
        <p><i class="fas fa-map-marker-alt"></i> {{ artist.place }}</p>
        <p>{{ artist.bio }}</p>
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
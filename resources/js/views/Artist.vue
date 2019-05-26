<template>
	<div class="artist-info">
        <img v-bind:src=artists[$route.params.id-1].picture_src />
        <h2>{{ artists[$route.params.id-1].nickname }}</h2>
        <p><i class="fas fa-map-marker-alt"></i> {{ artists[$route.params.id-1].place }}</p>
        <p>{{ artists[$route.params.id-1].bio }}</p>
	</div>
</template>
<script>
export default {
  data() {
    return {
      artists: null
      // autre data possible
    }
  },
  mounted () {
    this.axios
      .get('http://127.0.0.1:8000/api/artists')
      .then(response => (this.artists = response.data))
  }
}
</script>
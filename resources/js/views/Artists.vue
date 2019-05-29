<template>
	<div id="data-artists">
		<div class='artist' v-for="artist in results.data" :key="artist.id">
			<a v-bind:href="'artist/'+artist.id">
				<img v-bind:src=artist.picture_src />
				<p class="artist-name">{{ artist.nickname }}</p>
			</a>
		</div>
	</div>
</template>
<script>

export default {
  data() {
    return {
      results: null
      // autre data possible
    }
  },
  mounted () {
    this.axios
      .get('http://127.0.0.1:8000/api/artists')
      .then(response => (this.results = response.data))
  }
}
</script>
<template>
  <div id="data-artists">
		<div class='album' v-for="album in albums" :key="album.id">
			<a v-bind:href="'album/'+album.id">
				<img v-bind:src=album.cover.src />
				<p class="artist-name">{{ album.title }} ({{ album.artist.nickname }})</p>
			</a>
		</div>
	</div>
</template>
<script>

export default {
  data() {
    return {
      albums: null
      // autre data possible
    }
  },
  mounted () {
    this.axios
      .get('http://127.0.0.1:8000/api/albums')
      .then(response => (this.albums = response.data))
  }
}
</script>
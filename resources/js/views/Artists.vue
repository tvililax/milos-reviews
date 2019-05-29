<template>
	<!-- <div id='data-artists'>
		<a href='#'>
			<div class='artist'>
				<img src="http://www.chartsinfrance.net/communaute/uploads/monthly_2019_01/qui_est_bilal_hassani__le_chanteur_et_influenceur_qui_a_s__duit_janet_jackson___3375.jpeg_north_1200x_white.thumb.jpg.faf627183ba45dd2d8f126de2ccb692b.jpg" alt="#"/>
				<p class="artist-name">BILAL HASSANI</p>
			</div>
		</a>
	</div> -->
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
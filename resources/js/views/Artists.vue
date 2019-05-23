<template>
	<!-- <div id='data-artists'>
		<a href='#'>
			<div class='artist'>
				<img src="http://www.chartsinfrance.net/communaute/uploads/monthly_2019_01/qui_est_bilal_hassani__le_chanteur_et_influenceur_qui_a_s__duit_janet_jackson___3375.jpeg_north_1200x_white.thumb.jpg.faf627183ba45dd2d8f126de2ccb692b.jpg" alt="#"/>
				<p class="artist-name">BILAL HASSANI</p>
			</div>
		</a>
	</div> -->
	<ul id="example-1">
		<li v-for="artist in artists" :key="artist.id">
			{{ artist.first_name }}
		</li>
	</ul>
	
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
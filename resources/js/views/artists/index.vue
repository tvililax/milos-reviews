<template>
	<div id="data-artists">
    <div class='add-list' style="width:115px;"><router-link :to="{ name: 'artistCreate'}">Ajouter un artiste</router-link></div>
		<div class='artist' v-for="artist in results.data" :key="artist.id">
			<a v-bind:href="'artist/'+artist.id">
				<img v-bind:src=artist.picture_src />
				<p class="artist-name">{{ artist.nickname }}</p>
			</a>
		</div>

    <div class="pagination">
      <button class='page' v-on:click="fetchPaginateResults(pagination.prev_page_url)" :disabled="!pagination.prev_page_url"><i class="fas fa-angle-left"></i></button>
      <span>Page {{ pagination.current_page }} sur {{ pagination.last_page }}</span>
      <button class='page' v-on:click="fetchPaginateResults(pagination.next_page_url)" :disabled="!pagination.next_page_url"><i class="fas fa-angle-right"></i></button>
    </div>
	</div>
</template>
<script>

export default {
  data() {
    return {
      results: null,
      url: 'http://127.0.0.1:8000/api/artists?page=1',
      pagination: []
    }
  },
  methods: {
    getResults() {
      let $this = this
      this.axios
        .get(this.url)
        .then(response => {
          this.results = response.data
          $this.makePagination(response.data)
        })
    },
    makePagination(data) {
      let pagination = {
        current_page: data.current_page,
        last_page: data.last_page,
        next_page_url: data.next_page_url,
        prev_page_url: data.prev_page_url
      }

      this.pagination = pagination
    },
    fetchPaginateResults(url) {
      this.url = url
      this.getResults()
    }
  },
  mounted () {
    this.getResults()
  }
}
</script>
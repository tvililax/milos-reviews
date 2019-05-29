<template>
  <div id="data-albums">
		<div class='album' v-for="album in results.data" :key="album.id">
			<a v-bind:href="'album/'+album.id">
				<img v-bind:src=album.cover.src />
				<p class="artist-name">{{ album.title }} ({{ album.artist.nickname }})</p>
			</a>
		</div>

    <div class="pagination">
      <button v-on:click="fetchPaginateResults(pagination.prev_page_url)" :disabled="!pagination.prev_page_url">Previous</button>
      <span>Page {{ pagination.current_page }} sur {{ pagination.last_page }}</span>
      <button v-on:click="fetchPaginateResults(pagination.next_page_url)" :disabled="!pagination.next_page_url">Next</button>
    </div>
	</div>
</template>
<script>

export default {
  data() {
    return {
      results: null,
      url: 'http://127.0.0.1:8000/api/albums ',
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
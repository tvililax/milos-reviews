<template>
  <div id="data-albums">
    <form @submit="fetchSearchBarResults">
      <input type="text" name="title" id="title" placeholder="Search an album" v-model="query_search"><i style='margin-left: 5px;' class="fas fa-search"></i>
    </form>

    <div class='add-list'><router-link :to="{ name: 'albumCreate'}">Ajouter un album</router-link></div>
		<div class='album' v-for="album in results.data" :key="album.id">
			<a v-bind:href="'album/'+album.id">
				<img v-bind:src=album.cover.src />
				<p class="artist-name">{{ album.title }} - {{ album.artist.nickname }}</p>
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
      url: 'http://127.0.0.1:8000/api/albums?page=1',
      pagination: [],
      query_search: ''
    }
  },
  methods: {
    getResults(url) {
      let $this = this
      this.axios
        .get(url)
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
      this.getResults(this.url)
    },
    fetchSearchBarResults(e) {
      e.preventDefault();
      let url = `${this.url}&title=${this.query_search}`
      this.getResults(url)
    }
  },
  mounted () {
    this.getResults(this.url)
  }
}
</script>
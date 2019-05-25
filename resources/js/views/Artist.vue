<script>
let id = console.log(document.location.href.split('/')[4]);
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
<template>
	<div>
        <h1>pplsplplw</h1>
        <p>{{ artist[id].nickname }}</p>
	</div>
</template>
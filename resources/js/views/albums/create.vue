<template>
  <div class="album-create">
    <div style='float:left;'><router-link :to="{ name: 'albums'}">Retour</router-link></div><br>
      <form @submit="formSubmit">
        <div>
          <label for="title">Choisissez un nom :</label>
          <input type="text" name="title" id="title" v-model="title" required>
        </div>

        <div>
          <label for="cover">Choisissez une pochette d'album :</label>
          <input type="file" id="cover" ref="cover" v-on:change="handleFileUpload()" required>
        </div>

        <div>
          <label for="artist_id">Choisissez un artiste</label>
          <select id="artist_id" v-model="selected_artist">
              <option v-for="artist in artists" :key="artist.id" :value="artist.id">{{ artist.nickname }}</option>
          </select>
        </div>

        <div>
          <input type="submit" value="Créer">
        </div>
      </form>
      {{ error }}
  </div>
</template>
<script>
export default {
  data() {
    return {
      artists: null,
      types: null,
      title: '',
      cover: '',
      selected_artist: this.$route.query.artist ? this.$route.query.artist : '',
      error: null
    }
  },
  methods: {
    formSubmit(e) {
      e.preventDefault();

      let currentObj = this;
      let formData = new FormData();
      formData.append('cover', this.cover);
      formData.append('title', this.title);
      formData.append('artist_id', this.selected_artist);

      this.axios.post('http://127.0.0.1:8000/api/albums', formData,
      {
          headers: {
            'Content-Type': 'multipart/form-data'
          }
      })
      .then(function(response){
        currentObj.error = null;
        // TODO redirection
      })
      .catch(function(error){
        currentObj.error = error;
      });
    },
    handleFileUpload(){
      this.cover = this.$refs.cover.files[0];
    }
  },
  mounted () {
    this.axios
      .get(`http://127.0.0.1:8000/api/artists`)
      .then(response => (this.artists = response.data))

    this.axios
      .get(`http://127.0.0.1:8000/api/types`)
      .then(response => (this.artists = response.data))
  }
}
</script>
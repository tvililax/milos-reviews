<template>
  <div class="song-create">
      <form @submit="formSubmit">
        <div>
          <label for="title">Choisissez un nom :</label>
          <input type="text" name="title" id="title" v-model="title" required>
        </div>

        <div>
          <label for="duration">Choisissez un durée (format : HH:MM:SS) :</label>
          <input type="text" name="duration" id="duration" v-model="duration" required>
        </div>

        <div>
          <label for="artist_id">Choisissez un artiste</label>
          <select id="artist_id" v-model="selected_artist">
              <option v-for="artist in artists" :key="artist.id" :value="artist.id">{{ artist.nickname }}</option>
          </select>
        </div>

        <div>
          <label for="album_id">Choisissez un album</label>
          <select id="album_id" v-model="selected_album">
              <option v-for="album in albums" :key="album.id" :value="album.id">{{ album.title }}</option>
          </select>
        </div>

        <div>
          <input type="submit" value="Créer">
        </div>
      </form>
      <div style='color: green;' id="message"></div>
      {{ error }}
  </div>
</template>
<script>
export default {
  data() {
    return {
      albums: null,
      artists: null,
      title: '',
      duration: '',
      selected_artist: this.$route.query.artist,
      selected_album: this.$route.query.album,
      error: null
    }
  },
  methods: {
    formSubmit(e) {
      e.preventDefault();
      let currentObj = this;
      this.axios.post('http://127.0.0.1:8000/api/songs', {
          title: this.title,
          duration: this.duration,
          artist_id: this.selected_artist,
          album_id: this.selected_album
      })
      .then(function (response) {
        currentObj.error = null;
        document.querySelector("#message").innerHTML = 'Morceau ajouté !';
        // TODO redirect
      })
      .catch(function (error) {
          currentObj.error = error;
      });
    }
  },
  mounted () {
    this.axios
      .get(`http://127.0.0.1:8000/api/albums?page=all`)
      .then(response => (this.albums = response.data))

    this.axios
      .get(`http://127.0.0.1:8000/api/artists?page=all`)
      .then(response => (this.artists = response.data))
  }
}
</script>
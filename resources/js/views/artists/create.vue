<template>
  <div class="song-create">
    <div class="back"><router-link :to="{ name: 'artists'}">Retour</router-link></div>
      <form @submit="formSubmit" style="width: 50%; text-align:left; margin:0 auto;">
        <div>
          <label for="nickname">Nom de scène : *</label>
          <input type="text" name="nickname" id="nickname" placeholder="Entrer un nom de scène" v-model="nickname" required>
        </div>

        <div>
          <label for="bio">Biographie : *</label>
          <textarea id="bio" name="bio" rows="5" cols="33" v-model="bio"></textarea>
        </div>

        <div>
           <label for="place">Ville : *</label>
          <input type="text" name="place" id="place" placeholder="Entrer une ville" v-model="place" required>
        </div>

        <div>
          <label for="image">Lien d'image d'artiste : *</label>
          <input type="file" id="image" ref="image" v-on:change="handleFileUpload()" required>
        </div>

        <div>
          <label for="last_name">Nom :</label>
          <input type="text" name="last_name" id="last_name" placeholder="Entrer un nom" v-model="last_name">
        </div>

        <div>
          <label for="first_name">Prénom :</label>
          <input type="text" name="first_name" id="first_name" placeholder="Entrer un prénom" v-model="first_name">
        </div>

        <div>
          <label for="birthdate">Date d'anniversaire (format : YYYY-MM-DD) :</label>
          <input type="text" name="birthdate" id="birthdate" placeholder="Entrer une date" v-model="birthdate">
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
      nickname: '',
      last_name: '',
      first_name: '',
      place: '',
      bio: '',
      image: '',
      birthdate: null,
      error: null
    }
  },
  methods: {
    formSubmit(e) {
      e.preventDefault();

      let currentObj = this;
      let formData   = new FormData();

      formData.append('nickname', this.nickname);
      formData.append('last_name', this.last_name);
      formData.append('first_name', this.first_name);
      formData.append('place', this.place);
      formData.append('bio', this.bio);
      formData.append('image', this.image);
      formData.append('birthdate', this.birthdate);

      this.axios.post('http://127.0.0.1:8000/api/artists', formData,
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
      this.image = this.$refs.image.files[0];
    }
  }
}
</script>
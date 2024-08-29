<script setup>
import PulseLoader from "vue-spinner/src/PulseLoader.vue";
import { reactive, onMounted } from "vue";
import { useRoute, RouterLink, useRouter } from "vue-router";
import { useToast } from "vue-toastification";
import axios from "axios";

const route = useRoute();
const router = useRouter();
const toast = useToast();

const movieId = parseInt(route.params.id);

const state = reactive({
  movie: {},
  isLoading: true,
});

onMounted(async () => {
  try {
    const response = await axios.get(
      `https://mw-worker.hentati-ahmed03.workers.dev/movie/${movieId}`
    );
    state.movie = response.data;
    console.log(state.movie);
  } catch (error) {
    console.error("Error fetching movie", error);
  } finally {
    state.isLoading = false;
  }
});
;



</script>

<template>
  <div class="movie-detail-container">
    <div class="background-image">
      <img :src="state.movie.image_url" alt="Movie Poster" />
      <div class="overlay"></div>
      <!-- Gradient overlay added here -->
    </div>
    <div class="movie-info text-3xl text-extrabold">
      <h1 class="text-4xl">{{ state.movie.title }} ({{ state.movie.production_year }})</h1>
      
      <br />
      <!-- <p > {{state.movie.title }} </p> -->
      <p style="font-size: small; font-weight: 500" class="text-gray-200">
        <span v-if="state.movie.categories">
    <span v-for="(category, index) in JSON.parse(state.movie.categories || '[]')" :key="index">
      <span class="">{{ category }}</span>
      <span v-if="index < JSON.parse(state.movie.categories).length - 1">, </span>
    </span>
  </span>
        | {{ state.movie.meta_score }} Metascore | {{ state.movie.duration }}
      </p>
      <p style="font-size: medium">{{ state.movie.description }}</p>
      <p style="font-size: small; font-weight: 500" class="text-gray-200">
        Featuring :
        <span v-if="state.movie.actors">
    <span v-for="(actor, index) in JSON.parse(state.movie.actors || '[]')" :key="index">
      <span class="">{{ actor }}</span>
      <span v-if="index < JSON.parse(state.movie.actors).length - 1">, </span>
    </span>
  </span>
      </p>
      <p style="font-size: small; font-weight: 500" class="text-gray-200">
        Directed by : <span class="text-white">{{ state.movie.director }}</span>
      </p>
    </div>
  </div>
</template>

<style scoped>
html,
body {
  margin: 0;
  height: 100%;
}

.movie-detail-container {
  position: relative;
  color: white;
  text-align: left;
  height: 91.6vh; /* Cover the full viewport height */
  width: 100vw; /* Cover the full viewport width */
  overflow: hidden;

}

.background-image {
  width: 100%;
  height: 100%; /* Adjust to cover the full height of the container */
  overflow: hidden;
  position: absolute; /* Positioned absolutely within the container */
  top: 0;
  left: 0;
}

.background-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  filter: brightness(70%);
}

.overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(to right, rgba(0, 0, 0, 0.9), rgba(0, 0, 0, 0));
  pointer-events: none; /* Ensure the overlay doesn't interfere with other elements */
}

.movie-info {
  position: absolute;
  top: 300px;
  left: 130px;
  width: 600px;
  font-weight: 700;
  padding: 20px;
  z-index: 1; /* Ensure it appears above the background image */
  /* border-width: 1px;
  border-color: azure;
  border-radius: 10px; */
}

.movie-info h1 {
  font-size: 3rem;
  margin-bottom: 10px;
  font-weight: 700;
}

.movie-info p {
  font-size: 1.2rem;
  margin: 5px 0;
  font-weight: 700;
}

.movie-cast h3 {
  margin-top: 20px;
  font-size: 1.5rem;
}
</style>

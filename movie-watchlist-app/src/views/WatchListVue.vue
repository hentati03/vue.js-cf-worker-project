<script setup>
import MovieListing from '@/components/MovieListing.vue';
import { reactive, onMounted, ref } from 'vue';
import axios from 'axios';

const state = reactive({
  movies: [],
  selectedCategory: '',
});

const searchTerm = ref('');
const sortOption = ref('');

onMounted(async () => {
  try {
    const response = await axios.get('https://mw-worker.hentati-ahmed03.workers.dev/watchlist');
    state.movies = response.data;
  } catch (error) {
    console.error('Error fetching watchlist', error);
  }
});



</script>

<template>
  <div class="py-4 bg-gray-200 px-10">
    <div class="flex items-center gap-4 space-x-4">

    </div>
  </div>

  <div class="grid grid-cols-2  gap-6 px-40 bg-gray-200">
    <MovieListing
      v-for="movie in state.movies"
      :key="movie.id"
      :movie="movie"
    />
  </div>
</template>

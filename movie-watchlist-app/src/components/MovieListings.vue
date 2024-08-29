<script setup>
import axios from 'axios';
import MovieListing from './MovieListing.vue';
import PulseLoader from 'vue-spinner/src/PulseLoader.vue';
import { reactive, defineProps, watch, onMounted } from 'vue';

const props = defineProps({
  limit: Number,
  showButton: {
    type: Boolean,
    default: false,
  },
  filter: String,
  search: String,
  sort: String,
});

const state = reactive({
  movies: [],
  isLoading: true,
});

const fetchMovies = async () => {
  const categoryParam = props.filter ? `&category=${props.filter}` : '';
  const searchParam = props.search ? `&search=${props.search}` : '';
  const sortParam = props.sort ? `&sort=${props.sort}` : '';

  try {
    state.isLoading = true;
    const response = await axios.get(`https://mw-worker.hentati-ahmed03.workers.dev/movies?${categoryParam}${searchParam}${sortParam}`);
    state.movies = response.data;
  } catch (error) {
    console.error('Error fetching movies', error);
  } finally {
    state.isLoading = false;
  }
};

onMounted(fetchMovies);

watch([() => props.filter, () => props.search, () => props.sort], fetchMovies);
</script>

<template>
  <section class="bg-gray-200 py-10">
    <div class="grid gap-4 grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 px-4 py-4">
      <div v-if="state.isLoading" class="text-center text-gray-500 py-6">
        <PulseLoader />
      </div>
      <MovieListing
        v-for="movie in state.movies.slice(0, props.limit || state.movies.length)"
        :key="movie.id"
        :movie="movie"
      />
    </div>
  </section>

  <section v-if="props.showButton" class="m-auto max-w-lg my-10 px-6">
    <RouterLink
      to="/movies"
      class="block bg-black text-white text-center py-4 px-6 rounded-xl hover:bg-gray-700"
    >View All Movies</RouterLink>
  </section>
</template>
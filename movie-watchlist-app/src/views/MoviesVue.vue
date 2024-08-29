<script setup>
import MovieListings from '@/components/MovieListings.vue';
import { reactive, onMounted, ref, watch } from 'vue';
import axios from 'axios';

const state = reactive({
  categories: [],
  selectedCategory: '',
});

const searchTerm = ref('');
const sortOption = ref('');

onMounted(async () => {
  try {
    const response = await axios.get('https://mw-worker.hentati-ahmed03.workers.dev/categories');
    state.categories = response.data;
  } catch (error) {
    console.error('Error fetching categories', error);
  }
});

const handleSearch = () => {
  // Trigger a search when the search term changes
};

watch(() => state.selectedCategory, () => {
  // Trigger filtering when the category changes
});

watch(searchTerm, handleSearch);


</script>

<template>
  <div class="py-4 bg-gray-200 px-10">
    <div class="flex items-center gap-8 space-x-4">
      <select
        v-model="state.selectedCategory"
        name="CategoryFilter"
        id="CategoryFilter"
        class="w-1/4 shadow-md py-2.5 pr-5 px-4 rounded-lg border-gray-300 text-gray-700 sm:text-sm"
      >
        <option value="">Filter by genre</option>
        <option v-for="category in state.categories" :key="category.id" :value="category.name">
          {{ category.name }}
        </option>
      </select>

      <div class="relative shadow-md w-1/2">
        <label for="Search" class="sr-only">Search</label>
        <input
          v-model="searchTerm"
          type="text"
          id="Search"
          placeholder="Search for..."
          class="w-full px-4 rounded-md border-gray-200 py-2.5 pe-10 shadow-sm sm:text-sm"
        />
        <span class="absolute inset-y-0 end-0 grid w-10 place-content-center">
          <button @click="handleSearch" type="button" class="text-gray-600 hover:text-gray-700">
            <span class="sr-only">Search</span>
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-4">
              <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z"/>
            </svg>
          </button>
        </span>
      </div>

      <select
        v-model="sortOption"
        name="SortBy"
        id="SortBy"
        class="w-1/4 py-2.5 px-4 shadow-md rounded-lg border-gray-300 text-gray-700 sm:text-sm"
      >
        <option value="">Sort by...</option>
        <option value="Alphabetically">Alphabetically</option>
        <option value="MetaScoreAsc">Meta Score ascending</option>
        <option value="MetaScoreDesc">Meta Score descending</option>
        <option value="YearAsc">Year of release ascending</option>
        <option value="YearDesc">Year of release descending</option>
      </select>
    </div>
  </div>

  <div class="px-6 bg-gray-200">
    <MovieListings :filter="state.selectedCategory" :search="searchTerm" :sort="sortOption"/>
  </div>
</template>
<script setup>
  import Hero from '@/components/Hero.vue';
  import HomeCard from '@/components/HomeCard.vue';
  import MovieListings from '@/components/MovieListings.vue';
</script>

<template>
    <Hero/>
    <HomeCard/>
    <h1 class="text-5xl font-extrabold text-red-700 py-20 text-center">
      Top Watched Movies
    </h1>
    <MovieListings :limit="3" :showButton="true"/>
</template>
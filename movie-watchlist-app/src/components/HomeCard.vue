<script setup>
import { RouterLink } from 'vue-router';
import Card from '@/components/Card.vue';
</script>

<template>

<section class="bg-red-700 shadow-lg" >
    <div class="  px-4 py-4 ">
<div class="">
    <section class="py-4">
    <div class="container-xl lg:container m-auto">
      <div class="grid grid-cols-1 md:grid-cols-2 gap-14 p-4 rounded-lg">
        <Card>
          <h2 class="text-2xl font-bold">Explore</h2>
          <p class="mt-2 mb-4">
            View our list of all the new movies to find your perfect movie.
          </p>
          <RouterLink
            to="/movies"
            class="inline-block bg-black text-white rounded-lg px-4 py-2 hover:bg-gray-700"
          >
            Explore Movies
          </RouterLink>
        </Card>
        <Card bg="bg-gray-100">
          <h2 class="text-2xl font-bold">Your Watchlist</h2>
          <p class="mt-2 mb-4">
            Have a look at the movies you added to your watchlist
          </p>
          <RouterLink
            to="/watchlist"
            class="inline-block bg-red-700 text-white rounded-lg px-4 py-2 hover:bg-red-800"
          >
            watchlist
          </RouterLink>
        </Card>
      </div>
    </div>
  </section>


</div>
</div>

</section>

</template>



<script setup>
import { RouterLink, useRoute } from 'vue-router';

const isActiveLink = (routePath) => {
  const route = useRoute();
  return route.path === routePath;
};
</script>

<template>
<header class="bg-gray-200 py-2 shadow-md">
  <div class="mx-auto flex h-16 max-w-screen-xl items-center justify-between px-4 sm:px-6 lg:px-8">
    <!-- Logo on the left -->
    <a class="block text-red-600" href="#">
      <span class="sr-only">Home</span>
      <h1 class="text-xl font-extrabold sm:text-3xl" style="color: black;">
      Movie
      <strong class="font-extrabold text-red-700"> WatchList </strong>
    </h1>
    </a>

    <!-- Buttons on the right -->
    <div class="flex items-center gap-4">
      <div class="sm:flex sm:gap-4">
        <!-- <a
          class="block rounded-md bg-red-600 px-5 py-2.5 text-sm font-medium text-white transition hover:bg-red-700"
          href="#"
        >
          Home
        </a> -->

        <RouterLink
                to="/"
                :class="[
                  isActiveLink('/')
                    ? 'bg-gray-200 border-red-700 text-red-700 border'
                    : 'bg-red-700 text-gray-200',
                  '',
                  'px-5',
                  'py-2.5',
                  'rounded-md',
                  'text-sm',
                  'font-medium',
                  'shadow-md'
                ]"
                >Home</RouterLink>

                <RouterLink
                to="/movies"
                :class="[
                  isActiveLink('/movies')
                    ? 'bg-gray-200 border-red-700 text-red-700 border'
                    : 'bg-red-700 text-gray-200',
                  '',
                  'px-5',
                  'py-2.5',
                  'rounded-md',
                  'text-sm',
                  'font-medium'
                  ,
                  'shadow-md'
                ]"
                >Movies</RouterLink>
                <RouterLink
                to="/watchlist"
                :class="[
                  isActiveLink('/watchlist')
                    ? 'bg-gray-200 border-red-700 text-red-700 border'
                    : 'bg-red-700 text-gray-200',
                  '',
                  'px-5',
                  'py-2.5',
                  'rounded-md',
                  'text-sm',
                  'font-medium',
                  'shadow-md'
                ]"
                >My WatchList</RouterLink>
      </div>
<!-- 
      <button
        class="block rounded bg-gray-100 p-2.5 text-gray-600 transition hover:text-gray-600/75 md:hidden"
      >
        <span class="sr-only">Toggle menu</span>
        <svg
          xmlns="http://www.w3.org/2000/svg"
          class="size-5"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
          stroke-width="2"
        >
          <path stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 12h16M4 18h16" />
        </svg>
      </button> -->
    </div>
  </div>
</header>

</template>
<script setup>
import { ref, computed } from 'vue';
import { useToast } from 'vue-toastification';
import { RouterLink } from 'vue-router';



const props = defineProps({
  movie: Object,
});

const showFullDescription = ref(false);
const isSaved = ref(props.movie.is_saved);

const toggleFullDescription = () => {
  showFullDescription.value = !showFullDescription.value;
};

const truncatedDescription = computed(() => {
  let description = props.movie.description;
  return showFullDescription.value ? description : `${description.substring(0, 90)}...`;
});
const toast = useToast();

const toggleSave = async () => {
  // Toggle the isSaved state
  isSaved.value = !isSaved.value;

  try {
    // Call the function to update the save status in the backend
    await toggleSaveStatus(props.movie.id, isSaved.value);

    // Show a toast notification based on the new save status
    if (isSaved.value) {
      toast.success("Movie saved in the watchlist");
    } else {
      toast.success("Movie removed from the watchlist");
    }
  } catch (error) {
    console.error('Failed to update save status', error);
    toast.error("Failed to update save status");
  }
};

async function toggleSaveStatus(movieId) {
  const response = await fetch(`https://mw-worker.hentati-ahmed03.workers.dev/toggle-save?id=${movieId}`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
  });
  if (!response.ok) {
    throw new Error('Network response was not ok');
  }
}
</script>

<template>
  <article class="rounded-xl bg-white shadow-md relative lg:py-4 lg:px-2 hover:cursor-pointer">
    <i :class="['pi absolute right-4', isSaved ? 'pi-bookmark-fill' : 'pi-bookmark']" @click="toggleSave"></i>
    <RouterLink :to="`/movie/${movie.id}`"><i class="pi pi-info-circle absolute  right-10"></i></RouterLink>
    <div class="flex items-start py-4 sm:gap-8">
      <div class="hidden sm:grid size-32 lg:size-36 sm:size-30 sm:py-5 sm:px-4 sm:shrink-0 sm:place-content-center sm:rounded-full" aria-hidden="true">
        <img :src="movie.image_url" :alt="movie.image" />
      </div>
      <div>
        <RouterLink :to="`/movie/${movie.id}`">
          <h3 class="text-lg font-medium sm:text-xl">{{ movie.title }} ({{ movie.production_year }})</h3>
        </RouterLink>
        
        <p style="font-size: small; font-weight: 500" class="">
        <span v-if="movie.categories">
    <span v-for="(category, index) in JSON.parse(movie.categories || '[]')" :key="index">
      <span class="">{{ category }}</span>
      <span v-if="index < JSON.parse(movie.categories).length - 1">, </span>
    </span>
  </span>
        </p>
        <div :class="['absolute right-0 bottom-0 px-1 text-white text-extrabold', {
          'bg-red-600': movie.meta_score >= 0 && movie.meta_score <= 39,
          'bg-yellow-600': movie.meta_score >= 40 && movie.meta_score <= 60,
          'bg-green-600': movie.meta_score > 60
        }]">{{ movie.meta_score }}</div>
        <p class="mt-1 text-sm text-gray-700">{{ truncatedDescription }}</p>
        <div class="mt-4 sm:flex sm:items-center sm:gap-2">
          <div class="flex items-center gap-1 text-gray-500">
            <svg class="size-4" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
            </svg>
            <p class="text-xs font-medium">{{ movie.duration }}</p>
          </div>
        </div>
      </div>
    </div>
  </article>
</template>

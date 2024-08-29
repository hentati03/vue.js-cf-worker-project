import { createRouter, createWebHistory } from "vue-router";
import HomeView from "@/views/HomeView.vue";
import NotFoundView from "@/views/NotFoundView.vue";
import MoviesVue from "@/views/MoviesVue.vue";
import MovieDetailsVue from "@/views/MovieDetailsVue.vue";
import WatchListVue from "@/views/WatchListVue.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "home",
      component: HomeView,
    },
    {
      path: "/movies",
      name: "movies",
      component: MoviesVue,
    },
    {
      path: "/watchlist",
      name: "watchlist",
      component: WatchListVue,
    },
    {
      path: "/movie/:id",
      name: "movie",
      component: MovieDetailsVue,
    },
    {
      path: "/:catchAll(.*)",
      name: "not-found",
      component: NotFoundView,
    },
  ],
});

export default router;

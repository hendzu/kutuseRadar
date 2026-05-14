import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '@/views/HomeView.vue'
import MapView from "@/views/MapView.vue";
import AddPriceView from '@/views/AddPriceView.vue'
import LoginView from "@/views/LoginView.vue";
import RegisterView from "@/views/RegisterView.vue";
import MembershipView from "@/views/MembershipView.vue";
import StationView from "@/views/StationView.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'homeRoute',
      component: HomeView,
    }, {
      path: '/map',
      name: 'mapRoute',
      component: MapView,
    },
    {
      path: '/addprice',
      name: 'addPriceRoute',
      component: AddPriceView,
    },
    {
      path: '/login',
      name: 'login',
      component: LoginView,
    },
    {
      path: '/register',
      name: 'loginRoute',
      component: RegisterView,
    },
    {
      path: '/memberships',
      name: 'membershipRoute',
      component: MembershipView,
    },
    {
      path: '/station',
      name: 'stationRoute',
      component: StationView,
    },
  ],
})

export default router

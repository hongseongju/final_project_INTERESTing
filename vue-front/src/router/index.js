import { createRouter, createWebHistory } from 'vue-router';
import Home from '@/views/HomeView.vue';
import Login from '@/views/LogInView.vue';
import SignUp from '@/views/SignUpView.vue';
import BankMap from '@/views/BankMapView.vue';

const routes = [
  { path: '/', component: Home },
  { path: '/login', component: Login },
  { path: '/signup', component: SignUp },
  { path: '/bank_map', component: BankMap },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;

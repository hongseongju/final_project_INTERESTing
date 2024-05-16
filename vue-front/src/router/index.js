import { createRouter, createWebHistory } from 'vue-router';
import Home from '../views/HomeView.vue';
import Login from '../views/LogInView.vue';
import SignUp from '../views/SignUpView.vue';

const routes = [
  { path: '/', component: Home },
  { path: '/login', component: Login },
  { path: '/signup', component: SignUp },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;

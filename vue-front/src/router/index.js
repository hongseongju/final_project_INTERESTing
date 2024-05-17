import { createRouter, createWebHistory } from 'vue-router';
import { useAuthStore } from '@/stores/counter';
import Home from '@/views/HomeView.vue';
import Login from '@/views/LogInView.vue';
import SignUp from '@/views/SignUpView.vue';
import BankMap from '@/views/BankMapView.vue';
import Profile from '@/views/ProfileView.vue';

const routes = [
  { path: '/', name: 'Home', component: Home },
  { path: '/login', name: 'Login', component: Login },
  { path: '/signup', name: 'SignUp', component: SignUp },
  { path: '/bank_map', name: 'BankMap', component: BankMap },
  { path: '/profile', name: 'Profile', component: Profile },
];

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes,
});

router.beforeEach((to, from) => {
  const store = useAuthStore();
  if ((to.name === 'SignUp' || to.name === 'Login') && store.isLogin) {
    window.alert('이미 로그인이 되어 있습니다. (●ˇ∀ˇ●)');
    return { name: 'Home' };
  }
});

export default router;

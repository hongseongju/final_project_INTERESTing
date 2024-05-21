import { createRouter, createWebHistory } from 'vue-router';
import { useAuthStore } from '@/stores/counter';
import Home from '@/views/HomeView.vue';
import Login from '@/views/LogInView.vue';
import SignUp from '@/views/SignUpView.vue';
import BankMap from '@/views/BankMapView.vue';
import Profile from '@/views/ProfileView.vue';
import ExchangeRate from '@/views/ExchangeRateView.vue';
import Present from '@/views/PresentView.vue';
import InterestRate from '@/views/InterestRateView.vue';
import CashRecharge from '@/components/CashRecharge.vue';
import SavingsDetail from '@/components/SavingsDetail.vue';
import DepositDetail from '@/components/DepositDetail.vue';

// 게시판 관련 컴포넌트 추가
import ArticleList from '@/components/ArticleList.vue';
import ArticleDetail from '@/components/ArticleDetail.vue';
import ArticleForm from '@/components/ArticleForm.vue';
import ArticleView from '@/views/ArticleView.vue'; 

const routes = [
  { path: '/', name: 'Home', component: Home },
  { path: '/login', name: 'Login', component: Login },
  { path: '/signup', name: 'SignUp', component: SignUp },
  { path: '/bank_map', name: 'BankMap', component: BankMap },
  { path: '/profile', name: 'Profile', component: Profile },
  { path: '/exchange_rate', name: 'ExchangeRate', component: ExchangeRate },
  { path: '/present', name: 'Present', component: Present },
  { path: '/interest_rate', name: 'InterestRate', component: InterestRate },
  { path: '/cash-charge', name: 'CashRecharge', component: CashRecharge },
  { path: '/savings_detail', name: 'SavingsDetail', component: SavingsDetail },
  { path: '/deposit_detail', name: 'DepositDetail', component: DepositDetail },
  
  // 게시판 관련 경로 추가
  { path: '/articles', name: 'ArticleList', component: ArticleList },
  { path: '/articles/:id', name: 'ArticleDetail', component: ArticleDetail },
  { path: '/new-article', name: 'NewArticle', component: ArticleForm },
  { path: '/articles/view/:id', name: 'ArticleView', component: ArticleView },
  { path: '/articles/:id/edit', name: 'EditArticle', component: ArticleForm },
];

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes,
});

router.beforeEach((to, from, next) => {  // 'next' 파라미터 추가
  const store = useAuthStore();
  if ((to.name === 'SignUp' || to.name === 'Login') && store.isLogin) {
    window.alert('이미 로그인이 되어 있습니다. (●ˇ∀ˇ●)');
    next({ name: 'Home' });
  } else {
    next();  // 반드시 next()를 호출하여 라우터가 계속 진행되도록 합니다.
  }
});

export default router;

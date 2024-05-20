<template>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Features</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Pricing</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown link
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>





  <div>
    <nav>
      <RouterLink to="/">Home</RouterLink> |
      <RouterLink to="/bank_map">내 주변 은행</RouterLink> |
      <RouterLink to="/exchange_rate">환율 계산기</RouterLink> |
      <RouterLink to="/present">주식 선물하기</RouterLink> |
      <RouterLink to="/interest_rate">예적금 비교</RouterLink> |
      <div v-if="isLogin">
        <RouterLink to="/profile">Profile</RouterLink> |
        <button @click="logout">Logout</button>
      </div>
      <div v-else>
        <RouterLink to="/signup">회원가입</RouterLink> |
        <RouterLink to="/login">LogIn</RouterLink>
      </div>
    </nav>
    <RouterView />
  </div>
</template>

<script setup>
import { computed } from 'vue';
import { useAuthStore } from '@/stores/counter';
import { RouterLink, RouterView } from 'vue-router';


const authStore = useAuthStore();

const isLogin = computed(() => authStore.isLogin);

const logout = () => {
  authStore.logout();
};


const links = [
    'Dashboard',
    'Messages',
    'Profile',
    'Updates',
  ]

</script>

<script>
  export default {
    data: () => ({
      links: [
        'Dashboard',
        'Messages',
        'Profile',
        'Updates',
      ],
    }),
  }
</script>

<style scoped>
/* 스타일 추가 가능 */
</style>

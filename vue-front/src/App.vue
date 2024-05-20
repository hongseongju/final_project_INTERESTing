<template>
  <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
      <!-- RouterLink로 변경 -->
      <RouterLink class="navbar-brand font-weight-bold nav-link" to="/">INTERESTing</RouterLink>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <RouterLink class="nav-link" to="/bank_map">내 주변 은행</RouterLink>
          </li>
          <li class="nav-item">
            <RouterLink class="nav-link" to="/exchange_rate">환율 계산기</RouterLink>
          </li>
          <li class="nav-item">
            <RouterLink class="nav-link" to="/present">주식 선물하기</RouterLink>
          </li>
          <li class="nav-item">
            <RouterLink class="nav-link" to="/interest_rate">예적금 비교</RouterLink>
          </li>
        </ul>
        <ul class="navbar-nav">
          <li v-if="isLogin" class="nav-item">
            <RouterLink class="nav-link" to="/profile">Profile</RouterLink>
          </li>
          <li v-if="isLogin" class="nav-item">
            <button @click="logout" class="btn btn-link nav-link">Logout</button>
          </li>
          <li v-if="!isLogin" class="nav-item">
            <RouterLink class="nav-link" to="/signup">회원가입</RouterLink>
          </li>
          <li v-if="!isLogin" class="nav-item">
            <RouterLink class="nav-link" to="/login">LogIn</RouterLink>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <RouterView />
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
</script>

<style scoped>
.navbar.bg-body-tertiary {
  --bs-tertiary-bg-rgb: 1, 65, 91; /* 원하는 RGB 값으로 변경 */
  background-color: rgb(var(--bs-tertiary-bg-rgb)) !important;
}
.navbar-nav .nav-link {
  color: #fff !important; /* 텍스트 색상 변경 */
}
.navbar-nav .nav-link:hover {
  color: #CCEA8D !important; /* 링크 호버 색상 변경 */
}
.navbar-toggler {
  border-color: #fff !important; /* 토글 버튼 테두리 색상 변경 */
}
.font-weight-bold {
  font-weight: bold;
  color: #fff !important; /* 텍스트 색상 변경 */
}
</style>

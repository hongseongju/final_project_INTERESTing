<template>
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
</script>

<style scoped>
/* 스타일 추가 가능 */
</style>

<template>
    <div>
      <h1>프로필 페이지</h1>
      <div v-if="user">
        <p>Username: {{ user.username }}</p>
        <p>Nickname: {{ user.nickname }}</p>
        <p>Cash: {{ user.cash }}</p>
      </div>
      <div v-else>
        <p>사용자 정보가 없습니다.</p>
      </div>
    </div>
  </template>
  
  <script setup>
  import { computed, onMounted } from 'vue';
  import { useAuthStore } from '@/stores/counter';
  
  const authStore = useAuthStore();
  const user = computed(() => authStore.user);
  
  onMounted(() => {
    authStore.fetchUserDetails();
  });
  </script>
  
  <style scoped>
  /* 추가적인 스타일 정의 가능 */
  </style>
  
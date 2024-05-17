<template>
  <div>
    <h1>로그인</h1>
    <form @submit.prevent="logIn">
      <div>
        <label for="username">Username:</label>
        <input type="text" v-model.trim="username" id="username" required />
      </div>
      <div>
        <label for="password">Password:</label>
        <input type="password" v-model.trim="password" id="password" required />
      </div>
      <button type="submit">로그인</button>
    </form>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { useAuthStore } from '@/stores/counter';

const username = ref('');
const password = ref('');
const authStore = useAuthStore();

const logIn = () => {
  authStore.login({ username: username.value, password: password.value });
};
</script>

<style scoped>
/* 스타일 추가 가능 */
</style>

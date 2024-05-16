<template>
  <div>
    <h1>로그인</h1>
    <form @submit.prevent="login">
      <div>
        <label for="username">username : </label>
        <input type="text" v-model.trim="username" id="username" required />
      </div>
      <div>
        <label for="password">password : </label>
        <input type="password" v-model.trim="password" id="password" required />
      </div>
      <input type="submit" value="로그인" />
    </form>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { useAuthStore } from '@/stores/counter';

const username = ref('');
const password = ref('');
const store = useAuthStore();

const login = async () => {
  try {
    const payload = {
      username: username.value,
      password: password.value
    };
    await store.login(payload);
  } catch (error) {
    console.error('Login error:', error.response ? error.response.data : error.message);
  }
};
</script>

<style>
/* 스타일 추가 가능 */
</style>

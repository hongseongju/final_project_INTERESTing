<template>
  <div class="container mt-5 d-flex flex-column align-items-center">
    <div class="text-center mb-4">
      <h3 class="text-success">INTERESTing</h3>
    </div>
    <div class="card w-100 custom-card" style="max-width: 400px;">
      <div class="text-center mt-4 mb-3">
        <h4>로그인</h4>
      </div>
      <form @submit.prevent="logIn" class="p-3">
        <div class="form-group mb-3 position-relative">
          <label for="username" class="visually-hidden">아이디</label>
          <i class="bi bi-person input-icon"></i>
          <input type="text" class="form-control underline" v-model.trim="username" id="username" placeholder="아이디" required />
        </div>
        <div class="form-group mb-3 position-relative">
          <label for="password" class="visually-hidden">비밀번호</label>
          <i class="bi bi-lock input-icon"></i>
          <input type="password" class="form-control underline" v-model.trim="password" id="password" placeholder="비밀번호" required />
        </div>
        <br>
        <button type="submit" class="btn btn-custom w-100 custom-btn mb-2">LogIn</button>
        <div class="d-flex justify-content-between">
          <a href="#" class="link-custom">비밀번호 찾기</a>
          <a href="#" class="link-custom">아이디 찾기</a>
        </div>
      </form>
    </div>
  </div>
  <br><br><br><br><br><br><br>
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
.container {
  max-width: 400px;
  margin-top: 5rem;
}

.text-success {
  font-weight: bold;
}

.card {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  border-radius: 8px;
}

.custom-card {
  min-height: 400px; /* 카드의 최소 높이를 줄입니다 */
}

h4 {
  font-weight: bold;
  margin-bottom: 1rem; /* 제목 아래 여백을 줄입니다 */
}

.form-group {
  position: relative;
}

.form-control {
  height: 45px; /* 입력 필드의 높이를 줄입니다 */
  padding-left: 2.5rem;
  border: none;
  border-bottom: 2px solid #ced4da;
  border-radius: 0;
  box-shadow: none;
}

.form-control::placeholder {
  color: #6c757d;
}

.form-control:focus {
  outline: none;
  border-bottom: 2px solid black;
}

.input-icon {
  position: absolute;
  left: 0;
  top: 50%;
  transform: translateY(-50%);
  font-size: 1.25rem;
  padding-left: 0.5rem;
  color: #6c757d;
}

.custom-btn {
  height: 50px; /* 버튼 높이를 줄입니다 */
  font-size: 1.25rem;
}

input::placeholder {
  color: #ced4da;
  font-weight: 400;
}

button {
  background-color: #6c757d;
  color: white;
  border: none;
  border-radius: 4px;
  padding: 10px;
  transition: background-color 0.3s ease, color 0.3s ease;
}

button:hover {
  background-color: #5a6268;
  color: white;
}

button:active {
  background-color: #A6BC09 !important;
  color: white !important;
}

.link-custom {
  color: #6c757d;
  text-decoration: none;
  font-size: 0.875rem;
}

.link-custom:hover {
  text-decoration: underline;
  color: #01415B;
}
</style>

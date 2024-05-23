<template>
  <div class="container mt-5 d-flex flex-column align-items-center">
    <div class="text-center mb-4">
      <img src="../assets/interesting_logo.png" alt="" class="logo-img">
    </div>
    <div class="card w-100" style="max-width: 400px;">
      <div class="text-center mt-4 mb-4">
        <h4>회원가입</h4>
      </div>
      <form @submit.prevent="signup" class="p-4">
        <div class="form-group mb-4 position-relative">
          <label for="username" class="visually-hidden">아이디</label>
          <i class="bi bi-person input-icon"></i>
          <input type="text" class="form-control underline" v-model.trim="username" id="username" placeholder="아이디" required />
        </div>
        <div class="form-group mb-4 position-relative">
          <label for="nickname" class="visually-hidden">닉네임</label>
          <i class="bi bi-person-circle input-icon"></i>
          <input type="text" class="form-control underline" v-model.trim="nickname" id="nickname" placeholder="닉네임" />
        </div>
        <div class="form-group mb-4 position-relative">
          <label for="email" class="visually-hidden">이메일</label>
          <i class="bi bi-envelope input-icon"></i>
          <input type="email" class="form-control underline" v-model.trim="email" id="email" placeholder="이메일" required />
        </div>
        <div class="form-group mb-4 position-relative">
          <label for="password1" class="visually-hidden">비밀번호</label>
          <i class="bi bi-lock input-icon"></i>
          <input type="password" class="form-control underline" v-model.trim="password1" id="password1" placeholder="비밀번호" required />
        </div>
        <div class="form-group mb-4 position-relative">
          <label for="password2" class="visually-hidden">비밀번호 확인</label>
          <i class="bi bi-lock input-icon"></i>
          <input type="password" class="form-control underline" v-model.trim="password2" id="password2" placeholder="비밀번호 확인" required />
        </div>
        <br>
        <button type="submit" class="btn btn-custom w-100 custom-btn">Sign Up</button>
      </form>
    </div>
  </div>
  <br><br><br><br>
</template>

<script setup>
import { ref } from 'vue'
import { useAuthStore } from '@/stores/counter'

const username = ref(null)
const email = ref(null)
const password1 = ref(null)
const password2 = ref(null)
const nickname = ref(null)
const store = useAuthStore()

const signup = () => {
  if (password1.value !== password2.value) {
    alert('비밀번호가 일치하지 않습니다.')
    return
  }
  const payload = {
    username: username.value,
    email: email.value,
    password1: password1.value,
    password2: password2.value,
    nickname: nickname.value
  }
  store.signup(payload).then(response => {
    // 회원가입 성공 시 처리 로직
  }).catch(error => {
    // 회원가입 실패 시 처리 로직
    console.error(error)
  })
}
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

h4 {
  font-weight: bold;
}

.form-group {
  position: relative;
}

.form-control {
  height: 50px;
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
  height: 50px;
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

.logo-img {
  width: 70%;
}
</style>

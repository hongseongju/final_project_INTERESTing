<template>
  <div class="container mt-5 d-flex flex-column align-items-center">
    <div class="text-center mb-4">
      <h3 class="text-success">INTERESTing과 <br><span class="text-warning">'흥미로운'</span> 금융 생각</h3>
    </div>
    <div class="card w-100" style="max-width: 400px;">
      <form @submit.prevent="signup" class="p-4">
        <div class="form-group mb-4">
          <label for="username" class="visually-hidden">아이디</label>
          <div class="input-group">
            <span class="input-group-text no-border-right"><i class="bi bi-person"></i></span>
            <input type="text" class="form-control no-border-left" v-model.trim="username" id="username" placeholder="아이디" required />
          </div>
        </div>
        <div class="form-group mb-4">
          <label for="nickname" class="visually-hidden">닉네임</label>
          <div class="input-group">
            <span class="input-group-text no-border-right"><i class="bi bi-person-circle"></i></span>
            <input type="text" class="form-control no-border-left" v-model.trim="nickname" id="nickname" placeholder="닉네임" />
          </div>
        </div>
        <div class="form-group mb-4">
          <label for="email" class="visually-hidden">이메일</label>
          <div class="input-group">
            <span class="input-group-text no-border-right"><i class="bi bi-envelope"></i></span>
            <input type="email" class="form-control no-border-left" v-model.trim="email" id="email" placeholder="이메일" required />
          </div>
        </div>
        <div class="form-group mb-4">
          <label for="password1" class="visually-hidden">비밀번호</label>
          <div class="input-group">
            <span class="input-group-text no-border-right"><i class="bi bi-lock"></i></span>
            <input type="password" class="form-control no-border-left" v-model.trim="password1" id="password1" placeholder="비밀번호" required />
          </div>
        </div>
        <div class="form-group mb-4">
          <label for="password2" class="visually-hidden">비밀번호 확인</label>
          <div class="input-group">
            <span class="input-group-text no-border-right"><i class="bi bi-lock"></i></span>
            <input type="password" class="form-control no-border-left" v-model.trim="password2" id="password2" placeholder="비밀번호 확인" required />
          </div>
        </div>
        <button type="submit" class="btn btn-success w-100 custom-btn">Sign Up</button>
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

<style>
.container {
  max-width: 400px;
  margin-top: 5rem;
}

.text-success {
  font-weight: bold;
}

h1 {
  font-size: 2.5rem;
  font-weight: bold;
}

.card {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  border-radius: 8px;
}

.input-group-text {
  cursor: pointer;
  border-right: 0;
  height: 50px;
  display: flex;
  align-items: center;
  background-color: white;
}

.form-control {
  border-left: 0;
  height: 50px;
}

.input-group-text.no-border-right {
  border-right: 0;
  background-color: white;
}

.form-control.no-border-left {
  border-left: 0;
}
.custom-btn {
  height: 45px; /* 버튼 높이를 조정합니다 */
  font-size: 1.25rem; /* 버튼 텍스트 크기를 조정합니다 */
}

</style>

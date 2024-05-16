<template>
  <div>
    <h1>회원가입</h1>
    <form @submit.prevent="signup">
      <div>
        <label for="username">아이디 :</label>
        <input type="text" v-model.trim="username" id="username" required />
      </div>
      <div>
        <label for="email">이메일 :</label>
        <input type="email" v-model.trim="email" id="email" required />
      </div>
      <div>
        <label for="password1">비밀번호 :</label>
        <input type="password" v-model.trim="password1" id="password1" required />
      </div>
      <div>
        <label for="password2">비밀번호 확인 :</label>
        <input type="password" v-model.trim="password2" id="password2" required />
      </div>
      <div>
        <label for="nickname">닉네임 :</label>
        <input type="text" v-model.trim="nickname" id="nickname" />
      </div>
      <input type="submit" value="가입하기">
    </form>
  </div>
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

const signup = function () {
  const payload = {
    username: username.value,
    email: email.value,
    password1: password1.value,
    password2: password2.value,
    nickname: nickname.value
  }
  store.signup(payload)
}
</script>

<style>

</style>
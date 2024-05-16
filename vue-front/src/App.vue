<template>
    <div>
      <nav>
        <RouterLink to="/">Home</RouterLink> |
        <RouterLink to="/signup">회원가입</RouterLink> |
        <RouterLink to="/login">LogIn</RouterLink> |
        <RouterLink to="/bank_map">내 주변 은행</RouterLink>
      </nav>
    </div>
  <RouterView />
</template>

<script setup>
import { RouterLink, RouterView } from 'vue-router'
</script>

<style scoped>
</style>

<template>
  <main>
    <h1>예적금 금리 비교</h1>
    <div>
      <router-link to="/financial-products">한번에 보기</router-link>
        <SavingsRate />        
    </div>
  </main>
</template>


<script setup>
import SavingsRate from '../components/SavingsRate.vue'
</script>

<style scoped>
</style>


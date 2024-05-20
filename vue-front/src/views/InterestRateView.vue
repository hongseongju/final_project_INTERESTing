<template>
  <main>
    <h1>예적금 금리 비교</h1>
    <div>
      <router-link to="/savings_detail">한번에 보기</router-link>
      <div class="flex">
        <DepositRate />        
        <SavingsRate />
      </div>   
    </div>
  </main>
</template>


<script setup>
import DepositRate from '../components/DepositRate.vue'
import SavingsRate from '../components/SavingsRate.vue'
</script>

<style scoped>
</style>


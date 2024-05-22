<template>
  <main class="container">
    <div class="m-4">
    <h1>INTERESTing!한 예적금 비교</h1>
  </div>
    <div>
      <div class="flex">
        <div class="content">
        <router-link to="/deposit_detail">예금 상세 한번에 보기</router-link>
        <DepositRate />    
      </div> 
      <div class="content">
        <router-link to="/savings_detail">적금 상세 한번에 보기</router-link> 
        <SavingsRate />
      </div>
      </div>   
    </div>
  </main>
</template>


<script setup>
import DepositRate from '../components/DepositRate.vue'
import SavingsRate from '../components/SavingsRate.vue'
</script>

<style scoped>
h1 {
  margin-bottom: 20px;
  font-weight: bold;
  color: #019587;
}


.container {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.flex {
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  width: 100%;
}

.content {
  margin-left: 10px;
  margin-right: 10px;
  margin-bottom: 20px;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
}
</style>


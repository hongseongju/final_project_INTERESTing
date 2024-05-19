<template>
  <div>
    <h3>예금</h3>
    <ul v-if="deposits.length">
      <li v-for="deposit in deposits" :key="deposit.fin_prdt_cd">
        {{ deposit.fin_prdt_nm }} - {{ deposit.kor_co_nm }}
      </li>
    </ul>
  </div>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import axios from 'axios'

// 예금 데이터를 저장할 변수
const deposits = ref([])

// 예금 데이터를 가져오는 함수
const fetchDeposits = () => {
  axios.get('http://127.0.0.1:8000/api_savings/deposit/') 
    .then(response => {
      console.log('예금 데이터 조회 완료')
      deposits.value = response.data
    })
    .catch(error => {
      console.error('오류 발생: ', error)
    })
}

onMounted(() => {
  fetchDeposits()
})
</script>

<style scoped>
div {
  border: 1px solid rgb(188, 255, 157);
  border-radius: 10px;
  padding: 10px;
}

h3 {
  margin-top: 20px;
  color: #2c3e50;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  padding: 5px 0;
  border-bottom: 1px solid #ccc;
}
</style>

<template>
  <div>
      <h3>적금</h3>
      <ul v-if="savings.length">
          <li v-for="saving in savings" :key="saving.id">
              {{ saving }}
          </li>
      </ul>
  </div>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import axios from 'axios'

// 데이터 저장할 변수
const savings = ref([])

// HTTP 요청 보내고 데이터 가져오는 함수
const ExchangeData = () => {
  axios.get('http://127.0.0.1:8000/api_savings/')
  .then(response => {
      console.log('적금 데이터 조회 완료')
      savings.value = response.data
  })
  .catch(error => {
      console.error('오류 발생: ', error)
  })
}

onMounted(() => {
  ExchangeData()
})
</script>

<style scoped>
div {
  border: 1px solid rgb(188, 255, 157);
  border-radius: 10px;
}
</style>
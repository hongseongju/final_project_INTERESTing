<template>
  <div>
    <h2>예금 상품 정보</h2>
    <div v-if="financialProducts.length > 0" class="product">
      <div v-for="product in financialProducts" :key="product.fin_prdt_cd" >
        <div v-if="product.options && product.options.length > 0">
          <p>{{ product.fin_prdt_nm }}최소 {{ min_deposit(product.options) }}% ~ 최대 {{ max_deposit(product.options) }}%</p>
          <hr>
        </div>
      </div>
    </div>
    <div v-else>
      <p>금융 상품 정보를 불러오는 중입니다...</p>
    </div>
  </div>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import axios from 'axios'
import { useAuthStore } from '@/stores/counter'

// 예금 데이터를 저장할 변수
const deposits = ref([])

// 예금 데이터를 가져오는 함수
const fetchDeposits = () => {
  axios.get('http://127.0.0.1:8000/api_deposit/') 
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

// 예금 상세 정보 출력
const financialProducts = ref([])
  
  onMounted(() => {
    axios.get('http://127.0.0.1:8000/api_deposit/deposit_detail/')
      .then(response => {
        financialProducts.value = response.data
      })
      .catch(error => {
        console.error('Failed to fetch deposit detail:', error)
      })
  })
  
  const authStore = useAuthStore()

// 최소 및 최대 금리 계산 함수
const min_deposit = (options) => {
  let minRate = Number.POSITIVE_INFINITY
  for (const option of options) {
    minRate = Math.min(minRate, option.intr_rate)
    minRate = Math.min(minRate, option.intr_rate2)
  }
  return minRate
}

const max_deposit = (options) => {
  let maxRate = Number.NEGATIVE_INFINITY
  for (const option of options) {
    maxRate = Math.max(maxRate, option.intr_rate)
    maxRate = Math.max(maxRate, option.intr_rate2)
  }
  return maxRate
}

</script>

<style scoped>
.product {
  margin-bottom: 20px;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
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

<template>
  <div>
    <h2>예금 금리 RANKING</h2>
    <hr>
    <div v-if="sortedFinancialProducts.length > 0">
      <div v-for="product in sortedFinancialProducts" :key="product.fin_prdt_cd">
        <div v-if="product.options && product.options.length > 0">
          <div class="flex">
            <p class="left-align">{{ product.fin_prdt_nm }}</p>
            <p class="right-align">최소 {{ min_deposit(product.options) }}% ~ 최대 {{ max_deposit(product.options) }}%</p>
          </div>
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
import { onMounted, ref, computed } from 'vue'
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

// Computed 속성을 사용하여 내림차순 정렬
const sortedFinancialProducts = computed(() => {
  return financialProducts.value.slice().sort((a, b) => {
    const maxA = max_deposit(a.options)
    const maxB = max_deposit(b.options)
    return maxB - maxA
  })
})
</script>

<style scoped>
.product {
  margin-bottom: 20px;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

h2 {
  font-weight: bold;
  color: #A6BC09;
}

h3 {
  margin-top: 10px;
  color: #2c3e50;
}

.left-align {
  text-align: left;
  flex: 1;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  }

.right-align {
  text-align: right;
  flex: 1;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis; 
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

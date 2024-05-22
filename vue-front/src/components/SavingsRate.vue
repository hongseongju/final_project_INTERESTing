<template>
  <div>
    <h2>적금 금리 RANKING</h2>
    <hr>
    <div v-if="financialProducts.length > 0">
      <div v-for="product in sortedFinancialProducts" :key="product.fin_prdt_cd" >
        <div v-if="product.options && product.options.length > 0">
          <div class="flex">
            <p class="left-align">{{ product.fin_prdt_nm }}</p>
            <p class="right-align">최소 {{ min_savings(product.options) }}% ~ 최대 {{ max_savings(product.options) }}%</p>
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
import { ref, onMounted, computed } from 'vue'
import axios from 'axios'

// 적금 데이터를 저장할 변수
const savings = ref([])

// 적금 데이터를 가져오는 함수
const fetchSavings = () => {
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
  fetchSavings()
})

// 적금 상세 정보 출력
const financialProducts = ref([])

onMounted(() => {
  axios.get('http://127.0.0.1:8000/api_savings/savings_detail/')
    .then(response => {
      financialProducts.value = response.data
    })
    .catch(error => {
      console.error('Failed to fetch savings_details:', error)
    })
})

// 최소 및 최대 금리 계산 함수
const min_savings = (options) => {
  let minRate = Number.POSITIVE_INFINITY
  for (const option of options) {
    minRate = Math.min(minRate, option.intr_rate)
    minRate = Math.min(minRate, option.intr_rate2)
  }
  return minRate
}

const max_savings = (options) => {
  let maxRate = Number.NEGATIVE_INFINITY
  for (const option of options) {
    maxRate = Math.max(maxRate, option.intr_rate)
    maxRate = Math.max(maxRate, option.intr_rate2)
  }
  return maxRate
}

// 내림차순으로 정렬된 적금 상품
const sortedFinancialProducts = computed(() => {
  return financialProducts.value.slice().sort((a, b) => {
    const maxRateA = max_savings(a.options)
    const maxRateB = max_savings(b.options)
    return maxRateB - maxRateA
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
  margin-top: 20px;
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
<template>
  <div class="mb-5">
    <h2 class="mb-2">적금 명예의 전당</h2>
    <div v-if="topFinancialProducts.length > 0">
      <div>
        <h5 class="m-3">오늘 "{{ topFinancialProduct.fin_prdt_nm }}" 가입하면 이자가 {{ topFinancialProductInterest }}원 (세전, 백만원 기준)</h5>
      </div>
      <div class="parent">
        <ul>
          <li v-for="product in topFinancialProducts" :key="product.fin_prdt_cd" class="card child main-bar" style="width: 18rem;">
            <RouterLink class="nav-link" to="/interest_rate">
            <div class="card-body p-3">
              <h5>{{ product.fin_prdt_nm }}</h5>
            <div v-if="product.options && product.options.length > 0">
              <div class="product-details">
              <img :src="`/src/assets/bank_img/${product.kor_co_nm}.png`" alt="" class="product-image">
              <h6>금리 {{ min_deposit(product.options) }}% ~ {{ max_deposit(product.options) }}%</h6>
            </div>
          </div>
            </div>
          </RouterLink>
          </li>
        </ul>
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
  axios.get('http://127.0.0.1:8000/api_savings/')
    .then(response => {
      console.log('적금 데이터 조회 완료')
      deposits.value = response.data
    })
    .catch(error => {
      console.error('오류 발생: ', error)
    })
}

onMounted(() => {
  fetchDeposits()
})

// 적금 상세 정보 출력
const financialProducts = ref([])

onMounted(() => {
  axios.get('http://127.0.0.1:8000/api_savings/savings_detail')
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

// 최대 금리가 높은 상위 3개의 상품 계산
const topFinancialProducts = computed(() => {
  const productsWithMaxRate = financialProducts.value.map(product => {
    return {
      ...product,
      maxRate: max_deposit(product.options)
    }
  })

  // 최대 금리를 기준으로 정렬
  productsWithMaxRate.sort((a, b) => b.maxRate - a.maxRate)
  return productsWithMaxRate.slice(0, 3)
})

// 최고 금리 상품 계산
const topFinancialProduct = computed(() => {
  return topFinancialProducts.value[0] || {}
})

const topFinancialProductMaxRate = computed(() => {
  return Math.floor(topFinancialProduct.value.maxRate || 0)
})

// 최고 금리 상품의 이자를 계산하는 함수 (백만원 기준)
const topFinancialProductInterest = computed(() => {
  return Math.floor (1000000 * topFinancialProduct.value.maxRate || 0) / 100
  return formatInterest(interest)
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
color: #01415B;
font-weight: bold;
}

h3 {
margin-top: 20px;
color: #2c3e50;
}

h5 {
font-weight: bold;
color: #2c3e50;
}

h6 {
font-weight: bold;
color: #2c3e50;
padding-top: 15px;
}

ul {
list-style-type: none;
padding: 0;
}

li {
padding: 5px 0;
border-bottom: 1px solid #ccc;
}

.light-green {
background-color: #FAFFEE;
}

.parent {
  text-align: center;
}

.child {
  width: 200px;
  height: 100px;
  display: inline-block;
  margin: 20px;
}

.card {
  text-align: left;
  box-shadow: -5px 5px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
  border: none;
}

.product-details {
display: flex; /* 이미지와 금리를 가로로 정렬 */
align-items: center; /* 세로 중앙 정렬 */
}

.product-image {
margin-right: 10px; 
width: 50px;
height: 50px;
}

.main-bar {
position: relative;
font-size: 1.5rem;
font-weight: bold;
text-align: left;
border-radius: 10px;
padding: 1rem;
height: 150px;
flex: 1;
transition: 0.2s ease-in-out;
}

.main-bar:hover {
transform: perspective(1500px) rotateY(0deg);
box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.3);
cursor: pointer;
}

a.nav-link {
  text-decoration: none;
}
</style>

<template>
  <div>
    <h2>적금 상품 정보</h2>
    <div v-if="financialProducts.length > 0">
      <div v-for="product in financialProducts" :key="product.fin_prdt_cd" class="product">
        <h5>{{ product.fin_prdt_nm }} ({{ product.kor_co_nm }})</h5>
        <div v-if="product.options && product.options.length > 0">
          <ul>
            <li v-for="option in product.options" :key="option.id">
              <p>{{ option.intr_rate_type_nm }} {{ option.save_trm }}개월 {{ option.intr_rate }}% ~ {{ option.intr_rate2 }}%</p>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div v-else>
      <p>금융 상품 정보를 불러오는 중입니다...</p>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'
import { useAuthStore } from '@/stores/counter'

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

const authStore = useAuthStore()
</script>

<style scoped>
.product {
  margin-bottom: 20px;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
}
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

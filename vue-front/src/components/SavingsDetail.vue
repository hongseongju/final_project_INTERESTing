<template>
  <div class="container">
    <div class="mt-4">
      <h1>적금 한눈에 보기</h1>
    </div>
    <div class="m-3">
      <input type="text" v-model="searchQuery" placeholder="상품이름 또는 은행명을 검색하세요" class="search-input">
    </div>
    <div v-if="financialProducts.length > 0">
      <div v-for="product in financialProducts" :key="product.fin_prdt_cd" class="product shadow">
        <h2 class="m-3">{{ product.fin_prdt_nm }} [{{ product.kor_co_nm }}]</h2>
        <p>상품 코드: {{ product.fin_prdt_cd }}</p>
        <p>가입 방법: {{ product.join_way }}</p>
        <p>특별 조건: {{ product.spcl_cnd }}</p>
        <p>기타: {{ product.etc_note }}</p>
        <div v-if="product.options && product.options.length > 0">
          <ul>
            <div v-for="option in product.options" :key="option.id" class="content">
              <p>유형: {{ option.save_trm }}개월 ({{ option.intr_rate_type_nm }})</p>
              <p>기본 금리: {{ option.intr_rate }}%</p>
              <p>최대 금리: {{ option.intr_rate2 }}%</p>
            </div>
          </ul>
        </div>
      </div>
    </div>
    <div v-else>
      <p>검색 결과가 없습니다. (；′⌒`)</p>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue'
import axios from 'axios'
import { useAuthStore } from '@/stores/counter'

const financialProducts = ref([])
const searchQuery = ref('')

onMounted(() => {
  axios.get('http://127.0.0.1:8000/api_savings/savings_detail/')
    .then(response => {
      financialProducts.value = response.data
    })
    .catch(error => {
      console.error('Failed to fetch savings detail:', error)
    })
})

const authStore = useAuthStore()

const filteredProducts = computed(() => {
  return financialProducts.value.filter(product => {
    const searchLowerCase = searchQuery.value.toLowerCase()
    return (
      product.fin_prdt_nm.toLowerCase().includes(searchLowerCase) ||
      product.kor_co_nm.toLowerCase().includes(searchLowerCase)
    )
  })
})
</script>

<style>
div > h1 {
  font-weight: bold;
  color: #019587;
}

div > h2 {
  font-weight: bold;
}

.container {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.product {
  margin-bottom: 20px;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

.search-input {
  width: 400px; /* 입력 필드의 너비 */
  padding: 8px; /* 안쪽 여백 */
  border: 6px solid #A6BC09; /* 테두리 스타일 및 색상 */
  border-radius: 30px; /* 테두리를 둥글게 */
  outline: none; /* 포커스 테두리 제거 */
  text-align: center;
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

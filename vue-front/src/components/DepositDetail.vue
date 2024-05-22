<template>
  <div class="container">
    <div class="mt-4">
      <h1>금융 상품 정보</h1>
    </div>
    <div class="m-3">
      <input type="text" v-model="searchQuery" placeholder="상품이름 또는 은행명을 검색하세요" class="search-input">
    </div>
    <div v-if="filteredProducts.length > 0">
      <div v-for="product in filteredProducts" :key="product.fin_prdt_cd" class="product shadow">
        <h2 class="m-3">{{ product.fin_prdt_nm }} [{{ product.kor_co_nm }}]</h2>
        <p>상품 코드: {{ product.fin_prdt_cd }}</p>
        <p>가입 방법: {{ product.join_way }}</p>
        <p>특별 조건: {{ product.spcl_cnd }}</p>
        <p>기타: {{ product.etc_note }}</p>
        <div v-if="product.options && product.options.length > 0">
          <h3>옵션 리스트</h3>
          <ul>
            <li v-for="option in product.options" :key="option.id" class="content">
              <p>이자 유형: {{ option.intr_rate_type_nm }}</p>
              <p>저축 기간: {{ option.save_trm }}개월</p>
              <p>금리: {{ option.intr_rate }}%</p>
              <p>최대 금리: {{ option.intr_rate2 }}%</p>
              <button @click="subscribeToOption(option.id, 'deposit')">가입하기</button>
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
import { ref, onMounted, computed } from 'vue'
import axios from 'axios'
import { useAuthStore } from '@/stores/counter'

const financialProducts = ref([])
const searchQuery = ref('')

onMounted(() => {
  axios.get('http://127.0.0.1:8000/api_deposit/deposit_detail/')
    .then(response => {
      financialProducts.value = response.data
    })
    .catch(error => {
      console.error('Failed to fetch deposit details:', error)
    })
})

const authStore = useAuthStore()

const subscribeToOption = (optionId, type) => {
  if (!authStore.user) {
    alert('로그인이 필요합니다.');
    return;
  }

  const userId = authStore.user.id || authStore.user.pk;
  const url = type === 'savings' ? 'http://127.0.0.1:8000/accounts/subscribe_savings/' : 'http://127.0.0.1:8000/accounts/subscribe_deposit/';
  console.log('Request URL:', url);
  axios.post(url, { option_id: optionId, user_id: userId })
    .then(response => {
      alert('가입이 완료되었습니다.');
    })
    .catch(error => {
      console.error('Failed to subscribe:', error)
    })
}

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

.shadow {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
</style>

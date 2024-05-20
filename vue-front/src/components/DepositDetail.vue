<template>
    <div>
      <h1>금융 상품 정보</h1>
      <div v-if="financialProducts.length > 0">
        <div v-for="product in financialProducts" :key="product.fin_prdt_cd" class="product">
          <h2>{{ product.fin_prdt_nm }} ({{ product.kor_co_nm }})</h2>
          <p>상품 코드: {{ product.fin_prdt_cd }}</p>
          <p>가입 방법: {{ product.join_way }}</p>
          <p>특별 조건: {{ product.spcl_cnd }}</p>
          <p>기타: {{ product.etc_note }}</p>
          <div v-if="product.options && product.options.length > 0">
            <h3>옵션 리스트</h3>
            <ul>
              <li v-for="option in product.options" :key="option.id">
                <p>이자 유형: {{ option.intr_rate_type_nm }}</p>
                <p>저축 기간: {{ option.save_trm }}개월</p>
                <p>금리: {{ option.intr_rate }}%</p>
                <p>최대 금리: {{ option.intr_rate2 }}%</p>
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
  
  const financialProducts = ref([])
  
  onMounted(() => {
    axios.get('http://127.0.0.1:8000/api_savings/deposit_detail/')
      .then(response => {
        financialProducts.value = response.data
      })
      .catch(error => {
        console.error('Failed to fetch deposit detail:', error)
      })
  })
  
  const authStore = useAuthStore()
  </script>
  
  <style>
  .product {
    margin-bottom: 20px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
  }
  </style>
  
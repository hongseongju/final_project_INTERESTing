<template>
    <header>
        <div class="m-4">
            <h1>환율 계산</h1>
            <select v-model="selectedExchange" class="custom-border">
                <option :value="null">국가를 선택하세요</option>
                <option v-for="exchange in exchanges" :value="exchange" :key="exchange.id">
                    {{ exchange.cur_nm }}
                </option>
            </select>
            |
            <input type="text" v-model.number="amount" placeholder="환전할 금액" class="custom-border">
            {{ selectedExchange?.cur_unit }}은 {{ calculateResult }}원(₩) 입니다.
        </div>
    </header>

    <div class="m-4">
        <h4>오늘의 환율</h4>
        <div class="card-container">
            <div v-for="exchange in exchanges" :key="exchange.id" class="card">
                <div class="card-body m-3">
                    <h5 class="card-title">
                        <img :src="`/src/assets/flags/${exchange.id}.png`" alt="national image">
                        {{ exchange.cur_nm }}[{{ exchange.cur_unit }}]
                    </h5>
                    <h4 class="card-text">{{ exchange.deal_bas_r }}</h4>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { onMounted, ref, computed } from 'vue'
import axios from 'axios'

// 데이터 저장할 변수
const exchanges = ref([])
const selectedExchange = ref(null)
const amount = ref(null)

// HTTP 요청 보내고 데이터 가져오는 함수
const ExchangeData = () => {
    axios.get('http://127.0.0.1:8000/api_exchange_rate/')
    .then(response => {
        console.log('환율 데이터 조회 완료!(✿◡‿◡)')
        exchanges.value = response.data
    })
    .catch(error => {
        console.error('오류 발생: ', error)
    })
}

onMounted(() => {
    ExchangeData()
})

// 환율 계산 함수
const calculateResult = computed(() => {
    if (selectedExchange.value) {
        console.log(selectedExchange.value.id)
        const exchangeRate = (selectedExchange.value.id === 12 || selectedExchange.value.id === 13) ? parseFloat(selectedExchange.value.ttb) / 100 : parseFloat(selectedExchange.value.ttb)
        return Math.round(amount.value * exchangeRate)
    }
    return 0
})
</script>

<style scoped>
header {
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 10px;
  background-color: #f8f8f8;
  border-bottom: 1px solid #e2e2e2;
}

header h1 {
  margin: 0;
  font-size: 24px;
}

header .m-4 {
  display: flex;
  align-items: center;
  gap: 10px;
}

.custom-border {
  border: 1px solid #e2e2e2;
  padding: 5px;
  height: 41px;
  width: 250px;
  border-radius: 3px;
}

h4 {
    text-align: center;
    margin: 29px;
    color: #333;
}

.card-container {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
  justify-content: center;
}

.card {
  width: 18rem;
  border: 1px solid #e2e2e2;
  border-radius: 3px;
  overflow: hidden;
}

.card-body {
  padding: 10px;
  height: 100px;
}

.card-title {
  display: flex;
  align-items: center;
  gap: 10px;
  margin: 0;
  font-size: 16px; /* 폰트 크기 조정 */
  font-weight: bold; /* 폰트 굵기 조정 */
}

.card-title img {
  width: 30px;
  height: 30px;
}

.card-text {
  font-size: 18px; /* 폰트 크기 조정 */
  font-style: italic; 
  margin: 10px 0 0;
}

input, select {
  text-align: center;
  width: 150px;
  height: 20px;
}
</style>

<template>
    <div>
        <h3>인기 주식</h3>
        <ul v-if="stocks.length">
            <li v-for="stock in stocks" :key="stock.id">
                {{ stock }}
            </li>
        </ul>
    </div>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import axios from 'axios'

// 데이터 저장할 변수
const stocks = ref([])

// HTTP 요청 보내고 데이터 가져오는 함수
const StockData = () => {
    axios.get('http://127.0.0.1:8000/api_stock_list/popular/')
    .then(response => {
        console.log('인기 주식 데이터 조회 완료!')
        stocks.value = response.data
    })
    .catch(error => {
        console.error('오류 발생: ', error)
    })
}

onMounted(() => {
    StockData()
})
</script>
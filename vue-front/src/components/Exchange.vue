<template>
    <div>
        <h3>환율 계산하기</h3>
        <ul v-if="exchanges.length">
            <li v-for="exchange in exchanges" :key="exchange.id">
                {{ exchange }}
            </li>
        </ul>
    </div>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import axios from 'axios'

// 데이터 저장할 변수
const exchanges = ref([])

// HTTP 요청 보내고 데이터 가져오는 함수
const ExchangeData = () => {
    axios.get('http://127.0.0.1:8000/api_exchange_rate/')
    .then(response => {
        console.log(exchanges)
        console.log(exchanges.value)
        exchanges.value = response.data
    })
    .catch(error => {
        console.error('오류 발생: ', error)
    })
}

onMounted(() => {
    ExchangeData()
})
</script>

<style scoped>
div {
    border: 1px solid rgb(188, 255, 157);
    border-radius: 10px;
}
</style>
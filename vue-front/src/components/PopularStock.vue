<template>
<div>
    <h1>오늘의 인기 주식</h1>
    <div class="main-container">
        <ul v-if="stocks.length" class="main">
            <li v-for="stock in stocks" class="card main-bar" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">{{ stock.stockName }}</h5>
                    <h6 class="card-subtitle mb-2 text-body-secondary">{{ stock.compareToPreviousClosePrice }}원 {{ stock.text }} </h6>
                    <p class="card-text"><h3>{{ stock.closePrice }}원</h3></p>
                    <a href="#" class="btn btn-primary">선물하기</a>
                </div>
            </li>
        </ul>
    </div>
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

<style>

.main-container {
overflow-x: auto;
white-space: nowrap;
margin: 0 auto;
padding: 1rem;
}

.main {
display: inline-flex;
gap: 1rem;
padding: 0;
}

.main-bar {
position: relative;
font-size: 1.5rem;
font-weight: bold;
color: white;
text-align: left;
border-radius: 10px;
padding: 1rem;
height: 150px;
background-color: #00000052;
flex: 1;
transition: 0.2s ease-in-out;
}

.main-bar:hover {
transform: perspective(1500px) rotateY(20deg);
box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.6);
cursor: pointer;
}

.main-container::-webkit-scrollbar {
height: 10px;
}

.main-container::-webkit-scrollbar-thumb {
background: #888;
border-radius: 10px;
}

.main-container::-webkit-scrollbar-thumb:hover {
background: #555;
}

.community {
background-image: linear-gradient(30deg, #e3f8b6, #cadf2a, #808d1b);
padding-top: 200px; 
padding-bottom: 500px;
}
</style>
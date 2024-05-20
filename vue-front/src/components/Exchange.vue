<template>
    <div>
        <h3>환율 계산</h3>
        <select v-model="selectedExchange">
            <option :value="null">국가를 선택하세요</option>
            <option v-for="exchange in exchanges" :value="exchange"
            :key="exchange.id">
            {{  exchange.cur_nm  }}
            </option>
        </select>
        <input type="text" v-model.number="amount" placeholder="환전할 금액">{{ selectedExchange?.cur_unit }}은 {{ calculateResult.toFixed(2) }}원(\) 입니다
    </div>

    <div>
        <h3>오늘의 환율</h3>
        <ul v-if="exchanges.length">
            <div class="row">
                <div v-for="exchange in exchanges" :key="exchange.id" class="col">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">
                                <img :src="`/src/assets/flags/${exchange.id}.png`" alt="national image">
                                {{ exchange.cur_nm }}[{{ exchange.cur_unit }}]</h5>
                            <h4 class="card-text">{{ exchange.deal_bas_r }} </h4>
                        </div>
                    </div>
                    <!-- {{ exchange }} <br> -->
                </div>
        </div>
        </ul>
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
        return amount.value * exchangeRate
    }
    return 0
})

</script>

<style scoped>
img {
    width: 30px;
    height: 30px;
}
select {
    text-align:center;
    width:150px;
    height:20px;
}
input {
    text-align:center;
    width:100px;
    height:20px;
}

</style>
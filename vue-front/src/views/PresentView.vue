<template>
    <h1>주식 선물하기 페이지</h1>
    <header>
        <div class="text-container">
            <p class="white">소중한 사람에게 <br> 소중한 미래를</p>
            <h1 class="white">미래에서 기다릴게</h1>
        </div>
    </header>
    <router-link to="/cash-charge">캐시 충전하기</router-link>
    <PopularStock />
</template>

<script setup>
import { computed, onMounted } from 'vue';
import { useAuthStore } from '@/stores/counter';
import { RouterLink, RouterView } from 'vue-router';
import PopularStock from '../components/PopularStock.vue'
</script>

<style scoped>
header {
    background-image: url('../assets/stock_mainpage.jpg');
    background-size : contain;
    background-repeat: no-repeat;
    height: 100vh;
}
.text-container {
    position: absolute; /* 절대 위치로 설정 */
    top: 40%; /* 세로 이동 */
    left: 20%; /* 가로 이동 */
    transform: translate(-50%, -50%);     
}

.white {
    color: white;
}
</style>
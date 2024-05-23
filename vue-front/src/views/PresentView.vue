<template>
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
    background-image: url('../assets/stock_mainpage.webp');
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center; /* 이미지 중앙 배치 */
    height: 60vh;
}
.text-container {
    position: absolute; /* 절대 위치 설정 */
    top: 30%; /* 세로 이동 */
    left: 80%; /* 가로 이동 */
    transform: translate(-50%, -50%);     
}

.white {
    color: white;
}
</style>
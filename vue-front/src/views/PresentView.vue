<template>
    <div>
        <h1>주식 선물하기 페이지</h1>
        <router-link to="/cash-charge">캐시 충전하기</router-link>
    </div>
</template>

<script setup>
import { computed, onMounted } from 'vue';
import { useAuthStore } from '@/stores/counter';
import { RouterLink, RouterView } from 'vue-router';

</script>

<style scoped>

</style>
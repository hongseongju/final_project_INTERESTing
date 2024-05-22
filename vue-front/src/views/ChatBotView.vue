<template>
    <div class="container">
        <img src="`/src/assets/chatbot.png`" alt="chatbot image" class="m-2">
        <p>무엇이든 물어보세요!</p>
        <h1>INTERESTing 챗봇과 추천 예적금 찾기</h1>
    </div>
    <div>
        <ChatBot />     
    </div>
</template>

<script setup>
import ChatBot from '../components/ChatBot2.vue'
</script>

<style scoped>
img {
    width: 50px;
}
</style>
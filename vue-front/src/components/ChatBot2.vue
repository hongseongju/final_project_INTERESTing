<template>
    <div id="chat-container">
      <div id="chat-messages">
        <div v-for="(msg, index) in messages" :key="index" class="message" :class="{'user-message': msg.sender === '나', 'bot-message': msg.sender === '챗봇'}">
          <span>{{ msg.sender }}:</span> {{ msg.content }}
        </div>
      </div>
      <div id="user-input">
        <input v-model="userMessage" @keyup.enter="sendMessage" type="text" placeholder="메시지를 입력하세요" />
        <button @click="sendMessage">전송</button>
      </div>
    </div>
  </template>
  
  <script setup>
  import axios from 'axios';
  import { ref } from 'vue';
  
  const FIN_URL = 'http://127.0.0.1:8000/api_chat_bot/';
  const messages = ref([]);
  const userMessage = ref('');
  
  const sendMessage = function(){
    if (!userMessage.value.trim()) return;
    messages.value.push({ sender: '나', content: userMessage.value });
    axios({
      url: FIN_URL,
      method: 'get',
      params: {
        message: userMessage.value
      }
    })
    .then(response => {
      const responseMessage = response.data;
      messages.value.push({ sender: '챗봇', content: responseMessage });
    })
    .catch(error => {
      console.log(error);
      messages.value.push({ sender: '챗봇', content: '통신 오류입니다.' });
    });
    userMessage.value = '';
  };
  </script>
  
  <style scoped>
  #chat-container {
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
    border: 1px solid #ccc;
    border-radius: 10px;
    overflow: hidden;
    background-color: #f2f7f9;
}

#chat-messages {
  flex: 1;
  overflow-y: auto;
  padding: 10px;
  display: flex;
  flex-direction: column;
  gap: 5px;
}

.message {
  padding: 5px 10px;
  border-radius: 10px;
  background-color: #e0f7fa; /* 밝은 청록색 배경 */
  color: #004d40; /* 어두운 청록색 텍스트 */
  align-self: flex-start;
  max-width: 80%;
}

.user-message {
  background-color: #b2dfdb; /* 사용자의 메시지 색상 */
  align-self: flex-end;
}

.bot-message {
  background-color: #e0f7fa; /* 챗봇의 메시지 색상 */
}

#user-input {
  display: flex;
  padding: 5px; /* 패딩을 줄여 전송창 높이를 줄임 */
  border-top: 1px solid #ccc;
  background-color: #ffffff; /* 흰색 배경 */
}

#user-input input {     
  flex: 1;
  padding: 3px; /* 패딩을 줄여 전송창 높이를 줄임 */
  border: 1px solid #ccc;
  border-radius: 5px;
  outline: none;
}

#user-input button {
  border: none;
  background-color: #004d40; /* 어두운 청록색 */
  color: white;
  padding: 2px 2px; /* 패딩을 줄여 전송창 높이를 줄임 */
  margin-left: 5px;
  border-radius: 5px;
  cursor: pointer;
}
</style>

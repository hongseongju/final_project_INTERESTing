<template>
  <body>
      <div id="chat-container">
          <div id="chat-messages">
            <div v-for="(msg, index) in messages" :key="index" class="message">{{ msg.sender }}: {{ msg.content }}</div>
          </div>
          <div id="user-input">
            <input v-model="userMessage" @keyup.enter="sendMessage" type="text" placeholder="# 곧 결혼하는데 추전 예적금 상품 알려줘" />
            <button @click="sendMessage">전송</button>
          </div>
      </div>
  </body>
  </template>
  
  <script setup>
  import { ref } from 'vue'
  
  const messages = ref([])
  const userMessage = ref('')
  
  const OPENAI_API_KEY = import.meta.env.VITE_OPENAI_API_KEY
  
  // ChatGPT API 요청
  async function fetchAIResponse(prompt) {
      // API 엔드포인트 주소
      const apiEndpoint = 'https://api.openai.com/v1/chat/completions';
      const apiKey = OPENAI_API_KEY;
      
    // 대화 히스토리를 저장할 배열
    let chatHistory = []
  
    // 특정 문장에 비슷한 응답을 하도록 지침 추가
    const fixedPrompts = {
      "제일 예쁜 사람은 누구야?": "사용자가 '제일 예쁜 사람은 누구야?'와 비슷하게 말하면 '제일 예쁜 사람은 구고운씨인것 같아요'",
      "예쁜 사람": "사용자가 '예쁜 사람'과 비슷하게 물어하면 '구고운씨인것 같아요!'",
      "예쁜 사람에 대해 알려줘": "사용자가 '예쁜 사람에 대해 알려줘'와 비슷하게 말하면 '그것은 구고운'",
      "제일 영리한 쿼카는 누구야?":"사용자가'제일 ~한 쿼카 or 프레리독은 누구야?'와 비슷하게 말하면 '그건 바로 홍성주 님입니다.(✿◡‿◡)'로 답해주세요.",
      "김예운이 누구야?": "'김예운이 누구야?'라고 물어보면 '정말 대단하신 분이죠. 이 시대의 킹'",
      "싸피 강사님에 대해 알려줘": "'싸피 강사님'과 관련해서 물어보면 '싸피의 최고 강사님은 설무아, 그리고 윤채영이 있습니다'",
      "결혼":"'결혼 예적금 추천'과 비슷하게 물어보면 '결혼을 하면 자금이 많이 필요하기 때문에 높은 금리 혜택이 있는 예적금 상품을 추천해요!'"
    }
  
    let adjustedPrompt = prompt
  
    if (fixedPrompts[prompt]) {
      adjustedPrompt = fixedPrompts[prompt];
    } else {
      adjustedPrompt = `챗봇: 당신은 금리비교 사이트인 'INTERESTing'에서 금융상품을 알려주는 챗봇입니다(은행이 아닙니다). "${prompt}"에 적절히 짧게 답하고, 예적금 상품에 대해서 알려주면 잘 대답해주겠다고 해주세요. 또 금리 비교 하면서 적절한 상품을 알아보라고 홍보해주세요!(홍보는 한번만 해주세요.) 그리고 모든 답변은 100자 이내로 줄여서 답해주세요.`
    }
  
    // 히스토리 배열에 현재 메시지 추가
    chatHistory.push({ role: "user", content: adjustedPrompt });
  
    // API 요청에 사용할 옵션을 정의
    const requestOptions = {
        method: 'POST',
        // API 요청의 헤더를 설정
        headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${apiKey}`
        },
        body: JSON.stringify({
            model: "gpt-3.5-turbo",  // 사용할 AI 모델
            messages: chatHistory,  // 대화 히스토리 포함
            temperature: 0.6, // 모델의 출력 다양성
            max_tokens: 300, // 응답받을 메시지 최대 토큰(단어) 수 설정
            top_p: 1, // 토큰 샘플링 확률을 설정
            frequency_penalty: 0.5, // 일반적으로 나오지 않는 단어를 억제하는 정도
            presence_penalty: 0.5, // 동일한 단어나 구문이 반복되는 것을 억제하는 정도
            stop: ["Human"], // 생성된 텍스트에서 종료 구문을 설정
        }),
    };
    // API 요청후 응답 처리
    try {
        const response = await fetch(apiEndpoint, requestOptions);
        const data = await response.json();
        const aiResponse = data.choices[0].message.content;
        // 히스토리에 AI 응답 추가
        chatHistory.push({ role: "assistant", content: aiResponse });
        return aiResponse;
    } catch (error) {
    console.error('OpenAI API 호출 중 오류 발생:', error);
        return 'OpenAI API 호출 중 오류 발생';
    }
  }
  
  function addMessage(sender, message) {
    messages.value.unshift({ sender, content: message });
  }
  
  function sendMessage() {
    const message = userMessage.value.trim();
    if (message.length === 0) return;
    
    addMessage('나', message);
    userMessage.value = '';
  
    fetchAIResponse(message).then(aiResponse => {
      addMessage('챗봇', aiResponse);
    });
  }
  
  </script>
  
  <style scoped>
  body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
  }
  .message {
      border-top: 1px solid #ccc;
      padding: 10px;
      margin-top: 5px;
      background-color: #e6e6e6;
  }
  #chat-container {
      width: 400px;
      height: 600px;
      display: flex;
      flex-direction: column;
      border: 1px solid #ccc;
  }
  #chat-messages {
      flex: 1;
      overflow-y: auto;
      padding: 10px;
      display: flex;
      flex-direction: column-reverse;
  }
  #user-input {
      display: flex;
      padding: 10px;
  
  }
  #user-input input {
      flex: 1;
      padding: 10px;
      outline: none;
  }
  #user-input button {
      border: none;
      background-color: #1e88e5;
      color: white;
      padding: 10px 15px;
      cursor: pointer;
  }
  </style>
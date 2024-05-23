<template>
    <div v-if="showModal" class="modal-container">
      <div class="modal-content">
        <ChatBot2 />
      </div>
    </div>
  </template>
  
  <script setup>
  import ChatBot2 from './ChatBot2.vue';
  
  const props = defineProps({
    showModal: Boolean
  });
  </script>
  
  <style scoped>
  .modal-container {
    position: fixed;
    bottom: 70px; /* 버튼 위에 모달이 뜨도록 조정 */
    right: 20px;
    width: 300px; /* 컴팩트한 사이즈로 설정 */
    height: 450px; /* 높이를 조금 더 조정 */
    z-index: 1000;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
  }
  
  .modal-content {
    width: 100%;
    height: 100%;
    background: white;
    padding: 10px;
    border-radius: 10px; /* 조금 더 둥근 모서리 */
    position: relative;
    display: flex;
    flex-direction: column;
  }
  </style>
  
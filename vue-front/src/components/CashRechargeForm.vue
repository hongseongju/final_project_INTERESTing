<template>
    <div>
      <h2>Cash Recharge</h2>
      <form @submit.prevent="rechargeCash">
        <label for="amount">Enter amount:</label>
        <input type="number" id="amount" v-model="amount" required>
        <button type="submit">Recharge</button>
      </form>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        amount: ''
      };
    },
    methods: {
      rechargeCash() {
        axios.post('/api/cash-recharge/', { amount: this.amount })
          .then(response => {
            console.log(response.data.message); // 성공 메시지 출력
            // 캐시 충전 후 사용자 프로필을 업데이트할 수 있습니다.
          })
          .catch(error => {
            console.error(error.response.data.message); // 실패 메시지 출력
          });
      }
    }
  };
  </script>
  
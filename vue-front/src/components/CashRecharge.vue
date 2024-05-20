<template>
  <div>
    <h1>캐시 충전</h1>
    <form @submit.prevent="chargeCash">
      <div>
        <label for="amount">Amount:</label>
        <input type="number" v-model.number="amount" id="amount" required> <!-- .number 수식어 추가 -->
      </div>
      <button type="submit">충전</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios'
import { useAuthStore } from '@/stores/counter'

export default {
  data() {
    return {
      amount: 0
    }
  },
  methods: {
    chargeCash() {
      const payload = {
        amount: this.amount
      }
      axios.post('http://localhost:8000/accounts/charge-cash/', payload)
        .then(response => {
          console.log('캐시 충전 성공!', response.data)
          alert('캐시 충전이 완료되었습니다!\n확인 버튼을 누르면 선물하기 페이지로 이동합니다.'); // 팝업 표시
          setTimeout(() => {
            this.$router.push('/present'); // 1초 후 선물하기 페이지로 이동
          }, 1000); // 3000ms = 3초
        })
        .catch(error => {
          console.error('캐시 충전 실패:', error.response ? error.response.data : error.message)
          alert('캐시 충전 실패! 가능한 금액을 충전해 주세요.'); // 팝업 표시
        })
    }
  },
  setup() {
    const authStore = useAuthStore()
    return { authStore }
  }
}
</script>

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
        })
        .catch(error => {
          console.error('캐시 충전 실패:', error.response ? error.response.data : error.message)
        })
    }
  },
  setup() {
    const authStore = useAuthStore()
    return { authStore }
  }
}
</script>

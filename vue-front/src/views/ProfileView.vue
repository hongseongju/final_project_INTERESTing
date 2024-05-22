<template>
  <div>
    <h1>프로필 페이지</h1>
    <div v-if="user">
      <p>Username: {{ user.username }}</p>
      <p>Nickname: {{ user.nickname }}</p>
      <p>E-mail: {{ user.email }}</p>
      <p>Cash: {{ user.cash }}</p>
      <h2>가입한 적금 상품</h2>
      <ul>
        <li v-for="subscription in user.savings_subscriptions" :key="subscription.product_name">
          <p>상품 이름: {{ subscription.product_name }}</p>
          <p>은행: {{ subscription.bank_name }}</p>
          <p>이자 유형: {{ subscription.interest_type }}</p>
          <p>저축 기간: {{ subscription.save_term }}개월</p>
          <p>금리: {{ subscription.interest_rate }}%</p>
          <p>최대 금리: {{ subscription.max_interest_rate }}%</p>
        </li>
      </ul>
      <h2>가입한 예금 상품</h2>
      <ul>
        <li v-for="subscription in user.deposit_subscriptions" :key="subscription.product_name">
          <p>상품 이름: {{ subscription.product_name }}</p>
          <p>은행: {{ subscription.bank_name }}</p>
          <p>이자 유형: {{ subscription.interest_type }}</p>
          <p>저축 기간: {{ subscription.save_term }}개월</p>
          <p>금리: {{ subscription.interest_rate }}%</p>
          <p>최대 금리: {{ subscription.max_interest_rate }}%</p>
        </li>
      </ul>
      <router-link :to="{ name: 'EditProfile' }">
        <button>개인정보 수정</button>
      </router-link>
    </div>
    <div v-else>
      <p>사용자 정보가 없습니다.</p>
    </div>
  </div>
</template>

<script setup>
import { computed, onMounted } from 'vue';
import { useAuthStore } from '@/stores/counter';

const authStore = useAuthStore();
const user = computed(() => authStore.user);

onMounted(() => {
  authStore.fetchUserDetails();
});
</script>

<style scoped>
/* 추가적인 스타일 정의 가능 */
</style>

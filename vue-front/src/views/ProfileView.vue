<template>
  <div class="container mt-5">
    <h1 class="text-center mb-4">My Profile</h1>
    <div v-if="user" class="profile-container">
      <!-- 개인정보 섹션 -->
      <div class="profile-info">
        <h2>&nbsp;</h2>
        <div class="info-item">
          <i class="bi bi-person-fill"></i>
          <span>ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{ user.username }}</span>  
        </div>
        <div class="info-item">
          <i class="bi bi-person-circle"></i>
          <span>닉네임&nbsp;&nbsp;&nbsp;&nbsp;{{ user.nickname }}</span>
        </div>
        <div class="info-item">
          <i class="bi bi-envelope-fill"></i>
          <span>E-mail&nbsp;&nbsp;&nbsp;{{ user.email }}</span>
        </div>
        <div class="info-item">
          <i class="bi bi-cash"></i>
          <span>CASH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{ user.cash }}</span>
        </div>
        <router-link :to="{ name: 'EditProfile' }" class="edit-profile-link">
          <button class="btn btn-primary mt-3">개인정보 수정</button>
        </router-link>
      </div>
      <!-- 상품 섹션 -->
      <div class="profile-products">
        <div class="product-section">
          <p>가입한 적금 상품</p>
          <ul>
            <li v-for="subscription in user.savings_subscriptions" :key="subscription.product_name">
              <p><strong>상품 이름:</strong> {{ subscription.product_name }}</p>
              <p><strong>은행:</strong> {{ subscription.bank_name }}</p>
              <p><strong>이자 유형:</strong> {{ subscription.interest_type }}</p>
              <p><strong>저축 기간:</strong> {{ subscription.save_term }}개월</p>
              <p><strong>금리:</strong> {{ subscription.interest_rate }}%</p>
              <p><strong>최대 금리:</strong> {{ subscription.max_interest_rate }}%</p>
            </li>
          </ul>
        </div>
        <div class="product-section">
          <p>가입한 예금 상품</p>
          <ul>
            <li v-for="subscription in user.deposit_subscriptions" :key="subscription.product_name">
              <p><strong>상품 이름:</strong> {{ subscription.product_name }}</p>
              <p><strong>은행:</strong> {{ subscription.bank_name }}</p>
              <p><strong>이자 유형:</strong> {{ subscription.interest_type }}</p>
              <p><strong>저축 기간:</strong> {{ subscription.save_term }}개월</p>
              <p><strong>금리:</strong> {{ subscription.interest_rate }}%</p>
              <p><strong>최대 금리:</strong> {{ subscription.max_interest_rate }}%</p>
            </li>
          </ul>
        </div>
      </div>
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
.container {
  max-width: 2000px;
  margin: auto;
}

.profile-container {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  max-width: 1000px;
}

.profile-info, .profile-products {
  flex: 1;
  margin: 10px;
  padding: 20px;
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  width: 800px;
}

.profile-info {
  max-width: 45%;
}

.profile-products {
  max-width: 45%;
}

.profile-info h2, .profile-products h2 {
  margin-bottom: 20px;
}

.info-item {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}

.info-item i {
  margin-right: 10px;
  font-size: 1.2rem;
}

.product-section {
  margin-bottom: 20px;
}

.product-section ul {
  list-style: none;
  padding: 0;
}

.product-section li {
  margin-bottom: 10px;
  padding: 10px;
  border-bottom: 1px solid #ddd;
}

.edit-profile-link {
  display: block;
  text-align: center;
  margin-top: 20px;
}
</style>

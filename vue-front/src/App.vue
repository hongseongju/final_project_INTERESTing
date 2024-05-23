<template>
  <div>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
      <div class="container-fluid justify-content-center">
        <RouterLink class="navbar-brand nav-link" to="/">
          <img src="./assets/interesting_logo.png" alt="" class="logo-img">
        </RouterLink>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
          <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <RouterLink class="nav-link" to="/interest_rate">예적금 비교</RouterLink>
            </li>
            <!-- <li class="nav-item">
              <RouterLink class="nav-link" to="/chat_bot">예적금 AI 추천</RouterLink>
            </li> -->
            <li class="nav-item">
              <RouterLink class="nav-link" to="/present">주식 선물하기</RouterLink>
            </li>
            <li class="nav-item">
              <RouterLink class="nav-link" to="/bank_map">내 근처 은행</RouterLink>
            </li>
            <li class="nav-item">
              <RouterLink class="nav-link" to="/exchange_rate">환율 계산기</RouterLink>
            </li>
            <li class="nav-item">
              <RouterLink class="nav-link" to="/articles">커뮤니티</RouterLink>
            </li>
          </ul>
          <ul class="navbar-nav">
            <li v-if="isLogin" class="nav-item">
              <RouterLink class="nav-link" to="/profile">Profile</RouterLink>
            </li>
            <li v-if="isLogin" class="nav-item">
              <button @click="logout" class="btn btn-link nav-link">Logout</button>
            </li>
            <li v-if="!isLogin" class="nav-item">
              <RouterLink class="nav-link" to="/signup">회원가입</RouterLink>
            </li>
            <li v-if="!isLogin" class="nav-item">
              <RouterLink class="nav-link" to="/login">LogIn</RouterLink>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <RouterView />
    <img src="./assets/chatbot.png" alt="chatbot image" class="chat-button" @click="toggleModal">
    <ChatModal :showModal="showChatModal" />
  </div>
</template>

<script setup>
import { computed } from 'vue';
import { useAuthStore } from '@/stores/counter';
import { RouterLink, RouterView } from 'vue-router';
import { ref } from 'vue';
import ChatModal from './components/ChatModal.vue';

const authStore = useAuthStore();
const isLogin = computed(() => authStore.isLogin);

const showChatModal = ref(false);

const toggleModal = () => {
  showChatModal.value = !showChatModal.value;
};

const logout = () => {
  authStore.logout();
};
</script>

<style scoped>
.navbar.bg-body-tertiary {
  --bs-tertiary-bg-rgb: #fff;
  background-color: rgb(var(--bs-tertiary-bg-rgb)) !important;
}

.navbar-nav .nav-link {
  color: #01415B;
  font-weight: bold;
  position: relative;
  padding-bottom: 5px;
  transition: color 0.3s ease;
  text-decoration: none;
}

.navbar-nav .nav-link::after {
  content: '';
  position: absolute;
  left: 0;
  bottom: 0;
  width: 0;
  height: 3px;
  background-color: #01415B;
  transition: width 0.3s ease;
}

.navbar-nav .nav-link:hover::after {
  width: 100%;
}

.navbar-toggler {
  border-color: #fff !important;
}

.font-weight-bold {
  font-weight: bold;
  color: #01415B;
}

.navbar-collapse {
  display: flex;
  justify-content: center;
}

.navbar-nav {
  display: flex;
  flex-direction: row;
}

.logo-img {
  width: 130px;
  padding-left: 20px;
}

.chat-button {
  position: fixed;
  bottom: 20px;
  right: 20px;
  width: 50px; /* 이미지 크기 조정 */
  height: 50px;
  cursor: pointer;
  z-index: 1000;
}
</style>
